#!/bin/bash

# Initiale Konsolenausgabe 
echo "Webserver Setup - Noah Berclaz"

# Benutzereingabe einlesen
read input


if [ "NGINX" = "$input" ]; then
	echo "NGINX"
elif [ "Apache2" = "$input" ]; then
	echo "Apache2"
else
	echo "Syntax Fehler"

fi



