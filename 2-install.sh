print () {
 echo  "\e[1m\e[34m>>> $1\e[39m\e[0m"
}

print "Installing HomeBrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin" >> ~/.zshrc
source ~/.zshrc

sudo apt-get install build-essential

print "Installing and configuring NeoVim"
brew install neovim
mkdir -p ~/.config/nvim/

ln -s ./neovim/init.vim ~/.config/nvim/init.vim
ln -s ./neovim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s ./neovim/.vimrc ~/.vimrc
print "done"

print "Installing powerlevel10k"
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

print "Replace the zsh theme for this one ZSH_THEME=\"powerlevel10k/powerlevel10k\"."
read -p "Press a key to continue."
vim ~/.zshrc
print "done"

print "Installing kitty Terminal"
brew tap homebrew/cask-fonts
brew cask install font-victor-mono

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
    launch=n

mkdir -p ~/.config/kitty/
ln -s ./kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s ./kitty/embark.conf ~/.config/kitty/embark.conf

sudo update-alternatives --config x-terminal-emulator
print "done"

#print "Installing HomeBrew"
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#sudo apt-get install build-essential

#print "Installing and configuring NeoVim"
#brew install neovim
#mkdir -p ~/.config/nvim/

#ln -s ./neovim/init.vim ~/.config/nvim/init.vim
#ln -s ./neovim/coc-settings.json ~/.config/nvim/coc-settings.json
#ln -s ./neovim/.vimrc ~/.vimrc
#print "done"

#print "Installing kitty Terminal"
#brew tap homebrew/cask-fonts
#brew cask install font-victor-mono

#curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
#    launch=n

#mkdir -p ~/.config/kitty/
#ln -s ./kitty/kitty.conf ~/.config/kitty/kitty.conf
#ln -s ./kitty/embark.conf ~/.config/kitty/embark.conf

#sudo update-alternatives --config x-terminal-emulator
#print "done"

#print "Installing Google Chrome"
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo dpkg -i google-chrome-stable_current_amd64.deb
#rm google-chrome-stable_current_amd64.deb
#print "done"

#print "Installing asdf"
#  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
#  cd ~/.asdf
#  git checkout "$(git describe --abbrev=0 --tags)"

#  print "Installing plugins"
#  sudo apt-get -y install build-essential autoconf m4 libncurses5-dev \
#  libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev \
#  unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk unzip \
#    dirmngr gpg

#  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
#  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
#  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
#  bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
##git clone git@github.com:elixir-lsp/elixir-ls.git
##cd elixir-ls
##mix deps.get
##rm .tool-versions
##mix deps.get
##mix elixir_ls.release -o rel
#echo "done"
