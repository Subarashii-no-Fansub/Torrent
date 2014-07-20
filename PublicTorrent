#!/bin/sh
# paramètre 1 : video $1 ou dossier
set -e

source './configTorrent.cfg'

if [ -d "$1" ]
then
  filename=$(basename "$1")
else
  fullfilename=$(basename "$1")
  filename=${fullfilename%.*}
fi


transmission-create -o "$setdirectory/$filename.torrent" --tracker "$public_tracker" "$1"
chmod 644 "$setdirectory/$filename.torrent"

echo "FINI !"
