#! /usr/bin/bash

# Simple bash script to run eclim

Xvfb :1 -screen 0 1024x768x24 &
DISPLAY=:1 $ECLIPSE_HOME/eclimd start
