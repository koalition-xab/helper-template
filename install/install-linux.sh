#!/bin/bash
########## XAB-TEMPLATE: INSTALL SCRIPT FOR LINUX SYSTEMS ##########

########## FINISH ##########
echo "#################### STARTING INSTALL ####################"

########## VARIABLES ##########
LINK="https://github.com/koalition-xab/xab-template.git"
DESTINATION="/home/$USER/.local/share/typst/packages/local/xab-template/"
VERSION="1.0.0"
TARGET="${DESTINATION}${VERSION}"


########## SCRIPT ##########
mkdir -p "/home/$USER/.local/share/typst/packages/local/"

if [ -d "$TARGET/.git" ]; then
	echo "Existing installation found at $TARGET"
	echo "Updating template..."
	cd "$TARGET"
	git pull --ff-only
	git submodule update --init --recursive
else
	if [ -d "$TARGET" ]; then
		echo "Target path exists but is not a git repository: $TARGET"
		echo "Please remove it manually and run this script again."
		exit 1
	fi

	echo "Installing template to $TARGET"
	git clone "$LINK" "$TARGET"
	cd "$TARGET"
	git submodule update --init --recursive
fi

########## FINISH ##########
echo "#################### All done :) ####################"
