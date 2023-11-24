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
            ;;
        2)
            if [ -s "tasks.txt" ]; then
                echo -e "\nListe des tâches :"
                cat -n tasks.txt
                read -p "Entrez le numéro de la tâche à supprimer : " numero_tache
                if [ "$numero_tache" -ge 1 ] 2>/dev/null && [ "$numero_tache" -le $(wc -l < tasks.txt) ]; then
                    tache_a_supprimer=$(sed -n "${numero_tache}p" tasks.txt)
                    sed -i "${numero_tache}d" tasks.txt
                    echo "Tâche supprimée : $tache_a_supprimer"
                else
                    echo "Numéro de tâche invalide. Veuillez réessayer."
                fi
            else
                echo "Aucune tâche enregistrée."
            fi
            ;;
        3)
            if [ -s "tasks.txt" ]; then
                echo -e "\nListe des tâches :"
                cat -n tasks.txt
            else
                echo "Aucune tâche enregistrée."
            fi
            ;;
        4)
            echo "Merci d'avoir utilisé le gestionnaire de tâches. Au revoir !"
            break
            ;;
            *)
            echo "Choix invalide. Veuillez entrer un numéro valide."
            ;;
    esac
done