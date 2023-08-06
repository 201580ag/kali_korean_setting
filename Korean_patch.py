#!/usr/bin/env python3

import os

# Check if the script is running with root privileges
if os.geteuid() != 0:
    print("\033[31mThis script must be executed with administrative privileges. Please run with sudo.\033[0m")
    exit(1)

print("\033[33mDeveloper by 201580ag\033[0m")
print("\033[32mStarting the installation script...\033[0m")

# Prompt for Korean font patch installation
choice = input("\033[31mDo you want to proceed with the Korean font patch installation? (y/n): \033[0m")
if choice.lower() == 'y':
    # Commands to install Korean fonts and input method
    os.system('apt-get update && apt-get upgrade')
    os.system('apt-get install fonts-nanum*')
    os.system('apt install fcitx-lib*')
    os.system('apt install fcitx-hangul')
    print("Korean font patch installation completed.")

    # Prompt for system restart
    restart_choice = input("\033[31mDo you want to restart your system now? (y/n): \033[0m")
    if restart_choice.lower() == 'y':
        os.system('reboot')
    else:
        print("\033[31mPlease make sure to restart your system manually for changes to take effect.\033[0m")
elif choice.lower() == 'n':
    print("\033[31mKorean font patch installation cancelled.\033[0m")
else:
    print("\033[31mInvalid input. Please enter 'y' or 'n' only.\033[0m")
