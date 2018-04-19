# ubuntu-hdl-tools-install

Set of scripts to simplify the installing of HDL development tools on Ubuntu 17.04 (x64). Can be run on Ubuntu base system install

## Tools
 - Icarus Verilog & GTKWave
 - MARS MIPS Simulator
 - Intel Quartus Lite 17.1
 - Xilinx Vivado SDK 2018.1
 - MIPS Toolchain
 - Microsoft Visual Studio Code
 - Sublime Text 3
 - git
 - openocd
 
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
./08_install_sublime3.sh
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

### 04_install_mars.sh
Installs MARS MIPS Simulator

### 05 MIPS toolchain
Select the prefered one 

## 05.1_install_mips_ubuntu.sh
MIPS toolchain from Ubuntu repository

## 05.2_install_mips_codescape_sdk.sh
Download and install the Codescape SDK. You may have to renew the links to packages in ![bin/config.bash](bin/config.bash)

## 05.3_install_mips_codescape_bm.sh
Download and install the Codescape Bare Metal toolchain. You may have to renew the links to packages in ![bin/config.bash](bin/config.bash)

## 05.4_install_mips_codescape_linux.sh
Download and install the Codescape Linux toolchain. You may have to renew the links to packages in ![bin/config.bash](bin/config.bash)

### 06_install_quartus.sh
Download and install Quartus-lite from Intel website. You may have to register on altera.com and to update the URL in ![bin/config.bash](bin/config.bash)

### 07_install_vivado.sh
Installs Vivado SDK. You may have to register on xilinx.com and to update the URL in ![bin/config.bash](bin/config.bash)

### 08_install_sublime3.sh
Installs Sublime Text 3 editor
