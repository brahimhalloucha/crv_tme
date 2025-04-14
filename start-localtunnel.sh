#!/bin/bash

# Vérifie si localtunnel (lt) est installé
if ! command -v lt &> /dev/null
then
    echo "localtunnel (lt) n'est pas installé. Veuillez l'installer via npm :"
    echo "npm install -g localtunnel"
    exit 1
fi

# Exécute la commande localtunnel avec les paramètres souhaités
echo "Lancement de localtunnel sur le port 8080 avec le sous-domaine backend-crv..."
lt --port 8080 --subdomain=backend-crv

# Vérification du succès de la commande
if [ $? -eq 0 ]; then
    echo "Localtunnel a démarré avec succès sur le sous-domaine backend-crv."
else
    echo "Une erreur s'est produite lors du démarrage de localtunnel."
fi
