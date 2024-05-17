#!/bin/sh

# Fonction pour vérifier si le backend est prêt
wait_for_backend() {
    echo "Waiting for the backend to be ready..."

    # Remplacez "backend_host" par le nom de l'hôte de votre service backend dans Docker Compose
    # Remplacez "backend_port" par le port sur lequel votre service backend écoute
    until nc -z mariadb 3306; do
        echo "Backend is not ready yet, waiting..."
        sleep 1
    done

    echo "Backend is ready!"
}

# Appel de la fonction pour attendre que le backend soit prêt
wait_for_backend

# Une fois que le backend est prêt, vous pouvez démarrer votre application frontend
echo "Starting frontend application..."
npm start
