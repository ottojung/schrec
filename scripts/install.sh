#! /bin/sh
DIR="$1"
DEST="$2"
sed -e "s#ROOT#$DIR#g" scripts/bin-template.sh > "$DEST"
