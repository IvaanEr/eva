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
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
