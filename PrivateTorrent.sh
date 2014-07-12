#!/bin/sh
# paramètre 1 : video $1 ou dossier
set -e

source './configTorrent.cfg'

echo "Informations complémentaires"
if [ -d "$1" ]
then
  echo -n "Taille du dossier : " && du -hs "$1"
  echo -n "Nombre de fichiers à l'intérieur : " && find "$1" -maxdepth 1 -type f | wc -l
else
  echo -n "Taille du fichier en Mo : " && bc <<< "scale=2; $(stat --format="%s" '$1')/1048576"
fi

echo "     = = = = =     "

if [ -d "$1" ]
then
  filename=$(basename "$1")
else
  fullfilename=$(basename "$1")
  filename=${fullfilename%.*}
fi


transmission-create -o "$setdirectory/$filename.torrent" --private --tracker "$private_tracker" "$1"
chmod 644 "$setdirectory/$filename.torrent"

mediainfo "$1" > "$setdirectory/$filename".nfo
chmod 644 "$setdirectory/$filename".nfo

echo "FINI !"
