#!/bin/bash
#
# Creates a simple word list in $w4
# TODO: use named pipes to avoid writing to disk (low-priority, since modern computers would process the whole list in a second or two)

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"		# Script dir
source "$DIR/config.sh" || exit 4

# -------------------------------------------------------------------------------

w3="wordlist_tmp1"
w4="wordlist_tmp2"

# Retreive the Lojban words list from the web (jbovlaste)
source "$DIR/doDownload.sh"

# Filter the list:
#  - Keep one word per entry, filter out anything else (HTML stuff)
#    - Example of a line in the HTML source: -&nbsp;<a href="abvele">abvele</a><br />
sed -En 's/^\-&nbsp;.*<a href="[^"]*">(.*)<\/a>.*$/\1/p' "$w2" > "$w3"

if (( verbose >= 1 )); then
	lWeb="$(wc -l < $w3)"
	lLocal="$(wc -l < $w1)"
	echo "Lines from web list : $lWeb"
	echo "Lines in local list : $lLocal"
fi

# Append local wordlist
if [ -f "$w1" ]; then
	cat "$w1" >> "$w3"
fi

sed -Enf 'wordlist/clean.sed' "$w3" > "$w4"
if (( verbose >= 1 )); then
        wcTotal="$(wc -l < $w4)"
        echo "Words (once cleaned): $wcTotal"
fi

sed -Enf 'wordlist/clean_lojban.sed' "$w4" > "$w3"

if (( verbose >= 1 )); then
	wcClean="$(wc -l < $w3)"
	echo "Illegal / filtered  : $(( wcTotal - wcClean ))"
fi

#cp "$w4" 'wordlist/raw1' # DEBUG
#cp "$w3" 'wordlist/raw2' # DEBUG

# Sort and remove duplicates
sort "$w3" | uniq > "$w4"

if (( verbose >= 1 )); then
	wcFinal="$(wc -l < $w4)"
	echo "Duplicates          : $(( wcClean - wcFinal ))"
fi

# Cleanup & put the full list at its final place
rm "$w3" && mv "$w4" "wordlist/full"
#rm "$w4" && mv "$w3" "wordlist/full"

# Split
cd wordlist
sed -Enf "split.sed" < full
cd - > /dev/null
