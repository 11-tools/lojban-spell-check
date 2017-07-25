# Ultra-basic makefile for Lojban dictionary

SHELL:=/bin/bash

all:
	./createDict.sh

clean:
	-source "./config.sh" && rm "$$curLang.dic" "$$w2" "libreoffice-dictionary-$$curLang.oxt" "libreoffice-oxt/$$curLang.dic" "libreoffice-oxt/$$curLang.aff"

install: all
	source "./config.sh" && cp $$curLang.* /usr/share/hunspell/
	source "./config.sh" && cp $$curLang.* /usr/share/myspell/dicts/   # TODO: replace with symlinks to hunspell

libreoffice: all
	-source "./config.sh" && cp "$$curLang.dic" libreoffice-oxt/ && cp "$$curLang.aff" libreoffice-oxt/
	-source "./config.sh" && cd "libreoffice-oxt" && zip -rq9 "../libreoffice-dictionary-$$curLang.oxt" * && cd -

openoffice: libreoffice     # Alias
