#include "dw3000.h"


// connection pins

/*
const uint8_t PIN_RST = 15; // reset pin
const uint8_t PIN_IRQ = 4; // irq pin
const uint8_t PIN_SS = 5;   // spi select pin
*/

const uint8_t PIN_RST = 16; // reset pin
const uint8_t PIN_IRQ = 5; // irq pin
const uint8_t PIN_SS = 15;   // spi select pin


/* Default communication configuration. We use default non-STS DW mode. */
static dwt_config_t config = {
    5,               /* Channel number. */
    DWT_PLEN_128,    /* Preamble length. Used in TX only. */
    DWT_PAC8,        /* Preamble acquisition chunk size. Used in RX only. */
    9,               /* TX preamble code. Used in TX only. */
    9,               /* RX preamble code. Used in RX only. */
    1,               /* 0 to use standard 8 symbol SFD, 1 to use non-standard 8 symbol, 2 for non-standard 16 symbol SFD and 3 for 4z 8 symbol SDF type */
    DWT_BR_6M8,      /* Data rate. */
    DWT_PHRMODE_STD, /* PHY header mode. */
    DWT_PHRRATE_STD, /* PHY header rate. */
    (129 + 8 - 8),   /* SFD timeout (preamble length + 1 + SFD length - PAC size). Used in RX only. */
    DWT_STS_MODE_OFF,
    DWT_STS_LEN_64, /* STS length, see allowed values in Enum dwt_sts_lengths_e */
    DWT_PDOA_M0     /* PDOA mode off */
};

/* The frame sent in this example is an 802.15.4e standard blink. It is a 12-byte frame composed of the following fields:
 *     - byte 0: frame type (0xC5 for a blink).
 *     - byte 1: sequence number, incremented for each new frame.
 *     - byte 2 -> 9: device ID, see NOTE 1 below.
 */

/////////////////////////////////// resources for development ///////////////////////////////////////////////////////////////////////////////////////////
/* Hold copy of status register state here for reference so that it can be examined at a debug breakpoint. */
static uint32_t status_reg = 0;
 
static uint8_t tx_resp_msg[] = {0x41, 0x88, 0, 0xCA, 0xDE, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
static uint8_t tx_final_msg[] = { 0x41, 0x88, 0, 0xCA, 0xDE, 'W', 'A', 'V', 'E', 0x23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

//FEAME LENGTH CAN BE SET TO MAX OR TO THE LENFTH OF THE MESSAGE ARRAY
//#define FRAME_LENGTH (sizeof(tx_poll_msg) + FCS_LEN)  // The real length that is going to be transmitted
static uint8_t rx_buffer[FRAME_LEN_MAX];

/* Index to access some of the fields in the frames involved in the process. */
#define ALL_MSG_SN_IDX 2

#define FINAL_MSG_POLL_TX_TS_IDX  10
#define FINAL_MSG_RESP_RX_TS_IDX  14
#define FINAL_MSG_FINAL_TX_TS_IDX 18

#define RESP_MSG_TS_LEN 4

/* Frame sequence number, incremented after each transmission. */
static uint8_t frame_seq_nb = 0;

uint16_t frame_len;

#define RESP_RX_TIMEOUT_UUS 100000

//Time stamps for rx and tx
uint64_t poll_rx_ts,resp_tx_ts,final_rx_ts;

/* Hold copies of computed time of flight and distance here for reference so that it can be examined at a debug breakpoint. */
static double tof;
static double distance;


/* Inter-frame delay period, in milliseconds. */
#define TX_DELAY_MS 10

extern dwt_txconfig_t txconfig_options;

////////////////////////////////////////////////////////////////////////////////////


void setup()
{
  UART_init();


  /* Configure SPI rate, DW3000 supports up to 38 MHz */
  /* Reset DW IC */
  spiBegin(PIN_IRQ, PIN_RST);
  spiSelect(PIN_SS);

  delay(200); // Time needed for DW3000 to start up (transition from INIT_RC to IDLE_RC, or could wait for SPIRDY event)

  dwt_softreset();
  delay(200);

  while (!dwt_checkidlerc()) // Need to make sure DW IC is in IDLE_RC before proceeding
  {
    test_run_info((unsigned char *)"IDLE FAILED02\r\n");
    while (100)
      ;
  }
  while (!dwt_checkidlerc()) // Need to make sure DW IC is in IDLE_RC before proceeding
  {
    test_run_info((unsigned char *)"IDLE FAILED02\r\n");
    while (100)
      ;
  }

 if (dwt_initialise(DWT_DW_INIT) == DWT_ERROR)
  {
    test_run_info((unsigned char *)"INIT FAILED\r\n");
    while (100)
      ;
  }

  // Enabling LEDs here for debug so that for each TX the D1 LED will flash on DW3000 red eval-shield boards.
  dwt_setleds(DWT_LEDS_ENABLE | DWT_LEDS_INIT_BLINK);

  // Configure DW IC. See NOTE 5 below.
  if (dwt_configure(&config)) // if the dwt_configure returns DWT_ERROR either the PLL or RX calibration has failed the host should reset the device
  {
    test_run_info((unsigned char *)"CONFIG FAILED\r\n");
    while (100)
      ;
  }



  // test_run_info((unsigned char *)"CONFIG OK\r\n");
  /* Configure the TX spectrum parameters (power PG delay and PG Count) */
  dwt_configuretxrf(&txconfig_options);

  /* Apply default antenna delay value. See NOTE 2 below. */
  //dwt_setrxantennadelay(RX_ANT_DLY);
  //dwt_settxantennadelay(TX_ANT_DLY);



  printf(" SETUP DONE \n\r");
  

}

void loop()
{

//simple_rx();
//simple_tx();
simple_bounce();
printf("-------------------------------------\n\r");

}

void simple_bounce(){

  /* Activate reception immediately. */
  dwt_rxenable(DWT_START_RX_IMMEDIATE);

  /* Poll for reception of a frame or error/timeout. See NOTE 6 below. */
  while (!((status_reg = dwt_read32bitreg(SYS_STATUS_ID)) & (SYS_STATUS_RXFCG_BIT_MASK | SYS_STATUS_ALL_RX_ERR))){ };
  printf("First Ping received\n");  
  poll_rx_ts = get_rx_timestamp_u64();

  /* Clear good RX frame event in the DW IC status register. */
  dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_RXFCG_BIT_MASK);




  dwt_writetxdata(sizeof(tx_resp_msg), tx_resp_msg, 0); /* Zero offset in TX buffer. */
  dwt_writetxfctrl(sizeof(tx_resp_msg), 0, 0); /* Zero offset in TX buffer, no ranging. */
  /* Start transmission. */
  dwt_starttx(DWT_START_TX_IMMEDIATE | DWT_RESPONSE_EXPECTED);
  //wait for tx to finish
  while (!(dwt_read32bitreg(SYS_STATUS_ID) & SYS_STATUS_TXFRS_BIT_MASK)) { };
  //printf("Ping sent. Sequence number: %d\n\r", frame_seq_nb);
  printf("first response sent\n\r");


  /* Clear TX frame sent event. */
  dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS_BIT_MASK);


  /* Poll for reception of a frame or error/timeout. See NOTE 6 below. */
  while (!((status_reg = dwt_read32bitreg(SYS_STATUS_ID)) & (SYS_STATUS_RXFCG_BIT_MASK | SYS_STATUS_ALL_RX_ERR))){ };
  printf("Final Ping received\n");

  resp_tx_ts = get_tx_timestamp_u64();
  final_rx_ts = get_rx_timestamp_u64();


  //waiting for retransmission of the final message
  while (!((status_reg = dwt_read32bitreg(SYS_STATUS_ID)) & (SYS_STATUS_RXFCG_BIT_MASK | SYS_STATUS_ALL_RX_ERR))){ };
  printf("Communication Ends\n");

  uint32_t poll_tx_ts, resp_rx_ts, final_tx_ts;
  uint32_t poll_rx_ts_32, resp_tx_ts_32, final_rx_ts_32;
  double Ra, Rb, Da, Db;
  int64_t tof_dtu;
                      

  /* Get timestamps embedded in the final message. */
  final_msg_get_ts(&rx_buffer[FINAL_MSG_POLL_TX_TS_IDX], &poll_tx_ts);
  final_msg_get_ts(&rx_buffer[FINAL_MSG_RESP_RX_TS_IDX], &resp_rx_ts);
  final_msg_get_ts(&rx_buffer[FINAL_MSG_FINAL_TX_TS_IDX], &final_tx_ts);

  poll_rx_ts_32 = (uint32_t)poll_rx_ts;
  resp_tx_ts_32 = (uint32_t)resp_tx_ts;
  final_rx_ts_32 = (uint32_t)final_rx_ts;
  Ra = (double)(resp_rx_ts - poll_tx_ts);
  Rb = (double)(final_rx_ts_32 - resp_tx_ts_32);
  Da = (double)(final_tx_ts - resp_rx_ts);
  Db = (double)(resp_tx_ts_32 - poll_rx_ts_32);
  tof_dtu = (int64_t)((Ra * Rb - Da * Db) / (Ra + Rb + Da + Db));

  tof = tof_dtu * DWT_TIME_UNITS;
  distance = tof * SPEED_OF_LIGHT;
  /* Display computed distance on LCD. */
  
  printf(" Ping sent at              %llu \n",poll_tx_ts);

  printf(" Message received at       %llu \n",poll_rx_ts);

  printf(" response sent at          %llu \n",resp_tx_ts);

  printf(" response received at      %llu \n",resp_rx_ts); 

  printf(" final message sent at     %llu \n",final_tx_ts);

  printf(" final message received at %llu \n",final_rx_ts);



  /* Display computed distance on LCD. */
  printf("Distance  %3.2f m     \n",distance);



      
}
