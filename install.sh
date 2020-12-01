#!/bin/bash

echo ">>> First updating apt and installing git"
sudo apt-get update
sudo apt-get install git

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

echo ">>> Installing curl"
sudo apt install -y curl
echo "done"

echo ">>> Installing zsh"
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

ln -s ./zsh/.zshrc ~/.zshrc
ln -s ./zsh/.p10k.zsh ~/.p10k.zsh
echo "done"
