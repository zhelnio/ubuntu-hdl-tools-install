
# directory of current script
CFG_DIR=${BASH_SOURCE%/*}

# directory for all the downloads
DOWNLOAD_DIR=$CFG_DIR/../pkg

# other configs and patches
MISCELLANEOUS_DIR=$CFG_DIR/../misc

### 03. Visual Studio Code download link
VSCODE_PKG_URL='https://go.microsoft.com/fwlink/?LinkID=760868'
VSCODE_PKG_NAME='code_*_amd64.deb'

### 04. MARS MIPS simulator
MARS_URL='http://courses.missouristate.edu/KenVollmar/mars/MARS_4_5_Aug2014/Mars4_5.jar'
MARS_PKG_NAME='Mars*.jar'
MARS_PATH=/opt/mars

### 05.2. MIPS Codescape SDK
## Download page: https://www.mips.com/develop/tools/codescape-mips-sdk/
## Web install
CODESCAPE_SDK_URL='https://codescape.mips.com/sdk/v2.0.0k/mipssdk.v2.0.0k.linux-x64.x64.webinstall.run'
## Offline install (~3Gb)
#CODESCAPE_SDK_URL='https://codescape.mips.com/sdk/v2.0.0k/mipssdk.v2.0.0k.linux-x64.x64.offline.run'
CODESCAPE_SDK_PKG_NAME='mipssdk*.run'

### 05.2. MIPS Codescape Toolchain (baremetal)
## Download page: https://codescape.mips.com/components/toolchain/2017.10-07/downloads.html
CODESCAPE_BAREMETAL_URL='https://codescape.mips.com/components/toolchain/2017.10-07/Codescape.GNU.Tools.Package.2017.10-07.for.MIPS.MTI.Bare.Metal.CentOS-5.x86_64.tar.gz'
CODESCAPE_BAREMETAL_PKG_NAME='Codescape.*.MIPS.MTI.Bare.Metal.*.x86_64.tar.gz'

### 05.3. MIPS Codescape Toolchain (linux)
CODESCAPE_LINUX_URL='https://codescape.mips.com/components/toolchain/2017.10-07/Codescape.GNU.Tools.Package.2017.10-07.for.MIPS.MTI.Linux.CentOS-5.x86_64.tar.gz'
CODESCAPE_LINUX_PKG_NAME='Codescape.*.MIPS.MTI.Linux.*.x86_64.tar.gz'

### 05.2-3. MIPS Codescape Toolchain (common)
CODESCAPE_TOOLCHAINS_PATH='/opt/imgtec/Toolchains'
CODESCAPE_TOOLCHAINS_PROFILE='/etc/profile.d/mips-codescape.sh'

### 06. Intel (Altera) Quartus Lite
# You may have to register on altera.com and to to update donwload URL from this page:
# https://www.altera.com/products/design-software/fpga-design/quartus-prime/download.html
QUARTUS_LITE_URL='http://download.altera.com/akdlm/software/acdsinst/17.1std.1/593/ib_tar/Quartus-lite-17.1.1.593-linux.tar'
QUARTUS_LITE_PKG_NAME='Quartus-lite-*-linux.tar'
QUARTUS_LITE_UNPACK_PATH='/tmp/quartus_installer'
QUARTUS_LITE_INSTALLER=$QUARTUS_LITE_UNPACK_PATH/setup.sh
QUARTUS_LITE_INSTALL_PATH='/opt/altera'
QUARTUS_LITE_PROFILE='/etc/profile.d/quartus.sh'

### 07. Xilinx Vivado
# You have to register on xilinx.com and to to update donwload URL from this page:
# https://www.xilinx.com/support/download.html
VIVADO_URL='https://xilinx-ax-dl.entitlenow.com/dl/ul/2018/04/05/R209901852/Xilinx_Vivado_SDK_Web_2018.1_0405_1_Lin64.bin/5408b8e1bba695264a3cfc415e82a302/5AD5FED3?akdm=0&filename=Xilinx_Vivado_SDK_Web_2018.1_0405_1_Lin64.bin'
VIVADO_PKG_NAME='Xilinx_Vivado_SDK_Web_*_Lin64.bin'
VIVADO_INSTALL_PATH='/opt/xilinx'

### 08. Sublime
SUBLIME_REPO_KEY='https://download.sublimetext.com/sublimehq-pub.gpg'
SUBLIME_REPO_URL='deb https://download.sublimetext.com/ apt/stable/'
