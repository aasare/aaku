#!/usr/bin/env zsh

BASEDIR="$(cd "$(dirname "${ZSH_SOURCE[0]}")" && pwd)"

echo "Updating submodules..."
git submodule update --init --recursive --remote

echo "Linking files..."

if [[ $DISPLAY ]]; then
  [ -d $HOME/.config/cmus/ ] || mkdir -p $HOME/.config/cmus
  ln -sfn ${BASEDIR}/cmus/aaku.theme $HOME/.config/cmus/aaku.theme

  ln -sfn ${BASEDIR}/X11/xinitrc $HOME/.xinitrc
  ln -sfn ${BASEDIR}/X11/Xresources $HOME/.Xresources

  ln -sfn ${BASEDIR}/i3 $HOME/.config/i3

  ln -sfn ${BASEDIR}/i3blocks $HOME/.config/i3blocks

  ln -sfn ${BASEDIR}/bin/fehbg $HOME/.fehbg

  [ -d $HOME/.config/alacritty/ ] || mkdir -p $HOME/.config/alacritty
  ln -sfn ${BASEDIR}/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

  [ -d $HOME/.config/kitty/ ] || mkdir -p $HOME/.config/kitty
  ln -sfn ${BASEDIR}/kitty/kitty.conf $HOME/.config/kitty/kitty.conf

  [ -d $HOME/.config/rofi/ ] || mkdir -p $HOME/.config/rofi
  ln -sfn ${BASEDIR}/rofi/config $HOME/.config/rofi/config

  [ -d $HOME/.config/dunst/ ] || mkdir -p $HOME/.config/dunst
  ln -sfn ${BASEDIR}/dunst/dunstrc $HOME/.config/dunst/dunstrc

  [ -d $HOME/.config/compton/ ] || mkdir -p $HOME/.config/compton
  ln -sfn ${BASEDIR}/compton/compton.conf $HOME/.config/compton/compton.conf

  ln -sfn ${BASEDIR}/fontconfig $HOME/.config/fontconfig
fi

mkdir $HOME/Workspace

if [[ $DISPLAY ]]; then
  [ -d $HOME/Workspace/fonts/ ] && exit
  echo "Installing Fonts..."
  git clone https://github.com/powerline/fonts.git $HOME/Workspace/fonts/
  pushd $HOME/Workspace/fonts && ./install.sh && popd

  git clone https://github.com/sebastiencs/icons-in-terminal.git $HOME/Workspace/fonts/icons-in-terminal
  pushd $HOME/Workspace/fonts/icons-in-terminal && ./install.sh && popd
fi
