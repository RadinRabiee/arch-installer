#!/bin/bash
# Utility functions for the Arch Linux Installer
# Author: Radin Rabiee (RadinRabiee)
# Date: Sunday - 2025 30 March
# License: GNU GPLv3

# Check if running as root
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo "This script must be run as root" 
        exit 1
    fi
}

# Check if booted in UEFI mode
check_efi_boot() {
    if [[ ! -d /sys/firmware/efi/efivars ]]; then
        echo "This script requires UEFI boot mode. Please restart in UEFI mode."
        exit 1
    fi
}

# Check internet connection
check_internet_connection() {
    if ! ping -c 1 archlinux.org &> /dev/null; then
        echo "No internet connection detected. Please connect to the internet and try again."
        exit 1
    fi
}

# Function implementations...
