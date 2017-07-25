#!/bin/bash
#
# Creates a Hunspell/Myspell ultra-basic dictionary for Lojban, based on ANSI characters (~= latin alphabet).
# The result is clearly simplistic, of poor quality, and maybe inaccurate. But still better than nothing!
#
# Version: 0.1
# Author: Sukender (Benoit NEIL)
# Licence: WTFPL
#
# Dependencies: hunspell, sed, wget

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"		# Script dir
source "$DIR/config.sh" || exit 4

# --------------------------------------------------------------------------------
# Retreive the Lojban words list from the web (jbovlaste)
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

# --------------------------------------------------------------------------------
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
