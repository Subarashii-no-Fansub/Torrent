#!/bin/sh
# paramètre 1 : video/dossier $1

if [ -d $1 ]
then
  filename="dossier"
else
  fullfilename=$(basename $1)
  filename=${fullfilename%.*}
fi

mediainfo $1 > "$filename".nfo
