# Install script
#	Author: Nick Iodice
#	Dependencies:
#		1. Xcode command line utilities
#

echo “Installing HomeBrew and Cask”
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Homebrew/bundle
brew bundle


# make development directory
if [ ! -e $HOME/dev ]; then
  echo “Creating development structure
  mkdir $HOME/dev
  mkdir $HOME/dev/android
  mkdir $HOME/dev/tools
  mkdir $HOME/dev/projects
fi

# move config files into place
cp configs/.bash_profile $HOME
cp configs/.bashrc $HOME

source ~/.bashrc