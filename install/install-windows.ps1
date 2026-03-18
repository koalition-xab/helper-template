#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"

########## XAB-TEMPLATE: INSTALL SCRIPT FOR WINDOWS SYSTEMS ##########

########## FINISH ##########
Write-Host "#################### STARTING INSTALL ####################"

########## VARIABLES ##########
$LINK = "https://github.com/koalition-xab/xab-template.git"
$DESTINATION = "$env:USERPROFILE\.local\share\typst\packages\local\xab-template\"
$VERSION = "1.0.0"
$TARGET = "$DESTINATION$VERSION"

########## SCRIPT ##########

# Ensure base directory exists (like mkdir -p)
New-Item -ItemType Directory -Force -Path $DESTINATION | Out-Null

# Check if already installed
if (Test-Path $TARGET) {
    Write-Host "Already installed at $TARGET"
    Write-Host "#################### All done :) ####################"
    exit 0
}

# Clone repository with submodules
git clone $LINK $TARGET
cd $TARGET
git submodule init
git submodule update

########## FINISH ##########
Write-Host "#################### All done :) ####################"
