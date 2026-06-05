# Xilinx Spartan 7 FPGA Programming Demo
**Jarvis College of Computing and Digital Media - DePaul University**

This repository contains an implementation of a simple demo for programming the Spartan 7 FPGA.
This demo shows how hardware and software can be integrated into a larger applications using Vivado and Vitis.

You can find the instructions on how to set up the enviroment to build and run this project, please check:
- [https://magnetarpulse.github.io/spartan-demo/](https://magnetarpulse.github.io/spartan-demo/)

### Software Requirements

This demo is designed to run on a standard Ubuntu 24.04 LTS Server Edition OS. You will need to use **Make** (to run the provided Makefile), Icarus Verilog (to compile and simulate the Verilog files), **Verilator** (to compile and simulate the Verilog files), and **Python 3.14** (to run the testing setup script).

To install the necessary software packages, including Python 3.14 from the deadsnakes PPA, open a terminal and run the following commands:

```shell
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.14 make texinfo flex bison zlib1g-dev libgmp-dev libmpfr-dev iverilog ghdl verilator build-essential cmake g++-14 gcc-14 cmake
sudo update-alternatives --remove-all gcc
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 130
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 140
sudo update-alternatives --remove-all g++
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-13 130
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-14 140
```

### Setting up NEORV32 on Ubuntu 24.04 LTS

To set up the NEORV32 framework on a local installation of Ubuntu 24.04, you will need to first install the RISC V compiler toolchain. There are multiple approaches that you can follow, but the one listed in this documentation is the most stable.

Create a folder on your system where the compiler toolchain will be installed and make your user the ownwer of the folder. For example if your username is *alex* you can run:

```shell
sudo mkdir /opt/riscv
sudo chown alex:alex /opt/riscv
```

Clone and build the RISC V compiler toolchain:

```shell
git clone https://github.com/riscv/riscv-gnu-toolchain
cd riscv-gnu-toolchain
./configure --prefix=/opt/riscv --with-arch=rv32i --with-abi=ilp32
make -j NUM_CORES # replace NUM_CORES with the total number of cores that you would like to use to speed up the compilation
```

Add the compiler location to the environment:

```shell
sudo touch /etc/profile.d/riscv.sh
echo 'export PATH=/opt/riscv/bin:$PATH' | sudo tee /etc/profile.d/riscv.sh
sudo chmod 644 /etc/profile.d/riscv.sh
source /etc/profile.d/riscv.sh
```
