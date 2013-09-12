
function check()
{
  count=$(which $1 | wc -l);
  if [ count -eq 0 ]; then
    echo "$1 not installed"
    exit 1
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
mkdir git
cd git
git clone git@github.com:gokulvanan/SetupScripts.git
cd $HOME
ln -sb git/SetupScripts/config/.screenrc .
ln -sb git/SetupScripts/config/.bashrc_custom .
ln -sb git/SetupScripts/config/.vimrc .
echo " source ~/.bashrc_custom" >> ~/.bashrc
