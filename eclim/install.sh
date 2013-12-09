#! /usr/bin/env bash 

# Simple bash script to install eclim
FILE=$1
ECLIPSE_PATH=$2
echo $FILE
echo $ECLIPSE_PATH
if [ -f $FILE -a -d $ECLIPSE_PATH ]; then
  echo " Installing eclim"
  echo "export ECLIPSE_HOME=$ECLIPSE_PATH" >> $FILE
  java -Dvim.files=$HOME/.vim -Declipse.home=$ECLIPSE_PATH -jar ./eclim_2.3.2.jar install
else
  echo "one of the mentioned path does not exist"
  echo "usage install.sh ~/.bashrc ~/eclipse"
fi


