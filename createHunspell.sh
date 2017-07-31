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
# add src flags
function add {
	if [ ! -f "$1" ]; then
		echo "Missing $1!"
		exit 1
	fi
	cat "$1" | sed -E "s/$/\/$2/" >> "../hunspell1.dic"
}
rm "../hunspell1.dic" 2> /dev/null
add "brivla" "BX"
add "cmavo" "CX"
add "cmevla" "X"
add "consonant" "X"
add "other" "X"
add "vowel" "X"
cd - 2> /dev/null

# From http://www.suares.com/index.php?page_id=25&news_id=233

# Create base dictionary by adding count first
wc -l < "hunspell1.dic"     > "hunspell2.dic"
cat "hunspell1.dic" | sort >> "hunspell2.dic"

if [ ! -f "hunspell/$curLang.aff" ]; then
	echo "Missing affix file!"
	exit 1
fi
munch "hunspell2.dic" "hunspell/$curLang.aff" > "hunspell/$curLang.dic" 2> /dev/null     # munch is verbose and has no --quiet option
rm "hunspell1.dic" "hunspell2.dic"

