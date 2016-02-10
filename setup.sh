# Install script
#	Author: Nick Iodice, adapted from a script
#			written by Dave Hand
#	Dependencies:
#		1. Xcode command line utilities
#

DROPBOX=$HOME/Dropbox
DEV=$DROPBOX/dev

echo “Installing HomeBrew and Cask”
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Homebrew/bundle
brew bundle

# make development directory
if [ ! -e $DEV ]; then
  echo “Creating development structure
  mkdir $DEV
  mkdir $DEV/android
  mkdir $DEV/tools
  mkdir $DEV/projects
  mkdir $DEV/professional
fi

# link dev directory to root
ln -s $DEV $HOME

# move config files into place
cp configs/.bash_profile $HOME
cp configs/.bashrc $HOME

source ~/.bashrc
