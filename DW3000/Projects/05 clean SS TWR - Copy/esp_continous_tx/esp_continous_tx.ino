#include "dw3000.h"

// connection pins
const uint8_t PIN_RST = 15;  // reset pin
const uint8_t PIN_IRQ = 4;   // irq pin
const uint8_t PIN_SS = 5;    // spi select pin


// Default communication configuration. We use default non-STS DW mode. */
static dwt_config_t config = {
  5,                /* Channel number. */
  DWT_PLEN_128,     /* Preamble length. Used in TX only. */
  DWT_PAC8,         /* Preamble acquisition chunk size. Used in RX only. */
  9,                /* TX preamble code. Used in TX only. */
  9,                /* RX preamble code. Used in RX only. */
  1,                /* 0 to use standard 8 symbol SFD, 1 to use non-standard 8 symbol, 2 for non-standard 16 symbol SFD and 3 for 4z 8 symbol SDF type */
  DWT_BR_6M8,       /* Data rate. */
  DWT_PHRMODE_STD,  /* PHY header mode. */
  DWT_PHRRATE_STD,  /* PHY header rate. */
  (129 + 8 - 8),    /* SFD timeout (preamble length + 1 + SFD length - PAC size). Used in RX only. */
  DWT_STS_MODE_OFF, /* STS disabled */
  DWT_STS_LEN_64,   /* STS length see allowed values in Enum dwt_sts_lengths_e */
  DWT_PDOA_M0       /* PDOA mode off */
};

/////////////////////////////////// resources for development ///////////////////////////////////////////////////////////////////////////////////////////

/* Hold copy of status register state here for reference so that it can be examined at a debug breakpoint. */
static uint32_t status_reg = 0;


static uint8_t tx_poll_msg[] = { 0x41, 0x88, 0, 'C', 'O', 'N', 'T', 'I', 'N','U','O', 'U', 'S', ' ', ' ', ' ' };
static uint8_t tx_resp_msg[] = {0x41, 0x88, 0, 0xCA, 0xDE, 'V', 'E', 'W', 'A', 0xE1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

//FEAME LENGTH CAN BE SET TO MAX OR TO THE LENFTH OF THE MESSAGE ARRAY
//#define FRAME_LENGTH (sizeof(tx_poll_msg) + FCS_LEN)  // The real length that is going to be transmitted
static uint8_t rx_buffer[FRAME_LEN_MAX];

/* Index to access some of the fields in the frames involved in the process. */
#define ALL_MSG_SN_IDX 2
#define Embedded_RX_TS_IDX 10
#define Embedded_TX_TS_IDX 14
#define RESP_MSG_TS_LEN 4

/* Frame sequence number, incremented after each transmission. */
static uint8_t frame_seq_nb = 0;

uint16_t frame_len;

#define RESP_RX_TIMEOUT_UUS 100000

//old timestamps
uint64_t o_ping_tx_ts,o_ping_rx_ts;
uint32_t o_rx_ts, o_tx_ts;


//current timestamps
uint64_t ping_tx_ts,ping_rx_ts;
uint32_t rx_ts, tx_ts;


/* Inter-frame delay period, in milliseconds. */
#define TX_DELAY_MS 10

extern dwt_txconfig_t txconfig_options;

/* Hold copies of computed time of flight and distance here for reference so that it can be examined at a debug breakpoint. */
static double tof;
static double distance;

static double count_s;
static double average_s;
static double sum_s;
////////////////////////////////////////////////////////////////////////////////////



void setup() {
  UART_init();
  
  /* Configure SPI rate, DW3000 supports up to 38 MHz */
  /* Reset DW IC */
  spiBegin(PIN_IRQ, PIN_RST);
  spiSelect(PIN_SS);

  delay(200);  // Time needed for DW3000 to start up (transition from INIT_RC to IDLE_RC, or could wait for SPIRDY event)



  while (!dwt_checkidlerc())  // Need to make sure DW IC is in IDLE_RC before proceeding
  {
    UART_puts("IDLE FAILED\r\n");
    while (1)
      ;
  }

  dwt_softreset();
  delay(200);

  if (dwt_initialise(DWT_DW_INIT) == DWT_ERROR) {
    UART_puts("INIT FAILED\r\n");
    while (1)
      ;
  }

  // Enabling LEDs here for debug so that for each TX the D1 LED will flash on DW3000 red eval-shield boards.
  dwt_setleds(DWT_LEDS_ENABLE | DWT_LEDS_INIT_BLINK);


  // Configure DW IC. See NOTE 5 below.
  if (dwt_configure(&config))  // if the dwt_configure returns DWT_ERROR either the PLL or RX calibration has failed the host should reset the device
  {
    UART_puts("CONFIG FAILED\r\n");
    while (1)
      ;
  }

  dwt_setrxtimeout(RESP_RX_TIMEOUT_UUS);

  /* Configure the TX spectrum parameters (power, PG delay and PG count) */
  dwt_configuretxrf(&txconfig_options);

  printf(" SETUP DONE \n\r");
  sum_s=0;
  count_s=0;

}

void loop() {


 simple_ping();
 

}


void simple_ping(){

  //delay between transmisson
  Sleep(TX_DELAY_MS);
  memset(rx_buffer, 0, sizeof(rx_buffer));

  /* Write frame data to DW IC and prepare transmission. See NOTE 7 below. */
  tx_poll_msg[ALL_MSG_SN_IDX] = frame_seq_nb;
  dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS_BIT_MASK);
  dwt_writetxdata(sizeof(tx_poll_msg), tx_poll_msg, 0); /* Zero offset in TX buffer. */
  dwt_writetxfctrl(sizeof(tx_poll_msg), 0, 0); /* Zero offset in TX buffer, ranging. */

  /* Start transmission, indicating that a response is expected so that reception is enabled automatically after the frame is sent and the delay
  * set by dwt_setrxaftertxdelay() has elapsed. */
  dwt_starttx(DWT_START_TX_IMMEDIATE | DWT_RESPONSE_EXPECTED);
  
  //wait for tx to complete
  while (!(dwt_read32bitreg(SYS_STATUS_ID ) & SYS_STATUS_TXFRS_BIT_MASK)) { };
  ping_tx_ts      = get_tx_timestamp_u64();
  


  /* The transmission is achieved correctly, poll for reception of a frame or error/timeout. See NOTE 8 below. */
  //primary response
  while (!((status_reg = dwt_read32bitreg(SYS_STATUS_ID)) & (SYS_STATUS_RXFCG_BIT_MASK | SYS_STATUS_ALL_RX_TO | SYS_STATUS_ALL_RX_ERR))){ };
  ping_rx_ts      = get_rx_timestamp_u64();


  //second ping
  dwt_starttx(DWT_START_TX_IMMEDIATE | DWT_RESPONSE_EXPECTED);

  //wait for tx to complete
  while (!(dwt_read32bitreg(SYS_STATUS_ID) & SYS_STATUS_TXFRS_BIT_MASK)) { };
  //waiting for the second response  
  while (!((status_reg = dwt_read32bitreg(SYS_STATUS_ID)) & (SYS_STATUS_RXFCG_BIT_MASK | SYS_STATUS_ALL_RX_TO | SYS_STATUS_ALL_RX_ERR))){ };



  /* Increment frame sequence number after transmission of the poll message (modulo 256). */
  frame_seq_nb++;

  if (status_reg & SYS_STATUS_RXFCG_BIT_MASK){

          /* Clear good RX frame event in the DW IC status register. */
          dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_RXFCG_BIT_MASK);
          /* A frame has been received, read it into the local buffer. */
          frame_len = dwt_read32bitreg(RX_FINFO_ID) & RXFLEN_MASK;
          //printf("packet received \n\r");
          dwt_readrxdata(rx_buffer, frame_len, 0);


          resp_msg_get_ts(&rx_buffer[Embedded_TX_TS_IDX], &tx_ts);          
          resp_msg_get_ts(&rx_buffer[Embedded_RX_TS_IDX], &rx_ts);
              
/*
          printf("ping sent at  %llu \n",ping_tx_ts);
          printf("ping read at  %lu  \n",rx_ts);
          printf("resp sent at  %lu  \n",tx_ts);
          printf("resp read at  %llu \n",ping_rx_ts);
*/
          float clockOffsetRatio ;
          int32_t rtd_init, rtd_resp;

          clockOffsetRatio = ((float)dwt_readclockoffset()) / (uint32_t)(1<<26);

          /* Compute time of flight and distance, using clock offset ratio to correct for differing local and remote clock rates */
          rtd_init = ping_rx_ts - ping_tx_ts;
          rtd_resp = tx_ts - rx_ts;

          tof = ((rtd_init - rtd_resp * (1 - clockOffsetRatio)) / 2.0) *  DWT_TIME_UNITS;
          distance = tof * SPEED_OF_LIGHT;

          sum_s=sum_s+distance;
          count_s=count_s+1;
          average_s=sum_s/count_s;
          printf("Distance  %3.2f m     ",distance);
          //printf("sum %f   \n", sum_s);
          
          /* Display computed distance on LCD. */
          printf("  count %f   ", count_s);          
          printf("average  %3.2f m     \n",average_s);
          
          if(count_s>100){
            count_s=0;
            sum_s=0;
          }
  }



}


/*****************************************************************************************************************************************************
 * NOTES:
 *
 * 1. In this example, maximum frame length is set to 127 bytes which is 802.15.4 UWB standard maximum frame length. DW IC supports an extended
 *    frame length (up to 1023 bytes long) mode which is not used in this example.
 * 2. Manual reception activation is performed here but DW IC offers several features that can be used to handle more complex scenarios or to
 *    optimise system's overall performance (e.g. timeout after a given time, automatic re-enabling of reception in case of errors, etc.).
 * 3. We use polled mode of operation here to keep the example as simple as possible, but RXFCG and error/timeout status events can be used to generate
 *    interrupts. Please refer to DW IC User Manual for more details on "interrupts".
 ****************************************************************************************************************************************************/
