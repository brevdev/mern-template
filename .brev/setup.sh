#!/bin/bash

set -eo pipefail

####################################################################################
##### Specify software and dependencies that are required for this project     #####
#####                                                                          #####
##### Note:                                                                    #####
##### The working directory is /home/brev/<PROJECT_FOLDER_NAME>. Execution of  #####
##### this file happens at this level.                                         #####
####################################################################################

##### Node v14.x + npm #####
(echo ""; echo "##### Node v14.x + npm #####"; echo "";)
sudo apt install ca-certificates
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

##### MongoDB #####
(echo ""; echo "##### MongoDB v4.4 #####"; echo "";)
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
## operation should respond with OK 
## if you receive an error indicating that gnupg is not installed, you can - then run wget commd again
## sudo apt-get install gnupg
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org

##### Custom commands #####
(echo ""; echo "##### Custom commands #####"; echo "";)
npm install