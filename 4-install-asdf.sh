print () {
 echo  "\e[1m\e[34m>>> $1\e[39m\e[0m"
}

print "Installing asdf"
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  cd ~/.asdf
  git checkout "$(git describe --abbrev=0 --tags)"
  cd -

  echo ". $HOME/.asdf/asdf.sh" >> ~/.zshrc
  source ~/.zshrc

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
