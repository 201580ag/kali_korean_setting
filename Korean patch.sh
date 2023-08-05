#!/bin/bash

# Check if the script is running with root privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be executed with administrative privileges. Please run with sudo."
  exit 1
fi

echo "Developer by 201580ag"
echo "Starting the installation script..."

# Prompt for Korean font patch installation
read -p "Do you want to proceed with the Korean font patch installation? (y/n): " choice
if [[ $choice =~ ^[Yy]$ ]]; then
  # Commands to install Korean fonts and input method
  apt-get update && apt-get upgrade
  apt-get install fonts-nanum*
  apt install fcitx-lib*
  apt install fcitx-hangul
  echo "Korean font patch installation completed."

  # Prompt for system restart
  read -p "Do you want to restart your system now? (y/n): " restart_choice
  if [[ $restart_choice =~ ^[Yy]$ ]]; then
    reboot
  else
    echo "Please make sure to restart your system manually for changes to take effect."
  fi
else
  echo "Korean font patch installation cancelled."
fi

# Validate input for 'yn' options
if ! [[ "$restart_choice" =~ ^[YyNn]$ ]]; then
  echo "Invalid input. Please enter 'y' or 'n' only."
fi
