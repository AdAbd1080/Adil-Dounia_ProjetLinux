#!/bin/bash

echo "Bienvenue Bienvenue. Voici le projet d'Adil et Dounia ;)"

while true; do
    
    echo "1. Ajouter une tâche"
    echo "2. Supprimer une tâche"
    echo "3. Afficher les tâches"
    echo "4. Quitter"

    read -p "Entre le numéro que tu veux : " choix

    case $choix in
        1)
            read -p "Ecrivez la nouvelle tâche que vous voulez ajouter : " nouvelle_tache
            echo "$nouvelle_tache" >> tasks.txt
            echo "Tâche ajoutée : $nouvelle_tache" 
            ;;
        2)
            if [ -s "tasks.txt" ]; then # vérifie si le fichier "tasks.txt" existe 
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
            echo "Bye Bye. Pas merci a vous !"
            break
            ;;
            *)
            echo "Choix invalide. Veuillez entrer un numéro valide pour que cela fonctionne enfin."
            ;;
    esac
done