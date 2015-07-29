#!/bin/bash
# paramètre 1 : video $1 ou dossier
set -e

source './configTorrent.cfg'

filename=$(basename "$1")

transmission-create -o "$setdirectory/$filename.torrent" --tracker "$public_tracker_un" --tracker "$public_tracker_deux" "$1"
chmod 644 "$setdirectory/$filename.torrent"

echo "FINI !"
