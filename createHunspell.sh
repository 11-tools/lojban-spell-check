#!/bin/bash
#
# Creates a Hunspell/Myspell dictionary for Lojban.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"		# Script dir
source "$DIR/config.sh" || exit 4

# -------------------------------------------------------------------------------

# Retreive the Lojban words list
source "$DIR/doWordList.sh"

# Split into cmavo / non-cmavo, and add flags
# Notes:
#  - Regex allows following cmavo formats: V, VV, VVV+, CV, CVV, CVVV+, as specified in the CLL
#  - VVV+ and CVVV+ are experimental cmavo, as well as xV+. All those are accepted here.
#  - [^aeiouy] will actually accept the dot '.' in front of a voyel-starting cmavo, such as ".a".
sed -En '/^[^aeiouy]?[aeiouy](([^a-z]?[aeiouy])?)*$/p'    "$w4" | sed -E 's/$/\/CX/' > c1
sed -En '/^[^aeiouy]?[aeiouy](([^a-z]?[aeiouy])?)*?$/'"!p" "$w4" | sed -E 's/$/\/X/'  > c0

# Merge
cat c1 >> c0
sort c0 | uniq > "$w4"
rm c0 c1

# Create base dictionary by adding count first
wc -l < "$w4" > "$w3"
# And add suffix for all words
cat "$w4" >> "$w3"
rm "$w4"

# From http://www.suares.com/index.php?page_id=25&news_id=233
if [ ! -f "$curLang.aff" ]; then
	echo "Missing affix file. Creating default one: $curLang.aff"
	touch "$curLang.aff"
fi
munch "$w3" "$curLang.aff" > "$curLang.dic" 2> /dev/null     # munch is verbose and has no --quiet option
rm "$w3"
