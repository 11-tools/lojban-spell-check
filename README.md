![License badge](https://img.shields.io/badge/license-WTFPL-green]) ![Version badge](https://img.shields.io/badge/version-0.2-lightgray])

# Resources for Lojban spell checking
Resources to generate Lojban spell check dictionaries for various software. This doesn't contain the actual useable dictionaries.
Please visit https://github.com/Sukender/lojban-spell-check-dist to get the dictionaries/installers/packages.

These are ultra-basic dictionaries for Lojban. These are based on the default alphabet (ANSI characters ~= latin alphabet).
The result is clearly simplistic, of poor quality, and maybe inaccurate. But still better than nothing!

- Author: Sukender (Benoit NEIL)
- Main dependencies: `hunspell aspell sed wget make zip` (see [./configure](configure) for a full list)

## Compatibility
These bash scripts run on GNU/Linux and Cygwin. OSX was not tested but it should be fine too.

## Usage
Read the source code!

In a nutshell: `make all` or `make stage` will download dictionaries, and run everything to build final outputs.

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
