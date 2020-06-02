# **AXI SHA256 Accelerator**
The AXI SHA256 accelerator, utilizing the AXI4-Lite interface, is able to complete a hash of a 512-bit block in only 70 cycles and has a max operating frequency of 100 MHz.

## **Repo Layout**

### **docs**

This folder contains block diagrams, the reference manual, generated reports, along with any other supporting files.

### **hardware**

This folder contains bitstream and .xsa files.

### **ip**

This folder contains the ip support files and drivers.

### **rtl**

This folder contains the HDL for sythesis.

### **software implementation**

This folder only contains a software implementation of sha256.

### **testbench**

This folder contains the HDL for simulation.

### **work**

This folder contains tracked files needed to fully re-create the Vivado or Vitis projects. Temporary/generated files are left untracked.

## **Revisions**
  ### **1.0**
  - Initial release
  - Hash block completion in 70 cycles
  - Simple drivers, but added too much overhead


## **Future Plans**
  - DMA support to reduce overhead on CPU
  - Provide base address and size and master AXI will talk to DMA to automatically fetch next message block between hashes
