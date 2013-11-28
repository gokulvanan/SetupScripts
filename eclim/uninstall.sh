#! /usr/bin/bash

# Simple bash script to uninstall eclim

echo "path to eclipse folder"
read ECLIPSE_PATH
echo ""
echo "Installing eclim"

java -Dvim.files=$HOME/.vim -Declipse.home=$ECLIPSE_PATH -jar ./eclim_2.3.2.jar uninstall
