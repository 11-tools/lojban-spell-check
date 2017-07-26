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
	./doStage.sh
