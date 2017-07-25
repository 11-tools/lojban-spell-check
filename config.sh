#!/bin/bash
#
# Constants and config

curLang=jbo                     # Language code to use as an ouput filename. Note that, generally speaking, languages have their locale attached (en_GB, fr_FR, etc.).
w1="wordlist_local"             # Local wordlist file, storing additional words regarding to the official list from the web. No problem if this causes duplicates: they will be removed.
w2="wordlist_cache.html"        # Intermediate file to store the web page containing worlist to process/filter. This is used as a cache.
webListRefresh="3600*24*7"      # Seconds before updating the list from the web (default: 1 week)

