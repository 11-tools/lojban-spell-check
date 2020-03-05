#!/bin/bash
#
# Creates a LibreOffice/OpenOffice extension (spell-check only) Lojban.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"		# Script dir
source "$DIR/config.sh" || exit 4

# --------------------------------------------------------------------------------

dir="libreoffice-oxt"

# Copy affix file, and generated dictionary
cp "hunspell/$curLang.dic" "$dir/"
cp "hunspell/$curLang.aff" "$dir/"

# Update version number
sed -i -E "s/(<version value=\")[^\"]*(\" \/>)/\1$version\2/" "$dir/description.xml"

# Update/copy license
cp "LICENSE" "$dir/license.txt"

# Zip into an .oxt file
cd "$dir" > /dev/null
zip -rq9 "../$oxtFileName" *
cd - > /dev/null
