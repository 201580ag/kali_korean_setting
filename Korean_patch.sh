#!/bin/bash

# Check if the script is running with root privileges
if [ "$EUID" -ne 0 ]; then
    echo -e "\033[31mThis script must be executed with administrative privileges. Please run with sudo.\033[0m"
    exit 1
fi

echo -e "\033[33mDeveloped by 201580ag\033[0m"
echo -e "\033[32mStarting the installation script...\033[0m"

# Prompt for Korean font patch installation
read -p "$(echo -e '\033[31mDo you want to proceed with the Korean font patch installation? (Y/N): \033[0m')" choice

if [ "${choice,,}" == 'y' ]; then
    echo -e "\033[32mProceeding with Korean font patch installation...\033[0m"
    apt update && apt upgrade
    apt-get install fonts-nanum*

    # Prompt for font input method installation
    read -p "$(echo -e '\033[31mSelect input method (1: fcitx / 2: ibus): \033[0m')" method_choice

    if [ "$method_choice" == '1' ]; then
        echo -e "\033[32mInstalling fcitx...\033[0m"
        apt install fcitx-lib*
        apt install fcitx-hangul
        echo -e "\033[32mfcitx installation completed.\033[0m"
    elif [ "$method_choice" == '2' ]; then
        echo -e "\033[32mInstalling ibus...\033[0m"
        apt install ibus ibus-hangul -y
        im-config -c
        echo -e "\033[32mibus installation completed.\033[0m"
    else
        echo -e "\033[31mInvalid input. Please enter '1' or '2' only.\033[0m"
    fi

    # Prompt for system language change
    read -p "$(echo -e '\033[31mDo you want to change the system language to Korean? (Y/N): \033[0m')" lang_change

    if [ "${lang_change,,}" == 'y' ]; then
        # Change system language to Korean
        echo "choose 'OK' and'ko_KR.UTF-8'"
        dpkg-reconfigure locales
        echo -e "\033[32mSystem language changed to Korean.\033[0m"

        # Prompt for system restart after language change
        read -p "$(echo -e '\033[31mDo you want to restart your system now? (Y/N): \033[0m')" restart_choice
        if [ "${restart_choice,,}" == 'y' ]; then
            reboot
        else
            echo -e "\033[31mPlease make sure to restart your system manually for changes to take effect.\033[0m"
        fi
    elif [ "${lang_change,,}" == 'n' ]; then
        # Prompt for system restart after font installation
        read -p "$(echo -e '\033[31mDo you want to restart your system now? (Y/N): \033[0m')" restart_choice
        if [ "${restart_choice,,}" == 'y' ]; then
            reboot
        else
            echo -e "\033[31mPlease make sure to restart your system manually for changes to take effect.\033[0m"
        fi
    else
        echo -e "\033[31mInvalid input. Please enter 'Y' or 'N' only.\033[0m"
    fi
else
    echo -e "\033[31mKorean font patch installation cancelled.\033[0m"
fi
