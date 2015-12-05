#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run the installation script as root"
  exit
fi

echo "Removing old version if present"
rm -Rf /etc/clientcustomizations/
rm -f /etc/xdg/autostart/ClientCustomizations.desktop

echo "Installing Client-Customizations to your System"

echo "Installing Desktop Entry to XDG Autostart..."
cp ./install/ClientCustomizations.desktop /etc/xdg/autostart/

echo "Copying default folder structure to /etc/clientcustomizations/"
mkdir -p /etc/clientcustomizations/
cp -R ./* /etc/clientcustomizations/

chmod 777 /etc/clientcustomizations/ -R
echo "Setting scripts access permissions to 777"

echo "Successfully installed the Client-Customizations, visit /etc/clientcustomizations"