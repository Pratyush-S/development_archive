#include <Arduino.h>

#define GPIO_PIN 4 // GPIO pin to toggle

hw_timer_t *timer = NULL;   // Hardware timer
volatile bool gpioState = false; // Variable to track GPIO state

void IRAM_ATTR onTimer() {
  gpioState = !gpioState;          // Toggle GPIO state
  digitalWrite(GPIO_PIN, gpioState); // Set GPIO to the new state
}

void setup() {
  pinMode(GPIO_PIN, OUTPUT);       // Set GPIO as output
  digitalWrite(GPIO_PIN, LOW);     // Initialize GPIO to LOW

  timer = timerBegin(0, 80, true); // Initialize timer 0, prescaler 80 (1 µs ticks), count up
  timerAttachInterrupt(timer, &onTimer, true); // Attach ISR to the timer
  timerAlarmWrite(timer, 1000000, true);       // Set timer period to 1 second (1,000,000 µs)
  timerAlarmEnable(timer);                     // Enable the timer alarm
}

void loop() {
  // Nothing to do here, the timer interrupt handles the toggling
}
