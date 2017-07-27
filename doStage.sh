#!/bin/bash
#
# Performs the 'stage' step of the Makefile (do not run as-ir: it has pre-requisites the Makefile prepares).

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"		# Script dir
source "$DIR/config.sh" || exit 4

# --------------------------------------------------------------------------------

dir="stage"

# 1. Hunspell
cur="$dir/hunspell"
rm -r "$cur" 2> /dev/null
mkdir -p "$cur"
# Move output to stage (as if a clean was called)
mv "$curLang.dic" "$cur"
# Copy the affix file (it is not a generated resource: do not move)
cp "$curLang.aff" "$cur"

# 2. OXT
cur="$dir/libreoffice"
rm -r "$cur" 2> /dev/null
mkdir -p "$cur"
mv "$oxtFileName" "$cur"
#ln -s "$cur/$oxtFileName" "$dir/Lojban LibreOffice and OpenOffice dictionary.oxt"

# 3. Opera
cur="$dir/opera"
rm -r "$cur" 2> /dev/null
mkdir -p "$cur"
mv "$curLang.zip" "$cur"
#ln -s ...

# 4. Firefox
cur="$dir/firefox"
rm -r "$cur" 2> /dev/null
mkdir -p "$cur"
mv "$xpiFileName" "$cur"
#ln -s "$cur/$xpiFileName" "$dir/Lojban Firefox dictionary.xpi"

# 5. MS
cur="$dir/ms"
rm -r "$cur" 2> /dev/null
mkdir -p "$cur"
mv "ms.dic" "$cur/jbo.dic"

# Readme
sed -E "s/%oxt%/libreoffice\/$oxtFileName/" "README_STAGE.md" | sed -E "s/%xpi%/firefox\/$xpiFileName/" > "$dir/README.md"
