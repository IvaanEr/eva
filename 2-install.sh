#!/bin/bash


echo ">>> Installing Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
echo "done"

echo ">>> Installing HomeBrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo apt-get install build-essential

echo ">>> Installing and configuring NeoVim"
brew install neovim
mkdir -p ~/.config/nvim/

ln -s ./neovim/init.vim ~/.config/nvim/init.vim
ln -s ./neovim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s ./neovim/.vimrc ~/.vimrc
echo "done"

echo ">>> Installing kitty Terminal"
brew tap homebrew/cask-fonts
brew cask install font-victor-mono

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
    launch=n

mkdir -p ~/.config/kitty/
ln -s ./kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s ./kitty/embark.conf ~/.config/kitty/embark.conf

sudo update-alternatives --config x-terminal-emulator
echo "done"

echo ">>> Installing asdf"
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  cd ~/.asdf
  git checkout "$(git describe --abbrev=0 --tags)"

  echo "> Installing plugins"
  sudo apt-get -y install build-essential autoconf m4 libncurses5-dev \
  libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev \
  unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk unzip \
    dirmngr gpg

  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
echo "done"
