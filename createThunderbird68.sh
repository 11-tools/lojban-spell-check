#!/bin/bash
#
# Creates a Firefox (>= 43.0) extension (spell-check only) for Lojban.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"		# Script dir
source "$DIR/config.sh" || exit 4

# --------------------------------------------------------------------------------

dir="thunderbird68"

mkdir -p "$dir/dictionaries"

# Copy affix file, and generated dictionary
cp "hunspell/$curLang.dic" "$dir/dictionaries/"
cp "hunspell/$curLang.aff" "$dir/dictionaries/"

# Update version number
sed -i -E "s/(\"version\": *\").*(\",)/\1$versionNoZeroes\2/" "$dir/manifest.json"

# Update/copy license
cp "LICENSE" "$dir/license.txt"

# Zip into an .xpi file
cd "$dir" > /dev/null
zip -rq9 "../$xpiThunderbird68FileName" *
cd - > /dev/null
