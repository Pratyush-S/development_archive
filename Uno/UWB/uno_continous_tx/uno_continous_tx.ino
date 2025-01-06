#include "dw3000.h"
#include "ps_uwb.h"

#define APP_NAME "SIMPLE RX v1.1"

// connection pins UNO
const uint8_t PIN_RST = 7;  // reset pin
const uint8_t PIN_IRQ = 8;   // irq pin
const uint8_t PIN_SS = 10;    // spi select pin

////Buzzer
const int buzzer = 2; //buzzer to arduino pin 9

/*


const uint8_t PIN_RST = 15; // reset pin
const uint8_t PIN_IRQ = 4; // irq pin
const uint8_t PIN_SS = 5;   // spi select pin

*/
/////////////// TWR resources
//UWB
static uint8_t tx_poll_msg[] = { 0x41, 0x88, 0, 'C', 'O', 'N', 'T', 'I', 'N','U','O', 'U', 'S', ' ', ' ', ' ' };
#define FRAME_LENGTH (sizeof(tx_poll_msg) + FCS_LEN)  // The real length that is going to be transmitted



#define BLINK_FRAME_SN_IDX 1



extern dwt_txconfig_t txconfig_options;

/* Indexes to access some of the fields in the frames defined above. */
#define ALL_MSG_SN_IDX 2
#define RESP_MSG_POLL_RX_TS_IDX 10
#define RESP_MSG_RESP_TX_TS_IDX 14
#define RESP_MSG_TS_LEN 4

/* Frame sequence number, incremented after each transmission. */
static uint8_t frame_seq_nb = 0;

/* Default antenna delay values for 64 MHz PRF. See NOTE 2 below. */
#define TX_ANT_DLY 16385
#define RX_ANT_DLY 16385

#define POLL_TX_TO_RESP_RX_DLY_UUS 240
#define RESP_RX_TIMEOUT_UUS 100000000

/* Inter-frame delay period, in milliseconds. */
#define TX_DELAY_MS 100


uint64_t poll_tx_ts,poll_tx_ts_old,poll_tx_ts_diff;







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

/* Buffer to store received frame. See NOTE 1 below. */
static uint8_t rx_buffer[FRAME_LEN_MAX];

/* Hold copy of status register state here for reference so that it can be examined at a debug breakpoint. */
uint32_t status_reg;
/* Hold copy of frame length of frame received (if good) so that it can be examined at a debug breakpoint. */
uint16_t frame_len;

static double tof;
static double distance;
void setup() {
  UART_init();
  test_run_info((unsigned char *)APP_NAME);

  /* Configure SPI rate, DW3000 supports up to 38 MHz */
  /* Reset DW IC */
  spiBegin(PIN_IRQ, PIN_RST);
  spiSelect(PIN_SS);

  delay(200);  // Time needed for DW3000 to start up (transition from INIT_RC to IDLE_RC, or could wait for SPIRDY event)

  pinMode(buzzer, OUTPUT); // Set buzzer - pin 9 as an output


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
}

void loop() {

//#define DWT_TIME_UNITS      (1.0/499.2e6/128.0) //!< = 15.65e-12 s


  simple_tx();

}



void read_message_buffer() {
  /* TESTING BREAKPOINT LOCATION #1 */
  /* Clear local RX buffer to avoid having leftovers from previous receptions  This is not necessary but is included here to aid reading
   * the RX buffer.
   * This is a good place to put a breakpoint. Here (after first time through the loop) the local status register will be set for last event
   * and if a good receive has happened the data buffer will have the data in it, and frame_len will be set to the length of the RX frame. */
  memset(rx_buffer, 0, sizeof(rx_buffer));

  /* Activate reception immediately. See NOTE 2 below. */
  dwt_rxenable(DWT_START_RX_IMMEDIATE);

  /* Poll until a frame is properly received or an error/timeout occurs. See NOTE 3 below.
   * STATUS register is 5 bytes long but, as the event we are looking at is in the first byte of the register, we can use this simplest API
   * function to access it. */
  while (!((status_reg = dwt_read32bitreg(SYS_STATUS_ID)) & (SYS_STATUS_RXFCG_BIT_MASK | SYS_STATUS_ALL_RX_ERR))) {
  };

  if (status_reg & SYS_STATUS_RXFCG_BIT_MASK) {
    /* A frame has been received, copy it to our local buffer. */
    frame_len = dwt_read32bitreg(RX_FINFO_ID) & RX_FINFO_RXFLEN_BIT_MASK;
    if (frame_len <= FRAME_LEN_MAX) {
      dwt_readrxdata(rx_buffer, frame_len - FCS_LEN, 0); /* No need to read the FCS/CRC. */
    }

    /* Clear good RX frame event in the DW IC status register. */
    dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_RXFCG_BIT_MASK);


    test_run_info((unsigned char *)"Frame Received");

    printf("data: ");
    printf("  %d ", rx_buffer[1]);
    for (int i = 2; i < 20; i++) {

      printf("  %c ", rx_buffer[i]);
    }
  } else {
    /* Clear RX error events in the DW IC status register. */
    dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_ALL_RX_ERR);
  }



  printf("\n\r------------------------------------------------\n\r");


}


void simple_tx() {

    /* Write frame data to DW IC and prepare transmission. See NOTE 3 below.*/
    dwt_writetxdata(FRAME_LENGTH - FCS_LEN, tx_poll_msg, 0); /* Zero offset in TX buffer. */


    dwt_writetxfctrl(FRAME_LENGTH, 0, 0); /* Zero offset in TX buffer, no ranging. */

    /* Start transmission. */
    dwt_starttx(DWT_START_TX_IMMEDIATE);
    Sleep(TX_DELAY_MS);

    /* Poll DW IC until TX frame sent event set. See NOTE 4 below.
     * STATUS register is 4 bytes long but, as the event we are looking at is in the first byte of the register, we can use this simplest API
     * function to access it.*/
    while (!(dwt_read32bitreg(SYS_STATUS_ID) & SYS_STATUS_TXFRS_BIT_MASK)) {
        
    };

    /* Clear TX frame sent event. */
    dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS_BIT_MASK);


    /* Execute a delay between transmissions. */

    /* Increment the blink frame sequence number (modulo 256). */
    tx_poll_msg[ALL_MSG_SN_IDX] = frame_seq_nb;
    frame_seq_nb = frame_seq_nb + 1;


    // poll_rx_ts,poll_rx_ts_old,poll_rx_ts_diff;

    /* Retrieve poll reception timestamp. */
    poll_tx_ts = get_tx_timestamp_u64();
    poll_tx_ts_diff = poll_tx_ts - poll_tx_ts_old;

    //printf("Ping sent. Sequence number: %d\n\r", frame_seq_nb);

    Serial.print("sending frame number : ");
    Serial.println(frame_seq_nb);
    //single_beep();   

}

void single_beep() {
    tone(buzzer, 4000); // Send 1KHz sound signal...
    delay(50);        // ...for 1 sec
    noTone(buzzer);     // Stop sound...
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
