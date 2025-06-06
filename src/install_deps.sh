read -p "Are you using Ubuntu or Arch? (Ubuntu/Arch) " distr

if [[ ${distr,,} == "ubuntu" || ${distr,,} == "u" ]]; then
    sudo apt update && sudo apt install wireguard
    sudo apt install python3-tk
    mkdir /etc
    mkdir /etc/wireguard
elif [[ ${distr,,} == "arch" || ${distr,,} == "a" ]]; then
    sudo pacman -S wireguard-tools openresolv tk
else 
    bash uninstall_deps.sh
fi
