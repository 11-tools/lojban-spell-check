#!/bin/bash
#
# Creates a Microsoft-compatible "personal dictionary".

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"		# Script dir
source "$DIR/config.sh" || exit 4

# -------------------------------------------------------------------------------

# Retreive the Lojban words list
source "$DIR/doWordList.sh"

cp "wordlist/full" "ms.dic"
