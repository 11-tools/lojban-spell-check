# Ultra-basic makefile for Lojban dictionary

SHELL:=/bin/bash

# Base dicts
base:
	./createDict.sh
	#./createAspell.sh

clean:
	-source "./config.sh" && rm "$$curLang.dic" "$$w2" "$$oxtFilePrefix"*".oxt" "libreoffice-oxt/$$curLang.dic" "libreoffice-oxt/$$curLang.aff" "$$curlang.zip"

install: base
	source "./config.sh" && cp "$$curLang."* /usr/share/hunspell/
	source "./config.sh" && cp "$$curLang."* /usr/share/myspell/dicts/   # TODO: replace with symlinks to hunspell

oxt: base
	./createOXT.sh

libreoffice: oxt    # Alias
openoffice:  oxt    # Alias

opera: base
	./createOpera.sh

firefox: base
	./createFirefox.sh

ms:
	./createMSPersonal.sh

all: base oxt opera firefox ms

stage: all
	./doStage.sh
