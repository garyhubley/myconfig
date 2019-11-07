Clone the Cach repository into your Repo Folder
	ssh://git@gitlab:5022/mtmd/CACH.git

Change directory to <TOP_DIR>/CACH/ (CACH_TOP)
	cd <CACH_TOP>

Init and update the submodules
	git submodule init && git submodule update

Change Directory to BIN_DIR
	cd <BIN_DIR>

Make a directory for the Link16Translator binaries (CACH_BIN_DIR)
	mkdir <CACH_BIN_DIR> 

Change directory to CACH_BIN_DIR
	cd <CACH_BIN_DIR> 

Build the Eclipse project 
	cmake ../../CACH/ -DCMAKE_BUILD_TYPE=Debug -G"Eclipse CDT4 - Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/home/gary/eclipseInstalls/CACH -DSADMAdapter_DIR=/home/gary/eclipseInstalls/SadmAdapter/lib/cmake/SADMAdapter -DPitchAdapter_DIR=/home/gary/eclipseInstalls/PitchAdapter/lib/cmake/PitchAdapter -DLink16Translator_DIR=/home/gary/eclipseInstalls/Link16Translator/lib/cmake/Link16Translator -DPROTOBUF_INCLUDE_DIRS=/home/gary/eclipseInstalls/Protobuf/include -DPROTOBUF_LIBRARY=/home/gary/eclipseInstalls/Protobuf/lib/libprotobuf.a

Ensure there are no CMake errors. 

Compile the Pitch Adapter library 
	make -j8

Start SADM
	./tests/start_sadm_normal.sh
	./tests/start_sadm_dd.sh

Run the tests and ensure all pass 
	ctest -V

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


