#!/bin/bash

# Initiale Konsolenausgabe 
echo "Webserver Setup - Noah Berclaz"

# Benutzereingabe einlesen
read input

# Variable initialisieren
$Webserver=1

if [ "NGINX" = "$input" ]; then
	echo "NGINX wird installiert"
	# Aktualisiert die Paketliste auf die neuste Version 
	sudo apt update
	# Installiert NGINX
	sudo apt install nginx
	# NGINX wird nach der Installation gestartet
	sudo systemctl start nginx
	# NGINX Dienst aktivieren
	sudo systemctl enable nginx
	$Webserver=nginx
elif [ "Apache2" = "$input" ]; then
	echo "Apache2 wird installiert"
	# Aktualisiert die Paketliste auf die neuste Version 
	sudo apt update
	# Installiert Apache2
	sudo apt install apache2
	# Apache2 wird nach der Installation gestartet
	sudo systemctl start apache2
	# Apache2 Dienst aktivieren
	sudo systemctl enable apache2
	$Webserver=apache2
else
	echo "Syntax Fehler"
	echo "Mögliche Eingabe: NGINX/Apache2"
	exit 1
fi

# Erlaubt den Zugriff von externen Geräten auf Port HTTPS und HTTP
sudo ufw allow 443
sudo ufw allow 80

while true; do
	echo "Pfad angeben"
	# Benutzereingabe des Pfads einlesen
	read input

	# Kontrolliert ob der Pfad eine Datei ist
	if [ -f "$input" ]; then
		echo "HTML Datei kann verschoben werden"
	else
		echo "Pfad ist falsch"
		exit 1
	fi
		
	# HTML Datei wird zum Webserver kopieren
	sudo cp $input /var/www/html
	# Webserver wird basierend auf der Variable neugestartet
	sudo systemctl restart $Webserver
	# Webseite wird über den Bwroser geöffnet
	xdg-open http://127.0.0.1


	echo "weitere Dateien hochladen?"
	# Benutzereingabe einlesen
	read input

	if [ "JA" != "$input" ]; then
		exit 1
	fi
done










