DISTRIBUTION="debian";
if [  -f /etc/redhat-release ]; then 
  DISTRIBUTION="centos"
fi

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
[ DISTRIBUTION == 'debian' ] && sudo apt-get install -y git-core || yum install -y git-core
check git

#install heroku toolbelr
[ DISTRIBUTION == 'debian' ] && wget -q https://toolbelt.heroku.com/install-ubuntu.sh | sh ||  wget -q https://toolbelt.heroku.com/install.sh | sh
if [ DISTRIBUTION == 'centos' ]; then
  echo "export PATH=$PATH:/usr/local/heroku/bin" >> ~/.bashrc
  .~/.profile
fi
check heroku

#update apt-get package
[ DISTRIBUTION == 'debian' ] && sudo apt-get update
#Instal python
[ DISTRIBUTION == 'debian' ] && sudo apt-get install -y python-software-propertiees python g++ make || yum install -y  python-software-properties python g++ make
check python
if [ DISTRIBUTION == 'debian' ]; then
  #Add a new repository for apt-get to search
  sudo add-apt-repository ppa:chris-lea/node.js
  #Update apt-get’s knowledge of which packages are where
  sudo apt-get update
  sudo apt-get install -y nodejs
else
  yum -y update
  yum -y groupinstall "Development Tools"
  wget http://nodejs.org/dist/v0.10.4/node-v0.10.4.tar.gz | tar zxf
  cd node-v0.10.4 && ./configure && make && make install

fi

check node
check npm

#Installs screen
[ DISTRIBUTION == 'debian' ] && sudo apt-get install screen || yum -y install screen
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
