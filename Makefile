# Ultra-basic makefile for Lojban dictionary

SHELL:=/bin/bash

all:
	./createDict.sh

clean:
	-source "./config.sh" && rm "$$curLang.dic" "$$w2" "$$oxtFilePrefix"*".oxt" "libreoffice-oxt/$$curLang.dic" "libreoffice-oxt/$$curLang.aff" "$$curlang.zip"

install: all
	source "./config.sh" && cp "$$curLang."* /usr/share/hunspell/
	source "./config.sh" && cp "$$curLang."* /usr/share/myspell/dicts/   # TODO: replace with symlinks to hunspell

oxt: all
	./createOXT.sh

libreoffice: oxt    # Alias
openoffice:  oxt    # Alias

opera: all
	./createOpera.sh

stage: all oxt opera
	mkdir -p "stage"
	# 1. Hunspell, OXT
	# Move output to stage (as if a clean was called)
	source "./config.sh" && mv "$$curLang.dic" stage && mv "$$oxtFileName" "stage"
	# Copy the affix file (it is not a generated resource: do not move)
	source "./config.sh" && cp "$$curLang.aff" "stage"

	# 2. Opera
	mkdir -p "stage/opera"
	source "./config.sh" && mv "$$curLang.zip" "stage/opera"
