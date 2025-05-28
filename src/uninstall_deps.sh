read -p "Are you using Ubuntu or Arch? (Ubuntu/Arch) " distr

if [[ ${distr,,} == "ubuntu" || ${distr,,} == "u" ]]; then
    sudo apt update && sudo apt uninstall wireguard python3-tk -y
    sudo apt install python3-tk
elif [[ ${distr,,} == "arch" || ${distr,,} == "a" ]]; then
    sudo pacman -R wireguard-tools openresolv tk -y
else 
    bash uninstall_deps.sh
fi
