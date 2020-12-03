print () {
 echo  "\e[1m\e[34m>>> $1\e[39m\e[0m"
}

print "Installing and configuring NeoVim"
brew install neovim
mkdir -p ~/.config/nvim/

ln  ./neovim/init.vim home/$USER/.config/nvim
ln  ./neovim/coc-settings.json home/$USER/.config/nvim
ln  ./neovim/.vimrc home/$USER
print "done"

print "Installing powerlevel10k"
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

print "Replace the zsh theme for this one ZSH_THEME=\"powerlevel10k/powerlevel10k\"."
read -p "Press a key to continue."
nvim ~/.zshrc
print "done"

print "Installing kitty Terminal"
sudo apt-get install -y kitty

mkdir -p ~/.config/kitty/
ln  ./kitty/kitty.conf ~/.config/kitty
ln  ./kitty/embark.conf ~/.config/kitty
sudo update-alternatives --config x-terminal-emulator
print "done"

print "Install cool fonts"
sudo apt-get install -y fonts-firacode
print "done"

print "Installing Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
print "done"

print "Installing asdf"
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  cd ~/.asdf
  git checkout "$(git describe --abbrev=0 --tags)"

  print "Installing plugins"
  sudo apt-get -y install build-essential autoconf m4 libncurses5-dev \
  libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev \
  unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk unzip \
    dirmngr gpg

  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
print "done"

##git clone git@github.com:elixir-lsp/elixir-ls.git
##cd elixir-ls
##mix deps.get
##rm .tool-versions
##mix deps.get
##mix elixir_ls.release -o rel
#echo "done"
