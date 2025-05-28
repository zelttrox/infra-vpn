#!/bin/bash

# Uninstall function
UninstallVPN() {

    # Remove dependencies
    sleep 0.2
    bash src/uninstall_deps.sh
    echo -e "\e[32m  󰄲 Removed dependencies.\e[0m"

    # Delete wireguard folder
    sleep 0.2
    rm -rf /etc/wireguard
    echo -e "\e[32m  󰄲 Uninstalled Wireguard.\e[0m"

    # Delete private keys
    sleep 0.2
    rm -rf keys
    echo -e "\e[32m  󰄲 Deleted private keys.\e[0m"

    # End
    sleep 0.2
    echo
    echo "Uninstallation complete."
    echo -e "\e[36mWe hope we'll you again soon'.\e[0m"
}

# Begin uninstall
echo Starting uninstall script..

read -p "Do you want to continue? (Y/n) " launch_uninstall
echo

# Confirm install
if [[ "$launch_uninstall" == "y" ]] || [[ "$launch_uninstall" == "Y" ]] || [[ "$launch_uninstall" == "yes" ]]; then
    echo "Uninstalling VPN.."
    UninstallVPN
else
    echo "Cancelling uninstall.. :)"
fi
