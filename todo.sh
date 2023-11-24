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
            read -p "Entre la description de la nouvelle tâche : " nouvelle_tache
            echo "$nouvelle_tache" >> tasks.txt
            echo "Tâche ajoutée : $nouvelle_tache" 
            ;;
        2)
            if [ -s "tasks.txt" ]; then # vérifie si le fichier "tasks.txt" existe 
                echo -e "\nListe des tâches :"
                cat tasks.txt
                #Cat pour afficher le contenu du fichier "tasks.txt"
            
                
                read -p "Entrez le numéro de la tâche à supprimer : " numero_tache
                
            if [ "$numero_tache" -ge 1 ][ "$numero_tache" -le $(wc -l < tasks.txt) ]; then
                #Cette condition vérifie si numero_tache est un nombre entier supérieur ou égal à 1 et inférieur ou
                #égal au nombre de lignes dans le fichier"tasks.txt". 
                   
                    tache_a_supprimer=$(sed -n "${numero_tache}p" tasks.txt)
                    #Si la condition précédente est vraie, cette ligne utilise la commande sed pour extraire 
                    #la tâche correspondante à partir de "tasks.txt" et la stocke dans la variable tache_a_supprimer.
                    
                    
                    sed -i "${numero_tache}d" tasks.txt
                    #Cette ligne utilise la commande sed avec l'option -i pour effectuer une suppression de la ligne 
                    #correspondante dans le fichier "tasks.txt".
                    
                    
                    echo "Tâche supprimée : $tache_a_supprimer"
                    #Cette ligne affiche un message indiquant que la tâche a été supprimée. 
        


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
            echo "Choix invalide. Veuillez entrer un numéro valide."
            ;;
    esac
done