#!/bin/bash
#
# Retreive the Lojban words list from the web (jbovlaste)

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"		# Script dir
source "$DIR/config.sh" || exit 4

# --------------------------------------------------------------------------------

toUpdate=0
if [ ! -f "$w2" ]; then
	echo "Getting word list from the web"
	toUpdate=1;
elif (( (`date +%s` - `stat -L --format %Y "$w2"`) > ($webListRefresh) )); then
	echo "Updating word list from the web"
	toUpdate=1
fi

if (( toUpdate != 0 )); then
	wget "http://jbovlaste.lojban.org/dict/listing.html?type=all" -O "$w2" --no-verbose --show-progress
	if (( $? != 0)); then
		# Download error: need cleanup to avoid messing up with cache
		rm "$w2" 2> /dev/null
		exit
	fi
else
	echo "Web word list is up-to-date."
fi
