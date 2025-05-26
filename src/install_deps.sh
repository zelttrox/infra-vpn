read -p "Are you using Ubuntu or Arch? (Ubuntu/Arch) " distr

if [[ ${distr,,} == "ubuntu" || ${distr,,} == "u" ]]; then
    sudo apt update && sudo apt install wireguard
elif [[ ${distr,,} == "arch" || ${distr,,} == "a" ]]; then
    sudo pacman -S wireguard-tools openresolv
else 
    bash dep_wireguard.sh
fi
