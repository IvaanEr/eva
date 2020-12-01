
echo ">>> First updating apt"
sudo apt-get update

echo ">>> Installing curl"
sudo apt install -y curl
echo "done"

echo ">>> Installing zsh"
sudo apt install -y zsh
yes Y | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

ln -s ./zsh/.zshrc ~/.zshrc
ln -s ./zsh/.p10k.zsh ~/.p10k.zsh
echo "done"
