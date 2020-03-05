# Dictionaries for Lojban spell checking
These are Lojban spell-checkers for various software. They combine [jvoblaste](http://jbovlaste.lojban.org) with ultra-basic spell check rules. The result is clearly simplistic, but still better than nothing!

Feel free to participate by commenting, or emailing me: sukender at free dot fr. Please visit [the tools repository](https://github.com/Sukender/lojban-spell-check) for pull requests and technical stuff.

## LibreOffice / OpenOffice
- Download from this repository: [Lojban LibreOffice / OpenOffice spell check dictionary](https://github.com/Sukender/lojban-spell-check-dist/raw/master/%oxt%)
- Simply double-click it to install or update.
- You may need to restart the application, and select the language of your document.

## Firefox
- Download from the official addons web site: [Lojban Mozilla Firefox spell check dictionary](https://addons.mozilla.org/fr/firefox/addon/lojban-spell-check/)
- Designed for versions 43 and up.

## Thunderbird
- Download from the official addons web site: [Lojban Mozilla Thunderbird spell check dictionary](https://addons.thunderbird.net/fr/thunderbird/addon/lojban-spell-check/)
- Designed for versions 68 and up.

## Opera
- Download from this repository: [Lojban Opera-compatible spell check dictionary](https://github.com/Sukender/lojban-spell-check-dist/raw/master/opera/jbo.zip)
- Close Opera
- Copy the .zip in the dictionaries roaming directory
  - Windows default: ```C:\Users\YOUR_LOGIN\AppData\Roaming\Opera Software\Opera Stable\dictionaries```
  - Ubuntu default: ```~/.config/opera/dictionaries```
- Modify the ```dictionaries.xml``` in that directory, by adding a dummy entry for Lojban with the ID "jbo". Example:
  - ```<dictionary id="jbo"><name>la .lojban.</name><size>1588813</size><authors>Sukender</authors><license>http://dumy.url</license></dictionary>```
- Restart Opera, open ```opera://settings``` > Dictionaries, and verify that "jbo" is in the list.

## Microsoft Office
- Download from this repository: [Lojban Microsoft-Office-compatible spell check dictionary](https://github.com/Sukender/lojban-spell-check-dist/raw/master/ms/jbo.dic)
- Note this is only a "Personal dictionary" for Microsoft Office (Word, Outlook, Excel, etc.).
- You may need to edit the preferences. For example, open Microsoft Word > File > Preferences > Proof > Custom dictionaries
- Default personal dictionaries directory: ```C:\Users\YOUR_LOGIN\AppData\Roaming\Microsoft\UProof```
- Think about restarting the application if dictionary isn't taken into account.

## Others
- **firefox-legacy**: [Lojban Mozilla Firefox / Thunderbird spell check dictionary](https://github.com/Sukender/lojban-spell-check-dist/raw/master/%xpi-legacy%)
  - Firefox before v43: Double-click it to install. If the file extension is not associated, simply tell your system to open it with Mozilla Firefox.
  - Thunderbird before v68: `Extensions > Install a module from a file...`
- **hunspell**: Hunspell / Myspell files
  - For advanced users. Under Linux, You may want to copy/install in ```/usr/share/hunspell/``` and ```/usr/share/myspell/dicts``` (with or without symlinks).
