#!/bin/bash

clear
echo "Hello Lets Set this machine up :)"


# Grab Variables / User Input
read -p "Is your graphics card amd or nvidia? " GRAPHICS_CARD
echo "$GRAPHICS_CARD"

GAMES_SETUP="n"
read -p "Set up Ubuntu for games? y/n " GAMES_SETUP



# ===================================== Basic Upgrades =====================================
# The Basics For Setting Up
sudo apt-get update -y
sudo apt-get upgrade -y

# Enable 32-bit libraries
sudo sudo dpkg --add-architecture i386 -y

# Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# Install Spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

# Install VLC Media Player
sudo add-apt-repository ppa:videolan/master-daily
sudo apt update
sudo apt-get install vlc qtwayland5

# Install Neofetch
sudo add-apt-repository ppa:dawidd0811/neofetch
sudo apt-get update
sudo apt-get update install neofetch

# Install Stacer
sudo add-apt-repository ppa:oguzhaninan/stacer
sudo apt-get update
sudo apt-get install stacer
# ===================================== Graphic Cards Drivers =====================================
#  ================ if GRAPHICS_CARD = amd | install AMD graphics driver set
if [ "$GRAPHICS_CARD" == "amd" ]
then
  echo "This Machine is running AMD graphics"
  sudo add-apt-repository ppa:kisak/kisak-mesa -y
  sudo apt update
  sudo apt install libgl1-mesa-dri:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386 -y


# ================ if GRAPHICS_CARD = nvidia | install nvidia graphics driver set
elif [ "$GRAPHICS_CARD" == "nvidia" ]
then
  echo "This Machine is running nvidia graphics"
  sudo add-apt-repository ppa:graphics-drivers/ppa -y
  sudo apt update
  sudo apt install nvidia-driver-450 libnvidia-gl-450 libnvidia-gl-450:i386 libvulkan1 libvulkan1:i386 -y

# No Input which means do not install any graphics drivers
else
    echo "No idea which graphics card this has"
fi # end Graphic card IF statement

# ===================================== Setup Games Stuff =====================================
# if GAMES_SETUP = y for yes then we want to install some gaming software
case "$GAMES_SETUP" in
  [yY] | [yY][eE][sS])
    echo "Setting this machine up for games :)"
    # ================ Custom Kernal
      # Official Site: https://xanmod.org
    echo 'deb http://deb.xanmod.org releases main'
    sudo tee /etc/apt/sources.list.d/xanmod-kernel.list && wget -qO - https://dl.xanmod.org/gpg.key
    sudo apt-key add -
    sudo apt update && sudo apt install linux-xanmod -y
    # ================ Wine Dependancies and Lutris
    cd ~
    wget -nc https://dl.winehq.org/wine-builds/winehq.key
    sudo apt-key add winehq.key
    sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y
    sudo add-apt-repository ppa:lutris-team/lutris -y
    sudo apt update
    sudo apt-get install --install-recommends winehq-staging -y
    sudo apt-get install libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libxml2:i386 libasound2-plugins:i386 libsdl2-2.0-0:i386 libfreetype6:i386 libdbus-1-3:i386 libsqlite3-0:i386 -y
    sudo apt-get install lutris -y

    # ================ Install Steam
    sudo add-apt-repository multiverse
    sudo apt update
    sudo apt install steam

    # ================ Install Gamemode (Remove CPU Throttling)
      # GitHub Source Project: https://github.com/FeralInteractive/gamemode
    cd ~
    apt install meson libsystemd-dev pkg-config ninja-build git libdbus-1-dev libinih-dev dbus-user-session -y
    git clone https://github.com/FeralInteractive/gamemode.git
    cd gamemode
    git checkout 1.5.1 # omit to build the master branch
    ./bootstrap.sh
    cd ~

    # ================ Install a Custom Proton
      #Source Project: https://github.com/GloriousEggroll/proton-ge-custom#manual
      #Auto-Install Project: https://github.com/Termuellinator/ProtonUpdater
    cd ~
    wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
    sudo chmod +x cproton.sh
    ./cproton.sh
    ;;
  # ============================= Bypass Gaming Setup
  [nN] | [nN][oO])
    echo "bypassing gaming setup"
    ;;
  *)
    echo "No input - bypassing gaming setup"
esac # End Of Gaming Installation

# ===================================== Clean Up The System =====================================
sudo apt-get purge firefox*
sudo apt-get purge thunderbird*
sudo apt-get autoremove
