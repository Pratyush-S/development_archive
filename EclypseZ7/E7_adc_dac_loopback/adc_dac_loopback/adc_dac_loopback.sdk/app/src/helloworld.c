#include "xparameters.h"
#include "xaxidma.h"
#include "xil_cache.h"

// Definitions for DMA transfer
#define DMA_DEV_ID XPAR_AXIDMA_0_DEVICE_ID
#define DDR_BASE_ADDR XPAR_PS7_DDR_0_S_AXI_BASEADDR
#define DMA_BUFFER_SIZE 1024  // Adjust according to your buffer size

XAxiDma AxiDma;

int main() {
    int Status;




    init_platform();






    // Write to DDR memory
    u32 write_data = 0xDEADBEEF;  // Example data to write
    Xil_Out32(DDR_BASE_ADDR, write_data);  // Write to DDR base address

    // Read from DDR memory
    u32 read_data = Xil_In32(DDR_BASE_ADDR);  // Read back from DDR base address

    // Check if the read data matches what was written
    if (read_data == write_data) {
        xil_printf("Data written and read successfully: 0x%08X\n", read_data);
    } else {
        xil_printf("Error: Read 0x%08X, expected 0x%08X\n", read_data, write_data);
    }







    XAxiDma_Config *Config;

    // Initialize DMA
    Config = XAxiDma_LookupConfig(DMA_DEV_ID);
    if (!Config) {
        xil_printf("No config found for %d\r\n", DMA_DEV_ID);
        return XST_FAILURE;
    }

    Status = XAxiDma_CfgInitialize(&AxiDma, Config);
    if (Status != XST_SUCCESS) {
        xil_printf("DMA Initialization failed\r\n");
        return XST_FAILURE;
    }

    // Ensure the DMA is in simple mode (not scatter-gather)
    if (XAxiDma_HasSg(&AxiDma)) {
        xil_printf("Device configured as SG mode\r\n");
        return XST_FAILURE;
    }

    // Disable interrupts, polling mode
    XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);

    // Allocate memory for the buffer
    u8 *RxBuffer = (u8 *) DDR_BASE_ADDR;  // Destination buffer in DDR

    // Invalidate the cache to ensure data coherency
    Xil_DCacheInvalidateRange((INTPTR) RxBuffer, DMA_BUFFER_SIZE);

    // Start DMA transfer from PL to DDR
    Status = XAxiDma_SimpleTransfer(&AxiDma, (UINTPTR) RxBuffer, DMA_BUFFER_SIZE, XAXIDMA_DEVICE_TO_DMA);
    if (Status != XST_SUCCESS) {
        xil_printf("DMA transfer failed\r\n");
        return XST_FAILURE;
    }



	    // Print out the values in the buffer
	    for (int i = 0; i < 1000; i++) {
	        // Print each byte in hexadecimal format
	        printf("Buffer[%d] = 0x%02X\n", i, RxBuffer[i]);
	    }


    return XST_SUCCESS;
}
