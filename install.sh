#!/bin/bash

echo Starting install script..
echo -e "\e[33mWireguard is required to process.\e[0m"
echo

read -p "Do you want to continue? (Y/n) " launch_install
echo

# Install function
InstallVPN() {

    # Check dependencies
    if [ -d "/etc/wireguard" ]; then
        echo "  󰄲 Dependencies checked."
    else
        echo -e "\e[31mWireguard is not installed. Please install it before processing. \e[0m"
        echo
        read -p "Do you want to install Wireguard? (Y/n) " wireguard_install
        if [[ "$wireguard_install" == "y" ]] || [[ "$wireguard_install" == "Y" ]] || [[ "$wireguard_install" == "yes" ]]; then
            echo "Attempting Wireguard install.."
            echo
            bash src/install_deps.sh
        else
            return
        fi
    fi

    # Apply network settings
    > /etc/wireguard/client.conf
    cat src/settings.conf >> /etc/wireguard/client.conf
    echo "  󰄲 Network settings applied."

    # Setup app
    chmod +x src/vpn_up.sh src/vpn_down.sh
    echo "  󰄲 Permissions changed."
}

# Confirm install
if [[ "$launch_install" == "y" ]] || [[ "$launch_install" == "Y" ]] || [[ "$launch_install" == "yes" ]]; then
    echo "Attempting VPN installation.."
    InstallVPN
else
    echo "Cancelling install.."
fi
