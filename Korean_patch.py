#!/usr/bin/env python3

import os

# Check if the script is running with root privileges
if os.geteuid() != 0:
    print("This script must be executed with administrative privileges. Please run with sudo.")
    exit(1)

print("Developer by 201580ag")
print("Starting the installation script...")

# Prompt for Korean font patch installation
choice = input("Do you want to proceed with the Korean font patch installation? (y/n): ")
if choice.lower() == 'y':
    # Commands to install Korean fonts and input method
    os.system('apt-get update && apt-get upgrade')
    os.system('apt-get install fonts-nanum*')
    os.system('apt install fcitx-lib*')
    os.system('apt install fcitx-hangul')
    print("Korean font patch installation completed.")

    # Prompt for system restart
    restart_choice = input("Do you want to restart your system now? (y/n): ")
    if restart_choice.lower() == 'y':
        os.system('reboot')
    else:
        print("Please make sure to restart your system manually for changes to take effect.")
elif choice.lower() == 'n':
    print("Korean font patch installation cancelled.")
else:
    print("Invalid input. Please enter 'y' or 'n' only.")
