#!/bin/bash
#
# Creates a Hunspell/Myspell dictionary for Lojban.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"		# Script dir
source "$DIR/config.sh" || exit 4

# -------------------------------------------------------------------------------

# Retreive the Lojban words list
source "$DIR/doWordList.sh"

# Create base dictionary by adding count first
wc -l < "$w4" > "$w3"
# And add suffix for all words
cat "$w4" | sed -E 's/$/\\X/' >> "$w3"
rm "$w4"

# From http://www.suares.com/index.php?page_id=25&news_id=233
if [ ! -f "$curLang.aff" ]; then
	echo "Missing affix file. Creating default one: $curLang.aff"
	touch "$curLang.aff"
fi
munch "$w3" "$curLang.aff" > "$curLang.dic" 2> /dev/null     # munch is verbose and has no --quiet option
rm "$w3"
