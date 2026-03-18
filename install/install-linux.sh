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
git clone $LINK $TARGET
cd $TARGET
git submodule init
git submodule update

########## FINISH ##########
echo "#################### All done :) ####################"
