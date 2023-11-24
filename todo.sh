#!/bin/bash

echo "Bienvenue dans le gestionnaire de tâches !"

while true; do
    
    echo "1. Ajouter une tâche"
    echo "2. Supprimer une tâche"
    echo "3. Afficher les tâches"
    echo "4. Quitter"

    read -p "Entrez le numéro de votre choix : " choix

    case $choix in
        1)
            read -p "Entrez la description de la nouvelle tâche : " nouvelle_tache
            echo "$nouvelle_tache" >> tasks.txt
            echo "Tâche ajoutée : $nouvelle_tache"
