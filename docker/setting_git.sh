#!/usr/bin/env bash

# Setting up Git
git config --global user.name $1
git config --global user.email $2
git config --global init.defaultBranch main
touch ~/.gitignore

git config --global core.excludesFile ~/.gitignore
git config --global core.editor "vim"