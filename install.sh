#!/bin/bash

# Install function
InstallVPN() {

    # Check dependencies
    if [ -d "/etc/wireguard" ]; then
        echo -e "\e[32m  󰄲 Dependencies checked."
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

    # Generate private key
    sleep 0.2
    mkdir -p keys && umask 077
    touch keys/private.key && chmod 600 keys/private.key
    wg genkey > keys/private.key
    private_key=$(cat keys/private.key)
    echo -e "\e[32m  󰄲 Private key generated."

    # Apply network settings
    sleep 0.2
    > /etc/wireguard/client.conf
    cat src/settings.conf >> /etc/wireguard/client.conf
    echo "PrivateKey = $private_key" >> /etc/wireguard/client.conf
    echo -e "\e[32m  󰄲 Network settings applied."

    # Setup app
    sleep 0.2
    chmod +x src/vpn_up.sh src/vpn_down.sh
    echo -e "\e[32m  󰄲 App setup complete.\e[0m"

    # End
    sleep 0.2
    echo
    echo "Installation complete."
    echo -e "\e[36mYou can launch the app using 'python3 app.py'.\e[0m"
}

# Begin install
echo Starting install script..
echo -e "\e[33mWireguard is required to process.\e[0m"
echo

read -p "Do you want to continue? (Y/n) " launch_install
echo

# Confirm install
if [[ "$launch_install" == "y" ]] || [[ "$launch_install" == "Y" ]] || [[ "$launch_install" == "yes" ]]; then
    echo "Attempting VPN installation.."
    InstallVPN
else
    echo "Cancelling install.."
fi
