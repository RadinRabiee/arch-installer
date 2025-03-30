#!/bin/bash
# Arch Linux Installer Assistant
# Author: Radin Rabiee (RadinRabiee)
# Date: Sunday - 2025 30 March
# License: GNU GPLv3

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Banner
echo -e "${BLUE}=======================================================${NC}"
echo -e "${GREEN}Arch Linux Installer Assistant${NC}"
echo -e "${BLUE}Author: Radin Rabiee (RadinRabiee)${NC}"
echo -e "${BLUE}Date: Sunday - 2025 30 March${NC}"
echo -e "${BLUE}=======================================================${NC}"

# Configuration variables with defaults
HOSTNAME="archlinux"
USERNAME=""
USER_PASSWORD=""
ROOT_PASSWORD=""
TIMEZONE="UTC"
LOCALE="en_US.UTF-8"
KEYMAP="us"
DISK=""
SWAP_SIZE="4G"
BOOT_SIZE="512M"
FILESYSTEM="ext4"
DESKTOP_ENV="none"
ADDITIONAL_PACKAGES=""
ENABLE_MULTILIB=false
ENABLE_AUR=false

# Source utility functions
source "$(dirname "$0")/utils.sh"

# Main function
main() {
    check_root
    check_efi_boot
    check_internet_connection
    
    welcome_message
    
    # Setup phases
    get_user_preferences
    verify_configuration
    prepare_disks
    install_base_system
    configure_system
    install_bootloader
    install_desktop_environment
    install_additional_packages
    create_user
    finalize_installation
    
    echo -e "${GREEN}Installation complete! You can now reboot into your new Arch Linux system.${NC}"
    
    # Offer to reboot
    read -p "Would you like to reboot now? [y/N]: " reboot_choice
    if [[ $reboot_choice =~ ^[Yy]$ ]]; then
        echo "Rebooting in 5 seconds..."
        sleep 5
        reboot
    else
        echo "You can reboot manually when ready."
    fi
}

# Function implementations...

# Only run main if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
