// Pin connected to the interrupt source
const int interruptPin = 22; // Replace with the GPIO pin you're using

// A variable to track interrupt events
volatile bool interruptFlag = false;

// ISR: This function is called when the interrupt occurs
void IRAM_ATTR handleInterrupt() {
  interruptFlag = true; // Set a flag to indicate the interrupt occurred
}

void setup() {
  Serial.begin(115200);

  // Configure the interrupt pin as an input
  pinMode(interruptPin, INPUT_PULLDOWN); // Use INPUT or INPUT_PULLDOWN depending on your board's output signal
  
  // Attach the interrupt to the pin
  attachInterrupt(digitalPinToInterrupt(interruptPin), handleInterrupt, FALLING); // Replace FALLING with your desired trigger type
}

void loop() {
  // Check if the interrupt occurred
  if (interruptFlag) {
    interruptFlag = false; // Reset the flag
    Serial.println("Interrupt detected! Performing the task...");

    // Perform the task here
    doSomething();
  }
}

void doSomething() {
  // Your custom functionality here
  Serial.println("Task executed.");
}
