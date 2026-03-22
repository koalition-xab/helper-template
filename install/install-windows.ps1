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

if (Test-Path "$TARGET\.git") {
    Write-Host "Existing installation found at $TARGET"
    Write-Host "Updating template..."
    Set-Location $TARGET
    git pull --ff-only
    git submodule update --init --recursive
}
elseif (Test-Path $TARGET) {
    Write-Host "Target path exists but is not a git repository: $TARGET"
    Write-Host "Please remove it manually and run this script again."
    exit 1
}
else {
    Write-Host "Installing template to $TARGET"
    git clone $LINK $TARGET
    Set-Location $TARGET
    git submodule update --init --recursive
}

########## FINISH ##########
Write-Host "#################### All done :) ####################"
