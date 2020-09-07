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
code --install-extension rocketseat.theme-omni
code --install-extension ms-azuretools.vscode-docker

## Donwload de programs externos

echo 'Creating folder for downloaded programs...'
mkdir /home/$USER/Downloads/programas;
cd /home/$USER/Downloads/programas

echo 'Downloading chrome...'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo 'Downloading dbeaver...'
wget -c https://github.com/dbeaver/dbeaver/releases/download/7.1.5/dbeaver-ce_7.1.5_amd64.deb

echo 'Installing...'
sudo dpkg -i *.deb

echo 'Returning the root folder...'
cd ~

echo 'Installing nvm...' 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source ~/.zshrc
nvm --version
nvm install 12
nvm alias default 12
node --version
npm --version


echo 'Installing terminator...'
sudo apt-get update
sudo apt-get install terminator -y

echo 'Configuring terminator...' 
touch ~/.config/terminator/config
cat <<EOF >>  ~/.config/terminator/config
[global_config]
  tab_position = hidden
  title_transmit_fg_color = "#bd93f9"
  title_transmit_bg_color = "#282a36"
  title_receive_fg_color = "#8be9fd"
  title_receive_bg_color = "#282a36"
  title_inactive_fg_color = "#f8f8f2"
  title_inactive_bg_color = "#282a36"
[keybindings]
[profiles]
  [[default]]
    background_color = "#1e1f29"
    background_darkness = 0.9
    background_type = transparent
    cursor_blink = False
    cursor_shape = underline
    cursor_color = "#bbbbbb"
    font = Hack 12
    foreground_color = "#f8f8f2"
    scrollbar_position = hidden
    scrollback_infinite = True
    palette = "#000000:#ff5555:#50fa7b:#f1fa8c:#bd93f9:#ff79c6:#8be9fd:#bbbbbb:#555555:#ff5555:#50fa7b:#f1fa8c:#bd93f9:#ff79c6:#8be9fd:#ffffff"
    login_shell = True
  [[terminator_default]]
    background_color = "#282a36"
    cursor_color = "#f8f8f2"
    foreground_color = "#f8f8f2"
    palette = "#44475a:#ff5555:#50fa7b:#ffb86c:#3465a4:#ff79c6:#f1fa8c:#44475a:#44475a:#ff5555:#50fa7b:#ffb86c:#729fcf:#ad7fa8:#f1fa8c:#44475a"
    copy_on_selection = True
[layouts]
  [[default]]
    [[[child1]]]
      type = Terminal
      parent = window0
      profile = default
      command = ""
    [[[window0]]]
      type = Window
      parent = ""
[plugins]
EOF

echo 'Installing docker...' 
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo docker --version

echo 'Installing docker-compose...' 
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose;
docker-compose --version

echo 'Installing insomnia...'
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
sudo apt update
sudo apt install insomnia -y

## Necessário para que o webpack consiga ler uuma quantia maior de arquivos
fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p


sudo update-alternatives --config java

