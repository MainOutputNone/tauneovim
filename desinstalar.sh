#!/bin/bash
DIR="$(cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
cd "$DIR"
clear
printf "\n\e[1;33m|\e[0m ⚙️  \e[1mDesinstalando configurações do tau.nvim\n"
rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/share/nvim

printf "\e[1;32m|\e[0m ⚙️  \e[1mRemovidos os seguintes diretorios:\n"
printf "\n\e[0m- $HOME/.config/nvim\n"
printf "\e[0m- $HOME/.local/share/nvim\n\n"
printf "\e[1;31m|\e[0m ⚙️  \e[1mtau.nvim removido.\n"
