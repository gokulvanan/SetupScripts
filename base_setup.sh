
function check()
{
  count=$(which $1 | wc -l);
  if [ count -eq 0 ]; then
    echo "$1 not installed"
  else 
    echo "$1 is installed"
  fi
}
#install git 
sudo apt-get install -y git-core
check git

#install heroku toolbelr
wget -q0- https://toolbelt.heroku.com/install-ubuntu.sh | sh
check heroku

#update apt-get package
sudo apt-get update
#Instal python
sudo apt-get install -y python-software-properties python g++ make
check python
#Add a new repository for apt-get to search
sudo add-apt-repository ppa:chris-lea/node.js
#Update apt-get’s knowledge of which packages are where
sudo apt-get update
#Now install nodejs and npm
sudo apt-get install -y nodejs
check node
check npm

#Installs screen
sudo apt-get install screen
check screen

#
# git pull and install dotfiles as well
cd $HOME
#if [ -d ./config_files/ ]; then
#    mv dotfiles dotfiles.old
#fi
#git clone https://github.com/startup-class/dotfiles.git
#ln -sb git/dotfiles/.screenrc .
#ln -sb git/dotfiles/.bash_profile .
#ln -sb git/dotfiles/.bashrc .
#ln -sb git/dotfiles/.bashrc_custom .
#ln -sf git/dotfiles/.emacs.d .
