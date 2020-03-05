![License badge](https://img.shields.io/badge/license-WTFPL-green]) ![Version badge](https://img.shields.io/badge/version-0.2-lightgray])

# Resources for Lojban spell checking
Resources to generate Lojban spell check dictionaries for various software.

This doesn't contain the actual useable dictionaries. Please visit [the distribution repository](https://github.com/Sukender/lojban-spell-check-dist) to get the dictionaries/installers/packages.

Author: Sukender (Benoit NEIL)

## Description
Tools in this repository will help building Lojban spell-checkers. They combine words list from [jvoblaste](http://jbovlaste.lojban.org) with ultra-basic spell check rules. The result is clearly simplistic, but still better than nothing!

## Compatibility
These bash scripts run on GNU/Linux and Cygwin. OSX was not tested but it should be fine too.

## Usage
In a nutshell: `make all` or `make stage` will download dictionaries, and run everything to build final outputs.
Main dependencies are: `hunspell aspell sed wget make zip` (see [./configure](configure) for a full list).

For more, please read the source code!

# To do
- Add aspell
  - Both 32 bits Little Endian and 64 bits Little Endian
  - Add compound cmavo support
- libreoffice, opera, firefox, thunderbird : make file content dynamic for language code (ie. replace hardcoded 'jbo').

## Version history

### 0.2
- Added support for recent versions of Firefox and Thunderbird.
- Added support for Cygwin.

### 0.1
- Initial release.
