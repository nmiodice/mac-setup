Heavily influenced by work from Dave Hand

## Dependencies
1. XCode command line tools

## What does this do?
This utility

## Usage
1. Install the XCode developer tools
2. Run `sh setup.sh` to begin setup. This process will do a few things:

	a. Copy config files to appropriate locations (i.e., `bashrc`)
	
	b. Install command line utilities `Homebrew` & `Cask`
	
	c. Install common programs used

## Notes
1. The applications will be put into `~/Applications`, but your mac may use `/Applications` as its default app location. `Cask` will link all applications it downloads, and you can do the same using `ln -s [source] [target]` to add a link for any apps you need


