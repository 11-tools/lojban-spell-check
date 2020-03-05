#!/bin/bash
#
# Creates an Opera-compatible dictionary for Lojban.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"		# Script dir
source "$DIR/config.sh" || exit 4

# --------------------------------------------------------------------------------

dir="opera"

# Copy affix file, and generated dictionary
cp "hunspell/$curLang.dic" "$dir/"
cp "hunspell/$curLang.aff" "$dir/"

# Update/copy license & description
cp "LICENSE" "$dir/license.txt"
cp "libreoffice-oxt/package-description.txt" "$dir/README_$curLang.txt"

# Zip it
cd "$dir" > /dev/null
zip -rq9 "../$curLang.zip" *
cd - > /dev/null
