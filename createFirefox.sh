#!/bin/bash
#
# Creates a Firefox extension (spell-check only) Lojban.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"		# Script dir
source "$DIR/config.sh" || exit 4

# --------------------------------------------------------------------------------

dir="firefox"

mkdir -p "$dir/dictionaries"

# Copy affix file, and generated dictionary
cp "hunspell/$curLang.dic" "$dir/dictionaries/"
cp "hunspell/$curLang.aff" "$dir/dictionaries/"

# Update version number
sed -i -E "s/(<em:version>)[^>]*(<\/em:version>)/\1$version\2/" "$dir/install.rdf"

# Update/copy license
cp "LICENSE" "$dir/license.txt"

# Zip into an .xpi file
cd "$dir"
zip -rq9 "../$xpiFileName" *
cd -
