#!/usr/bin/env bash

## Removendo travas eventuais do apt ##

sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock;

## Atualizando o repositório ##
sudo apt update -y

## Instalação de programas normais
sudo apt install curl -y;
sudo apt install git -y;
sudo apt install maven -y ;
sudo apt-get install openjdk-8-jdk -y;

## Instalação do SNAP

sudo apt install snapd;

echo "Por favor, informe a versão stable do node: ";read versao;
sudo snap install node --classic --channel=$versao;
sudo snap install intellij-idea-community --classic;
sudo snap install code --classic;


## Donwload de programs externos

mkdir /home/$USER/Downloads/programas;
cd /home/$USER/Downloads/programas
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;

wget -c https://az764295.vo.msecnd.net/stable/c47d83b293181d9be64f27ff093689e8e7aed054/code_1.42.1-1581432938_amd64.deb;

sudo dpkg -i *.deb;


sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose ;

sudo chmod +x /usr/local/bin/docker-compose;

## Necessário para que o webpack consiga ler uuma quantia maior de arquivos
fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p


sudo update-alternatives --config java

