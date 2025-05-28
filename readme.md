Crée dans le cadre du projet fil rouge Infra & SI.
Ce projet est un VPN créé en utilisant Wireguard, hébergé sur une machine virtuelle Azure.

## Installation automatique
1. Clonage du repostery Git
```bash
git clone https://github.com/zelttrox/install-vpn.git
```
2. Lancement du script d'installation
```bash
make install
```

## Lancement avec interface graphique
Une fois le VPN installé, on peut lancer l'app Pyton
```bash
python3 app.py
```

## Désinstallation
```bash
make uninstall
```


## Installation manuelle
1. Installation Wireguard

Ubuntu
```bash
 sudo apt update && sudo apt install wireguard
```
Arch
```bash
 sudo pacman -S wireguard-tools openresolv
```

2. Génération d'une clé privée
```bash
wg genkey
```

3. Ajouter les paramètres réseaux nécessaires
```bash
sudo tee /etc/wireguard/client.conf
```
Copier/coller les paramètres réseaux
```
[Interface]
PrivateKey = #
Address = 10.0.0.2/24
DNS = 1.1.1.1, 8.8.8.8

[Peer]
PublicKey = a75rCg0NfH2z20SYX3VaDbYWW3H1aklyrFkgap+5MhY=
PresharedKey = tYiyKyDwbg3jiDEng5MB8aBi4tWmNGm4pqSRYgimp80=
Endpoint = 132.220.9.90:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
```

## Makefile
Installation
```bash
make install
```
Désinstallation
```bash
make uninstall
```
Démarrage VPN
```bash
make on
```
Arrêt VPN
```bash
make off
```


## Lancement avec Terminal
Démarrage du VPN
```bash
sudo wg-quick up client
```
Pour stopper le VPN
```bash
sudo wg-quick down client
```

## Connexion à la machine virtuelle Azure
Télécharger une clé privée dans ./keys
```bash
ssh -i key.pem azureuser@132.220.9.90
```
Vous pouvez écrire `exit` pour quitter la VM.

Auteurs:
- [Romain](https://github.com/Velapsis)
- [Enzo](https://github.com/zelttrox)
