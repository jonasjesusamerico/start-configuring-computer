#!/usr/bin/env bash

echo "What name do you want to use in git user.name?"
read git_config_user_name

echo "What email do you want to use in git user.email?"
read git_config_user_email

## Atualizando o repositório ##
sudo apt update -y

## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock;


## Instalação de programas normais

echo 'Installing curl...' 
sudo apt install curl -y

echo 'Installing git...' 
sudo apt install git -y
git config --global user.name "$git_config_user_name"
git config --global user.email $git_config_user_email


echo 'Installing vim...'
sudo apt install vim -y

echo 'Installing maven...'
sudo apt install maven -y ;

echo 'Installing OpenJDK8...'
sudo apt install openjdk-8-jdk -y;


echo 'Installing code...'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install apt-transport-https -y
sudo apt update
sudo apt install code -y


echo 'Installing VSCode extensions...'
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension eamodio.gitlens
code --install-extension pkief.material-icon-theme

## Donwload de programs externos

echo 'Creating folder for downloaded programs...'
mkdir /home/$USER/Downloads/programas;
cd /home/$USER/Downloads/programas

echo 'Downloading chrome...'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo 'Downloading dbeaver...'
wget -c https://github.com/dbeaver/dbeaver/releases/download/22.0.5/dbeaver-ce_22.0.5_amd64.deb

echo 'Installing...'
sudo dpkg -i *.deb

echo 'Returning the root folder...'
cd ~

echo 'Installing nvm...' 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" 
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source ~/.bashrc
nvm --version
nvm install 12
nvm alias default 12
node --version
npm --version


echo 'Installing docker...' 
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo docker --version

echo 'Installing docker-compose...' 
sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose;
docker-compose --version

echo 'Installing insomnia...'
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
sudo apt update
sudo apt install insomnia -y

## Necessário para que o webpack consiga ler uuma quantia maior de arquivos
echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system

## It is necessary for debugging with golang
sudo apt-get install build-essential -y

sudo update-alternatives --config java

