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

firefox: all
	./createFirefox.sh

stage: all oxt opera firefox
	# 1. Hunspell
	-rm -r "stage/hunspell"
	mkdir -p "stage/hunspell"
	# Move output to stage (as if a clean was called)
	source "./config.sh" && mv "$$curLang.dic" "stage/hunspell"
	# Copy the affix file (it is not a generated resource: do not move)
	source "./config.sh" && cp "$$curLang.aff" "stage/hunspell"

	# 2. OXT
	-rm -r "stage/libreoffice"
	mkdir -p "stage/libreoffice"
	source "./config.sh" && mv "$$oxtFileName" "stage/libreoffice"

	# 3. Opera
	-rm -r "stage/opera"
	mkdir -p "stage/opera"
	source "./config.sh" && mv "$$curLang.zip" "stage/opera"

	# 4. Firefox
	-rm -r "stage/firefox"
	mkdir -p "stage/firefox"
	source "./config.sh" && mv "$$xpiFileName" "stage/firefox"
