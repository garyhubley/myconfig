Change directory to <TOP_DIR>
	ch <TOP_DIR>

Pull the Pitch Adapter repository into your Repo Folder
	git clone ssh://git@gitlab:5022/mtmd/PitchAdapter.git

Change directory to <TOP_DIR>/PitchAdapter/ (PA_TOP)
	cd  <PA_TOP>

Init and update the submodules
	git submodule init && git submodule update

Change Directory to BIN_DIR
	cd 	<BIN_DIR>

Make a directory for the Link16Translator binaries (PA_BIN_DIR)
	mkdir <PA_BIN_DIR> 

Change directory to PA_BIN_DIR
	cd <PA_BIN_DIR> 

Pull RTI (Pitch) from the FTP server into your downloads directory
	curl ftp://server/cach/prti1516e-5.4.0.0-linux-x64.tar.gz -o ~/Downloads/prti1516e-5.4.0.0-linux-x64.tar.gz

Make a Pitch install directory (<INSTALL_DIR>/Pitch) and change to it (PITCH_INSTALL_DIR)
	mkdir <INSTALL_DIR>/Pitch && cd <INSTALL_DIR>/Pitch

Extract the Pitch tarball into the PITCH_INSTALL_DIR
	tar -xvf ~/Downloads/prti1516e-5.4.0.0-linux-x64.tar.gz

Pull spdlog from the FTP server into your downloads directory
	curl ftp://server/cach/spdlog.tar.gz -o ~/Downloads/new_spdlog.tar.gz

Make an spdlog install directory (<INSTALL_DIR>/spdlog) and change to it (SPD_INSTALL_DIR)
	mkdir <INSTALL_DIR>/spdlog && cd <INSTALL_DIR>/spdlog

Extract the spdlog tarball into the SPD_INSTALL_DIR
	tar -xvf ~/Downloads/spdlog.tar.gz

Build the Eclipse project 
	cmake <TOP_DIR>/PitchAdapter/ -DCMAKE_BUILD_TYPE=Debug -G"Eclipse CDT4 - Unix Makefiles" -DPitch_ROOT=<PITCH_INSTALL_DIR> -Dspdlog_DIR=<SPD_INSTALL_DIR>/lib/cmake/spdlog -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>/PitchAdapter -DBOOST_ROOT=<boost_INSTALL_DIR>

Ensure there are no CMake errors. 

Compile the Pitch Adapter library 
	make -j8

Run the tests and ensure all pass 
	ctest -V

Install Pitch Adapter
	make install

Import the project into Eclipse
	Open Eclipse
	File > Import... > General > Existing Projects into Workspace
	Browse to <PA_BIN_DIR> 
	DO **NOT** COPY THE SOURCE INTO YOUR WORKSPACE

Set the parser to C++ 11 standard
	Project > Properties > C++ Include Paths and Symbols 
	Highlight '__cplusplus'
	Click Edit 
	Change value to '201103L'


