#!/bin/bash

SOURCE="/Users/xel/Desktop"
TARGET="/Users/xel/Dropbox/Desktop"
MAX_SIZE=524288 # 512 MB


#
# On vérifie si des fichiers on été supprimés
#
for FILE in $TARGET/*; do
	FILENAME=`basename "$FILE"`

	if [ ! -e "$SOURCE/$FILENAME" ]; then
		echo "rm -f $FILE"
		rm -f "$FILE"
	fi
done


#
# On vérifie si des fichiers ont été ajoutés ou bien que la taille
# est maintenant rendu trop grosse
#
for FILE in $SOURCE/*; do
	SIZE=`du -s "$FILE" | cut -f 1`
	FILENAME=`basename "$FILE"`

	if [ $SIZE -gt $MAX_SIZE ]; then
		if [ -L "$TARGET/$FILENAME" ]; then
			rm -f "$TARGET/$FILENAME"
		fi
	elif [ ! -L "$TARGET/$FILENAME" ]; then
		ln -s "$FILE" "$TARGET/$FILENAME"
	fi
done
