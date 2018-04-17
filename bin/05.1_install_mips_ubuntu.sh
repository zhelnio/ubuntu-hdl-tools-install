#!/bin/bash

# install MIPS toolchain from Ubuntu repository
sudo apt install gcc-mipsel-linux-gnu

# addign current user to dialout group to use /dev/ttyUSB* for hardware debug
sudo adduser `whoami` dialout
