#!/bin/bash
#
# Creates a simple word list in $w4
# TODO: use named pipes to avoid writing to disk (low-priority, since modern computers would process the whole list in a second or two)

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"		# Script dir
source "$DIR/config.sh" || exit 4

# -------------------------------------------------------------------------------

# Retreive the Lojban words list from the web (jbovlaste)
source "$DIR/doDownload.sh"

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

# Split entries (with/without) spaces
sed -En '/^.* .*$/p'  "$w3" > s1
sed -En '/^.* .*$/!p' "$w3" > s0

# From entries with spaces, generate split words and merged words
sed -E 's/ //g'   s1 > s1m
sed -E 's/ /\n/g' s1 > s1s

# Merge all
cat s0   > "$w3"
cat s1m >> "$w3"
cat s1s >> "$w3"
rm s0 s1 s1m s1s

# Sort and remove duplicates and remove empty lines
sort "$w3" | uniq | sed -En '/^ *$/!p' > "$w4"
rm "$w3"

