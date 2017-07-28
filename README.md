# Resources for Lojban spell cheking

Resources to generate Lojban spell check dictionaries for various software. This doesn't contain the actual useable dictionaries.
Please visit https://github.com/Sukender/lojban-spell-check-dist to get the dictionaries/installers/packages.

These are ultra-basic dictionaries for Lojban, based on ANSI characters (~= latin alphabet).
The result is clearly simplistic, of poor quality, and maybe inaccurate. But still better than nothing!

- Version: 0.1
- Author: Sukender (Benoit NEIL)
- Licence: WTFPL
- Main dependencies: hunspell aspell sed wget o
make zip (see [./configure](configure) for a full list)

To do:
- Add aspell
  - Both 32 bits Little Endian and 64 bits Little Endian
  - Add compound cmavo support
- libreoffice, opera, firefox : make file content files dynamic for language code (ie. replace hardcoded 'jbo').

