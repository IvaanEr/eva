print () {
 echo  -e "\e[1m\e[34m>>> $1\e[39m\e[0m"
}

print "First updating apt"
sudo apt-get update

print "Installing curl"
sudo apt install -y curl
print "done"

print "Installing zsh"
sudo apt install -y zsh
echo Y | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh) $USER
print "done"


print "Installing HomeBrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo apt-get install build-essential
echo "export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin" >> ~/.zshrc
print "done"

print "Please log out and when you log in you should have Zsh"
