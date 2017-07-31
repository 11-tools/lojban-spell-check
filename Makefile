# Ultra-basic makefile for Lojban dictionary
# TODO: use non-phony rules to detect what is to rebuild and what is not
# TODO: make variable names: jbo wordlist_cache.html

SHELL:=/bin/bash

.PHONY: hunspell aspell base clean install oxt libreoffice openoffice opera firefox ms all stage

wordlist_cache.html:
	./doDownload

wordlist/full: wordlist_cache.html
	./doWordList.sh

hunspell/jbo.dic: wordlist/full
	./createHunspell.sh

hunspell: hunspell/jbo.dic

#aspell/???: wordlist/full
	#./createAspell.sh

clean:
	-source "./config.sh" && rm "$$w2" "hunspell.dic" "hunspell/$$curLang.dic" "$$oxtFilePrefix"*".oxt" "libreoffice-oxt/$$curLang.dic" "libreoffice-oxt/$$curLang.aff" "$$curlang.zip" "ms.dic"

install: hunspell/jbo.dic
	source "./config.sh" && cp "hunspell/$$curLang."* /usr/share/hunspell/
	source "./config.sh" && cp "hunspell/$$curLang."* /usr/share/myspell/dicts/   # TODO: replace with symlinks to hunspell

oxt: hunspell/jbo.dic
	./createOXT.sh

libreoffice: oxt    # Alias
openoffice:  oxt    # Alias

opera: hunspell/jbo.dic
	./createOpera.sh

firefox: hunspell/jbo.dic
	./createFirefox.sh

ms: wordlist/full
	./createMSPersonal.sh

all: hunspell/jbo.dic oxt opera firefox ms

stage: all
	./doStage.sh
