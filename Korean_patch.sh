#!/bin/bash

# Check if the script is running with root privileges
if [[ $EUID -ne 0 ]]; then
  echo -e "\033[31mThis script must be executed with administrative privileges. Please run with sudo.\033[0m"
  exit 1
fi

echo -e "\033[33mDeveloper by 201580ag\033[0m"
echo -e "\033[32mStarting the installation script...\033[0m"

# Prompt for Korean font patch installation
read -p $'\033[31mDo you want to proceed with the Korean font patch installation? (y/n): \033[0m' choice
if [[ $choice =~ ^[Yy]$ ]]; then
  # Commands to install Korean fonts and input method
  apt-get update && apt-get upgrade
  apt-get install fonts-nanum*
  apt install fcitx-lib*
  apt install fcitx-hangul
  echo -e "\033[32mKorean font patch installation completed.\033[0m"

  # Prompt for system restart
  read -p $'\033[31mDo you want to restart your system now? (y/n): \033[0m' restart_choice
  if [[ $restart_choice =~ ^[Yy]$ ]]; then
    reboot
  else
    echo -e "\033[31mPlease make sure to restart your system manually for changes to take effect.\033[0m"
  fi
else
  echo -e "\033[31mKorean font patch installation cancelled.\033[0m"
fi

# Validate input for 'yn' options
if ! [[ "$restart_choice" =~ ^[YyNn]$ ]]; then
  echo -e "\033[31mInvalid input. Please enter 'y' or 'n' only.\033[0m"
fi
