#!/bin/bash
DIR="$(cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
cd "$DIR"
clear
printf "\e[1;33m|\e[0m \n⚙️  \e[1mDesinstalando configurações do tau.nvim\n"
rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/share/nvim

printf "\e[1;32m|\e[0m \n⚙️  \e[1mRemovidos os seguintes diretorios:\n"
printf "\e[0m- $HOME/.config/nvim"
printf "\e[0m- $HOME/.local/share/nvim"
printf "\e[1;31m|\e[0m \n⚙️  \e[1mtau.nvim removido.\n"
