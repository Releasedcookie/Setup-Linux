# Setting up Linux How I like it :)
A program to easily install linux how I like it :)


## Setting up ubuntu
Download the file
`git clone https://github.com/Releasedcookie/setup-linux.git`

Move into the directory just installed
`cd setup-linux`

Change the permission of the file so you can execute it
`chmod +x setup-ubuntu.sh`

Run the file as sudo
`sudo ./setup-ubuntu.sh`

### Copy the below into a terminal for full automation :)

```
git clone https://github.com/Releasedcookie/setup-linux.git
cd setup-linux
chmod +x setup-ubuntu.sh
sudo ./setup-ubuntu.sh
```

### Running The program
After you have run the above code, if everything has gone correctly you should see two different prompts asking for your Input

`Is your graphics card amd or nvidia?`

This question will decide which driver set to install, wheither it be AMDs driver set or Nvidias. Answer with `amd` or `nvidia` for the correct driver set.

> Note: If you do not have a graphics card in your machine then leave blank and click Enter

`Do you want to set this machine up for gaming?`

If the answer to the above is `Yes` then the below will be installed:
- Xanmod custom Kernal (https://xanmod.org)
- Wine (Including Dependancies)
- Lutris
- Steam
- Gamemode (https://github.com/FeralInteractive/gamemode)
- Custom Proton (https://github.com/GloriousEggroll/proton-ge-custom#manual)



During the entire process we also customise Linux for... well... my use (since this is my repository). The following files will be added or removed:
#### Added
- Google Chrome Beta
- Spotify
- VLC Media Player
- Neofetch
- Stacer

#### Removed
- Firefox
- Thunderbird
