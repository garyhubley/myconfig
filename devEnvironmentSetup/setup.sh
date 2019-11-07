#! /bin/bash


#***********Variables***********#
INSTALL_DIR=$HOME/bin
LOCAL_REPOS_DIR=$HOME/Projects/C++
BIN_DIR=$TOP_DIR/bin

L16T_TOP=$TOP_DIR/Link16Translator
L16T_BIN_DIR=$BIN_DIR/Link16Translator
L16T_INSTALL_DIR=$INSTALL_DIR/Link16Translator

PA_TOP=$TOP_DIR/PitchAdapter
PA_BIN_DIR=$BIN_DIR/PitchAdapter
PA_INSTALL_DIR=$INSTALL_DIR/PitchAdapter

PITCH_INSTALL_DIR=$INSTALL_DIR/Pitch

SPD_INSTALL_DIR=$INSTALL_DIR/spdlog


#***********Link16 Translator***********#

if [ ! -e $INSTALL_DIR ]; then
	echo -e "\n\nMaking installation directory\n" 
	mkdir $INSTALL_DIR
fi

if [ ! -e $TOP_DIR ]; then
	echo -e "Creating top repository directory\n" 
	mkdir -p $BIN_DIR
fi

cd $TOP_DIR

if [ ! -e $L16T_TOP ]; then 
	echo -e "\n\nCloning Link16 Translator\n"
	git clone ssh://git@gitlab:5022/mmsc/Link16Translator.git
fi

cd $L16T_TOP

echo -e "'\n\nInitializing and updating submodules\n"
git submodule init && git submodule update

if [ ! -e $L16T_BIN_DIR ]; then
	echo -e "Creating top Link16 binary directory\n"
	mkdir -p $L16T_BIN_DIR
fi

cd $L16T_BIN_DIR

echo -e "\n\nStarting CMake build\n"
cmake $L16T_TOP -DCMAKE_BUILD_TYPE=Debug -G"Eclipse CDT4 - Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$L16T_INSTALL_DIR -DSANITIZE=OFF

echo -e "\n\nCompiling Link16 Translator\n"
make -j8

echo -e "\n\nRunning tests for Link16 Translator\n"
ctest -V

echo -e "\n\nInstalling Link16 Translator\n"
make install

#***********Pitch Adapter***********#

cd $TOP_DIR

if [ ! -e $PA_TOP ]; then 
	echo -e "\n\nCloning Pitch Adapter\n"
	git clone ssh://git@gitlab:5022/mtmd/PitchAdapter.git
fi

cd $PA_TOP

echo -e "\n\nInitializing and updating submodules\n"
git submodule init && git submodule update

if [ ! -e $PA_BIN_DIR ]; then
	echo -e "Creating Pitch Adapter binary directory\n" 
	mkdir -p $PA_BIN_DIR
fi

cd $PA_BIN_DIR

echo -e "\n\nDownloading Pitch from FTP"
RTI=~/Downloads/prti1516e-5.4.0.0-linux-x64.tar.gz

if [ ! -e $RTI ]; then
	curl ftp://server/cach/prti1516e-5.4.0.0-linux-x64.tar.gz -o ~/Downloads/prti1516e-5.4.0.0-linux-x64.tar.gz
fi

echo "\n\nInstalling Pitch"
if [ ! -e $PITCH_INSTALL_DIR ]; then
	echo -e "Creating Pitch install directory\n"
	mkdir -p $PITCH_INSTALL_DIR
fi

cd $PITCH_INSTALL_DIR

tar -xvf $RTI

SPDLOG=~/Downloads/spdlog.tar.gz

if [ ! -e $SPDLOG ]; then
	curl ftp://server/cach/spdlog.tar.gz -o $SPDLOG 
fi

echo -e "\n\nInstalling spdlog"
if [ ! -e $SPD_INSTALL_DIR ]; then
	echo -e "Creating spdlog install directory\n"
	mkdir -p $SPD_INSTALL_DIR
fi

cd $SPD_INSTALL_DIR

tar -xvf $SPDLOG

echo -e "\n\nStarting CMake build\n"
	cmake $PA_TOP -DCMAKE_BUILD_TYPE=Debug -G"Eclipse CDT4 - Unix Makefiles" -DPitch_R    OOT=$PITCH_INSTALL_DIR -Dspdlog_DIR=$SPD_INSTALL_DIR/lib/cmake/spdlog -DCMAKE_INSTALL_PREFIX=$PA_INSTALL_DIR

echo -e "\n\nCompiling Link16 Translator\n"
make -j8

echo -e "\n\nRunning tests for Link16 Translator\n"
ctest -V

echo -e "\n\nInstalling Link16 Translator\n"
make install


#***********SADM Adapter***********#


