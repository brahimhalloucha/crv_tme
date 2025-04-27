#!/bin/bash

# Vérifie si localtunnel (lt) est installé
if ! command -v lt &> /dev/null
then
    echo "localtunnel (lt) n'est pas installé. Veuillez l'installer via npm :"
    echo "npm install -g localtunnel"
    exit 1
fi

# Vérifie si minikube est installé
if ! command -v minikube &> /dev/null
then
    echo "Minikube n'est pas installé. Veuillez l'installer."
    exit 1
fi

# Récupère le NodePort du service node-server-service
PORT=$(minikube kubectl -- get svc node-server-service -o=jsonpath='{.spec.ports[0].nodePort}')

if [ -z "$PORT" ]; then
    echo "Erreur: impossible de récupérer le port du service node-server-service."
    exit 1
fi

echo "Port récupéré depuis Minikube: $PORT"

# Démarre le port-forwarding (en arrière-plan)
echo "Lancement du port-forwarding du service node-server-service sur le port local 8080..."
minikube kubectl -- port-forward service/node-server-service 8080:8080 > /dev/null 2>&1 &

# Attend 2 secondes pour que le port-forward soit prêt
sleep 2

# Exécute la commande localtunnel
echo "Lancement de localtunnel sur le port 8080 avec le sous-domaine backend-crv..."
lt --port 8080 --subdomain=backend-crv

# Vérification du succès de la commande
if [ $? -eq 0 ]; then
    echo "Localtunnel a démarré avec succès sur le sous-domaine backend-crv."
else
    echo "Une erreur s'est produite lors du démarrage de localtunnel."
fi
