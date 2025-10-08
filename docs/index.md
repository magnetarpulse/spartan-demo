---
layout: default
title: Home
nav_order: 1
has_children: false
has_toc: true
---

# Xilinx Spartan 7 FPGA Programming Demo
**Jarvis College of Computing and Digital Media - DePaul University**

This repository contains an implementation of a simple demo for programming the Spartan 7 FPGA.
This demo shows how hardware and software can be integrated into a larger applications using Vivado and Vitis.

## Requirements and Setup

This project has been developed and tested on Ubuntu 24.04 LTS.
If you plan to use a different OS, then make sure that you check the official documentation for your OS.

### Vivado and Vitis Installation

To install Vivado and Vitis IDEs, you will need to install the following packages first, otherwise the installation will fail:
```
sudo apt install libtinfo5 libncurses5 libncurses5-dev
```

Download the AMD Unified Installer for FPGAs & Adaptive SoCs 2025.1: Linux Self Extracting Web Installer from: [https://www.xilinx.com/support/download.html](https://www.xilinx.com/support/download.html). You will need to create an account with AMD and will need to log in using that account in order to download the installer.

Install Vivado and Vitis:
```
chmod +x FPGAs_AdaptiveSoCs_Unified_SDI_2025.1_0530_0145_Lin64.bin
./FPGAs_AdaptiveSoCs_Unified_SDI_2025.1_0530_0145_Lin64.bin
```
Insert your AMD login credentials in the installation menu and click next:
![Installation Step 1]({{ '/assets/images/install01.png' | relative_url }})

Select Vivado from the installation menu and click next:
![Installation Step 2]({{ '/assets/images/install02.png' | relative_url }})

Select Vivado ML Standard form the installation menu and click next:
![Installation Step 3]({{ '/assets/images/install03.png' | relative_url }})

Check the "Vitis Networking V4" and "Vitis Embedded Development" boxes from the Design Tools category.
Check the "7 Series" box from the Devices category.
Uncheck the "Acquire or Manage a License Key" box from the Installation Options category.
Click next:
![Installation Step 4]({{ '/assets/images/install04.png' | relative_url }})

Accept all the user agreements, select an installation target and install the IDEs:
![Installation Step 5]({{ '/assets/images/install05.png' | relative_url }})