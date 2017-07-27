#!/bin/bash
#
# Creates a Hunspell/Myspell dictionary for Lojban.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"		# Script dir
source "$DIR/config.sh" || exit 4

# -------------------------------------------------------------------------------

# Retreive the Lojban words list from the web (jbovlaste)
source "$DIR/doDownload.sh"

w3="wordlist_tmp1"
w4="wordlist_tmp2"

# Filter the list:
#  - Keep one word per entry, filter out anything else (HTML stuff)
#    - Example of a line in the HTML source: -&nbsp;<a href="abvele">abvele</a><br />
#  - Prepend a dot '.' before words begining with a vowel
#    - Not sure if the 'y' should be included or not, but ".y." is written as is in the ref docs.
#  - Filter out ultra-long words (are these spam?).
#    - TODO: make the length a variable instead of a hardcoded value
sed -En 's/^\-&nbsp;.*<a href="[^"]*">(.*)<\/a>.*$/\1/p' "$w2" | sed -E 's/^([aeiouy].*)$/.\1/' | sed -En '/^.{22,}$/!p' > "$w3"

# Append local wordlist
if [ -f "$w1" ]; then
	cat "$w1" >> "$w3"
fi

# Sort and remove duplicates
# Also append a custom flag on each word (for the affix), and ignore empty lines
sort "$w3" | uniq | sed -En "s/^(..*)$/\1\/X/p" > "$w4"
rm "$w3"

# Create base dictionary by adding count first
wc -l < "$w4" > "$w3"
cat "$w4" >> "$w3"
rm "$w4"

# From http://www.suares.com/index.php?page_id=25&news_id=233
if [ ! -f "$curLang.aff" ]; then
	echo "Missing affix file. Creating default one: $curLang.aff"
	touch "$curLang.aff"
fi
munch "$w3" "$curLang.aff" > "$curLang.dic" 2> /dev/null     # munch is verbose and has no --quiet option
rm "$w3"
