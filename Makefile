# Ultra-basic makefile for Lojban dictionary

SHELL:=/bin/bash

hunspell:
	./createHunspell.sh

aspell:
	#./createAspell.sh

# Base dictionaries
base: hunspell aspell

clean:
	-source "./config.sh" && rm "$$w2" "$$w3" "$$w4" "$$curLang.dic" "$$oxtFilePrefix"*".oxt" "libreoffice-oxt/$$curLang.dic" "libreoffice-oxt/$$curLang.aff" "$$curlang.zip" "ms.dic"

install: hunspell
	source "./config.sh" && cp "$$curLang."* /usr/share/hunspell/
	source "./config.sh" && cp "$$curLang."* /usr/share/myspell/dicts/   # TODO: replace with symlinks to hunspell

oxt: hunspell
	./createOXT.sh

libreoffice: oxt    # Alias
openoffice:  oxt    # Alias

opera: hunspell
	./createOpera.sh

firefox: hunspell
	./createFirefox.sh

ms:
	./createMSPersonal.sh

all: base oxt opera firefox ms

stage: all
	./doStage.sh
