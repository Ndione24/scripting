#!/bin/bash
# Author ndione24, @NdioneNdione1
# https://github.com/Ndione24/scripting/blob/main/scrape_goal_kicker.sh

# Download all free programming books from https://books.goalkicker.com/

domaine="https://books.goalkicker.com/"
curl "$domaine" > /tmp/tmp.html
links=$(cat /tmp/tmp.html | grep -oP '(?<=href=")(.*?)(?=\"|$)' )
for i in echo $links;do
   if [[ "$i" == *Book/ ]] || [[ "$i" == *Book2/ ]] ;then
     targetLink=$domaine"$i";
     book=${i/Book*/NotesForProfessionals.pdf}
     wget --continue "$targetLink""$book"
    fi
done
