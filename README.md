# ubuntu-hdl-tools-install

Set of scripts to simplify the installing of HDL development tools on Ubuntu 17.04 (x64). Created for Labs and school-training: https://nanoandgiga.com/ngc2017/digital-design

## Usage
It is assumed that you start to use it with the Ubuntu base system installed (console mode and no tools).
```
sudo apt install git
git clone https://github.com/zhelnio/ubuntu-hdl-tools-install.git
cd ubuntu-hdl-tools-install/bin
./00_install_desktop.sh
./01_install_console.sh
./02_install_open.sh
...
./09_install_vivado.sh
```

## Scripts description
### 00_install_desktop.sh
Installs default Ubuntu-desktop

### 01_install_console.sh (optional)
Installs some usefull utils:
 - ssh - for secure remote access
 - tmux - console screen manager
 - mc - open source FAR alternative 
 - htop - advanced console process monitor

### 02_install_open.sh
Installs open source development and debug tools
 - Icarus Verilog
 - git source control system
 - openocd on-chip debugger solution

### 03_install_vscode.sh
Installs Microsoft Visual Studio Code open source editor

### 04_install_mips_toolchain.sh
Installs Linux and ‘bare metal’ embedded GCC-based toolchains from Imagination Technologies site. You may have to renew the links to packages on https://community.imgtec.com/developers/mips/tools/codescape-mips-sdk/ 

### 05_download_quartus.sh
Downloads Quartus-lite-16.1.0.196 from Intel's site. You may have to register on altera.com and to to update the URL from this page: https://www.altera.com/products/design-software/fpga-design/quartus-prime/download.html

### 06_install_quartus.sh
Installs Quartus-lite-16.1.0.196. You have to update the package name if it was changed on the previous step. Please run it from GUI console.

### 07_bugfix_quartus.sh
Fixes the Quartus-lite-16.1.0.196 problems with Ubuntu  17.04 (x64) distribution.

### 08_download_vivado.sh
Downloads Vivado_SDK_2017.2 network installer. Please get your download URL from https://www.xilinx.com/support/download.html
Auth on Xilinx site is required

### 09_install_vivado.sh
Installs Vivado_SDK_2017.2. You have to update the package name if it was changed on the previous step. Please run it from GUI console.
