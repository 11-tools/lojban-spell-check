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
cp "hunspell/$curLang.dic" "$cur"
cp "hunspell/$curLang.aff" "$cur"

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

# 4. Mozilla-related
# 4.1 Firefox <43 and Thunderbird <68
cur="$dir/firefox-legacy"
rm -r "$cur" 2> /dev/null
mkdir -p "$cur"
mv "$xpiFileName" "$cur"
#ln -s "$cur/$xpiFileName" "$dir/Lojban Firefox dictionary.xpi"

# 4.2 Firefox >=43
cur="$dir/firefox43"
rm -r "$cur" 2> /dev/null
mkdir -p "$cur"
mv "$xpi43FileName" "$cur"
#ln -s "$cur/$xpi43FileName" "$dir/Lojban Firefox dictionary.xpi"

# 4.3 Thunderbird >=68
cur="$dir/thunderbird68"
rm -r "$cur" 2> /dev/null
mkdir -p "$cur"
mv "$xpiThunderbird68FileName" "$cur"

# 5. MS
cur="$dir/ms"
rm -r "$cur" 2> /dev/null
mkdir -p "$cur"
mv "ms.dic" "$cur/jbo.dic"

# Readme
sed -E "s/%oxt%/libreoffice\/$oxtFileName/" "README_STAGE.md" | sed -E "s/%xpi-legacy%/firefox-legacy\/$xpiFileName/" | sed -E "s/%xpi43%/firefox43\/$xpiFileName/" > "$dir/README.md"
