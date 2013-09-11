##Setup script for nvm/rlwrp emacs and configuring bash
#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup.

# Install nvm: node-version manager
# https://github.com/creationix/nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
echo "installed nvm"
# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12
echo "configured node version being used to v0.10.12"
# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
echo "Installing node utils"
npm install -g jshint
npm install -g mysql@2.0.0-alpha9
npm install -g underscore

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

## Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
#sudo apt-add-repository -y ppa:cassou/emacs
#sudo apt-get update
#sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

