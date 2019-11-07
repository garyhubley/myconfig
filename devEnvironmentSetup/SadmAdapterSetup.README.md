Change directory to <TOP_DIR>
	
Clone the Pitch Adapter repository into your Repo Folder
	git clone ssh://git@gitlab:5022/mmsc/SADMAdapter.git

Change directory to <TOP_DIR>/SADMAdapter/ (SA_TOP)
	cd <SA_TOP>

Init and update the submodules
	git submodule init && git submodule update

Change Directory to BIN_DIR
	cd <BIN_DIR>

Make a directory for the SADMAdapter binaries (SA_BIN_DIR)
	mkdir <SA_BIN_DIR> 

Change directory to SA_BIN_DIR
	cd <SA_BIN_DIR> 

Pull IMIO from the FTP server into your downloads directory
	curl ftp://server/cach/IMIO-linux-x64.tar.gz -o ~/Downloads/IMIO-linux-x64.tar.gz

Change directory to INSTALL_DIR
	cd <INSTALL_DIR>

Extract the IMIO tarball into INSTALL_DIR
	tar -xvf ~/Downloads/IMIO-linux-x64.tar.gz

Pull the SADM installer from the FTP server into your downloads directory
	curl ftp://server/sadm/6031/SADMU-AE_6031_installer.bin -o ~/Downloads/SADMU-AE_6031_installer.bin

Modify the permissions of the installer to make it executable
	chmod +x ~/Downloads/new_SADMU-AE_6031_installer.bin

Pull the SADM installer key from the FTP server into your downloads directory 
	curl ftp://server/sadm/6031/SADMU-AE_6031_installer.key -o ~/Downloads/SADMU-AE_6031_installer.key

Copy the contents of SADMU-AE_6031_installer.key
	cat SADMU-AE_6031_installer.key
	highlight the contents
	Right Click > copy

Execute the installation binary
	~/Downloads/SADMU-AE_6031_installer.bin

When prompted for an installation directory (SADM_INSTALL_DIR), enter:
	<INSTALL_DIR>/SADMU-AE_6031

When prompted for the passphrase
	Right Click > paste
	return

Pull Xerces from the FTP server into your downloads directory
	curl ftp://server/xerces/xerces-c-3.1-linux-x64-static.tar.gz -o ~/Downloads/xerces-c-3.1-linux-x64-static.tar.gz

Make a Xerces install directory (<INSTALL_DIR>/Xerces) and change to it (XERCES_INSTALL_DIR)
	mkdir <INSTALL_DIR>/Xerces && cd <INSTALL_DIR>/Xerces

Extract the Xerces tarball into the XERCES_INSTALL_DIR
	tar -xvf ~/Downloads/xerces-c-3.1-linux-x64-static.tar.gz

Pull Protobuf from the FTP server into your downloads directory
	curl ftp://server/protobuf/protobuf-linux-x64.tar.gz -o ~/Downloads/protobuf-linux-x64.tar.gz

Make a Protobuf install directory (<INSTALL_DIR>/Xerces) and change to it (XERCES_INSTALL_DIR)
	mkdir <INSTALL_DIR>/Protobuf && cd <INSTALL_DIR>/Protobuf

Extract the Xerces tarball into the XERCES_INSTALL_DIR
	tar -xvf ~/Downloads/protobuf-linux-x64.tar.gz

Build the Eclipse project 
	cmake <SA_TOP_DIR> -DCMAKE_BUILD_TYPE=Debug -Dspdlog_DIR=<SPD_INSTALL_DIR>/lib/cmake/spdlog -DIMIO_ROOT=<IMIO_INSTALL_DIR> -DSADM_ROOT=<SADM_INSTALL_DIR> -DXercesC_DIR=<XERCES_INSTALL_DIR>/lib/cmake/XercesC

Ensure there are no CMake errors. 

Compile the Pitch Adapter library 
	make -j8

Start SADM
	./tests/start_sadm_normal.sh
	./tests/start_sadm_dd.sh

Run the tests and ensure all pass 
	ctest -V

Install SADM Adapter
	make install

Import the project into Eclipse
	Open Eclipse
	File > Import... > General > Existing Projects into Workspace
	Browse to <SA_BIN_DIR> 
	DO **NOT** COPY THE SOURCE INTO YOUR WORKSPACE

Set the parser to C++ 11 standard
	Project > Properties > C++ Include Paths and Symbols 
	Highlight '__cplusplus'
	Click Edit 
	Change value to '201103L'


