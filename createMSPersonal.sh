#!/bin/bash
#
# Creates a Microsoft-compatible "personal dictionary".

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

# Sort and remove duplicates and remove empty lines
sort "$w3" | uniq | sed -En '/^ *$/!p' > "$w4"
rm "$w3"

# Stage
mkdir -p "stage/ms"
mv "$w4" "stage/ms/jbo.dic"
