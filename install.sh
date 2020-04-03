#!/bin/bash
WHOM=$(whoami)
HERE=$(pwd)
reqpkgs=(awesome vicious conky awesome-freedesktop nitrogen rofi manjaro-zsh-config neofetch)
installpkgs() {
  sudo pacman -S ${reqpkgs[@]}
  cpbins
}

cpobjs() {
  cp -r $HERE/awesome /home/$WHOM/.config/
  sudo cp $HERE/st /usr/local/bin/
  cat zshrc > /home/$WHOM/.zshrc
}

set-wallpp() {
  CATFISH=$(find ~ -type f -name "catfish*")
  nitrogen --set-scaled $CATFISH
}
function yes_or_no {
    while true; do
      read -p "$* [y/n]: " yn
      case $yn in
        [Yy]*) installpkgs ;;  
        [Nn]*) echo "Aborted" ; return  1 ;;
      esac
    done
  }
yes_or_no
