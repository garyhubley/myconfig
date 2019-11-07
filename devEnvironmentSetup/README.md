PREREQUISITS:
    Gtest



Follow the steps outlined in this document to setup your development environment. 

Setup an ssh key
	ssh-keygen -b 2048 -t rsa
 
Add key to gitlab credentials
    settings > ssh keys
    copy the contents of your public key file into the dialog box

Create an install directory (INSTALL_DIR)
	mkdir <INSTALL_DIR>

Create a directory for all repositories (TOP_DIR).

Change directory to the Repo Folder
    cd <TOP_DIR>

Create a directory called 'bin' in TOP_DIR (BIN_DIR).
	mkdir bin

Follow the instructions in Link16TranslatorSetup.README.md

Follow the instructions in PitchAdapterSetup.README.md
