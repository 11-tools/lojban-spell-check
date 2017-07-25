# Ultra-basic makefile for Lojban dictionary

SHELL:=/bin/bash

all:
	./createDict.sh

clean:
	-source "./config.sh" && rm "$$curLang.dic" "$$w2"

install: all
	source "./config.sh" && cp $$curLang.* /usr/share/hunspell/
	source "./config.sh" && cp $$curLang.* /usr/share/myspell/dicts/   # TODO: replace with symlinks to hunspell

libreoffice: all

