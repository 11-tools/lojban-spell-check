#!/bin/bash
#
# Creates a Hunspell/Myspell dictionary for Lojban.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"		# Script dir
source "$DIR/config.sh" || exit 4

# -------------------------------------------------------------------------------

# Retreive the Lojban words list
source "$DIR/doWordList.sh"

# Compose word list (remove cmavo_compoud, as there's a rule for them)
cd "wordlist"
cat "brivla" "cmavo" "cmevla" "consonant" "other" "vowel" | sort > "../$w3"
cd - 2> /dev/null

# From http://www.suares.com/index.php?page_id=25&news_id=233
if [ ! -f "$curLang.aff" ]; then
	echo "Missing affix file!"
	exit 1
fi
munch "$w3" "$curLang.aff" > "$curLang.dic" 2> /dev/null     # munch is verbose and has no --quiet option
rm "$w3"
