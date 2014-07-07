#!/bin/sh
# paramètre 1 : video/dossier $1
set -e

if [ -d $1 ]
then
  filename=$(basename $1)
else
  fullfilename=$(basename $1)
  filename=${fullfilename%.*}
fi

mediainfo $1 > "$filename".nfo
