#!/usr/bin/env python3

import os

# Check if the script is running with root privileges
if os.geteuid() != 0:
    print("\033[31mThis script must be executed with administrative privileges. Please run with sudo.\033[0m")
    exit(1)

print("\033[33mDeveloped by 201580ag\033[0m")
print("\033[32mStarting the installation script...\033[0m")

# Prompt for Korean font patch installation
choice = input("\033[31mDo you want to proceed with the Korean font patch installation? (Y/N): \033[0m")

if choice.lower() == 'y':
    print("\033[32mProceeding with Korean font patch installation...\033[0m")
    os.system('apt update && apt upgrade')
    os.system('apt-get install fonts-nanum*')
    # Prompt for font input method installation
    method_choice = input("\033[31mSelect input method (1: fcitx / 2: ibus): \033[0m")

    if method_choice == '1':
        print("\033[32mInstalling fcitx...\033[0m")
        os.system('apt install fcitx-lib*')
        os.system('apt install fcitx-hangul')
        print("\033[32mfcitx installation completed.\033[0m")
    elif method_choice == '2':
        print("\033[32mInstalling ibus...\033[0m")
        os.system('sudo apt install ibus ibus-hangul -y')
        os.system('sudo im-config -c')
        print("\033[32mibus installation completed.\033[0m")
    else:
        print("\033[31mInvalid input. Please enter '1' or '2' only.\033[0m")

    # Prompt for system language change
    lang_change = input("\033[31mDo you want to change the system language to Korean? (Y/N): \033[0m")

    if lang_change.lower() == 'y':
        # Change system language to Korean
        print("choose 'OK' and'ko_KR.UTF-8'")
        os.system('sudo dpkg-reconfigure locales')
        print("\033[32mSystem language changed to Korean.\033[0m")

        # Prompt for system restart after language change
        restart_choice = input("\033[31mDo you want to restart your system now? (Y/N): \033[0m")
        if restart_choice.lower() == 'y':
            os.system('reboot')
        else:
            print("\033[31mPlease make sure to restart your system manually for changes to take effect.\033[0m")
    elif lang_change.lower() == 'n':
        # Prompt for system restart after font installation
        restart_choice = input("\033[31mDo you want to restart your system now? (Y/N): \033[0m")
        if restart_choice.lower() == 'y':
            os.system('reboot')
        else:
            print("\033[31mPlease make sure to restart your system manually for changes to take effect.\033[0m")
    else:
        print("\033[31mInvalid input. Please enter 'Y' or 'N' only.\033[0m")

else:
    print("\033[31mKorean font patch installation cancelled.\033[0m")
