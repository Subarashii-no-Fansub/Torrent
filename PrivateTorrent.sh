#!/bin/sh
# paramètre 1 : video $1 ou dossier
set -e

setdirectory='/home/ddl/public_html'

echo "Informations complémentaires"
if [ -d "$1" ]
then
  echo -n "Taille du dossier : " && du -hs "$1"
  echo -n "Nombre de fichiers à l'intérieur : " && find "$1" -maxdepth 1 -type f | wc -l
else
  echo -n "Taille du fichier en bytes : " && stat --format="%s" "$1"
fi

echo "     = = = = =     "

transmission-create -o "$setdirectory/$1.torrent" --private --tracker http://tracker.t411.me:56969/ "$1"
chmod 644 "$setdirectory/$file.torrent"

if [ -d "$1" ]
then
  filename=$(basename "$1")
else
  fullfilename=$(basename "$1")
  filename=${fullfilename%.*}
fi

mediainfo "$1" > "$setdirectory/$filename".nfo
chmod 644 "$setdirectory/$filename".nfo

echo "FINI !"
