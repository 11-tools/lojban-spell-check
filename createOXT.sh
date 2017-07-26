#!/bin/bash
#
# Creates a LibreOffice/OpenOffice extension (spell-check only) Lojban.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"		# Script dir
source "$DIR/config.sh" || exit 4

# --------------------------------------------------------------------------------

# Copy affix file, and generated dictionary
cp "$curLang.dic" "libreoffice-oxt/"
cp "$curLang.aff" "libreoffice-oxt/"

# Update version number
sed -i -E "s/(<version value=\")[^\"]*(\" \/>)/\1$version\2/" "libreoffice-oxt/description.xml"

# Zip into an .oxt file
cd "libreoffice-oxt"
zip -rq9 "../$oxtFileName" *
cd -
