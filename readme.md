# **AXI SHA256 Accelerator**
The AXI SHA256 accelerator, utilizing the AXI4-Lite interface, is able to complete a hash of a 512-bit block in only 70 cycles and has a max operating frequency of 100 MHz.

## **Repo Layout**
### **axi_sha256_1.0**

This folder contains the IP repo for the accelerator

### **axi_sha256_1.0.zip**

Archived IP repo

### **C_implementation**

This folder contains the software implementation of the SHA256 algorithm

### **impl**

This folder contains implementations (.bit .xsa and reports) for the accelerator with and without the padder module

### **project**

This folder contains the Vivado and Vitis projects used in development and testing

### **src**

This folder contains the HDL for sythesis and simulation

### **waveforms**

This folder only contains waveform images used in the data sheet

### **AXI-SHA256-Datasheet.pdf**

This data sheet for the accelerator outlining the configuration parameters, register map, and operation

### **SHA256-HardwareImplementation.pdf**

This document has flowcharts and block diagrams of the internals of the accelerator, specifically the sha256_update module and all of its submodules.