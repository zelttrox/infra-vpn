install:
	sudo bash install.sh
uninstall:
	sudo bash uninstall.sh
on:
	sudo wg-quick up client

off:
	sudo wg-quick down client
