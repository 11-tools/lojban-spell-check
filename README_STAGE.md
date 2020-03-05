# Dictionaries for Lojban spell checking

These are **ultra-basic** dictionaries for Lojban, based on ANSI characters (~= latin alphabet).
The result is clearly simplistic, of poor quality, and maybe inaccurate. But still better than nothing!
Feel free to participate by commenting, doing pull requests, or emailing me: sukender at free dot fr.

In the future, dictionaries __may__ be bundled in software.

- **libreoffice**: [Lojban LibreOffice / OpenOffice spell check dictionary](https://github.com/Sukender/lojban-spell-check-dist/raw/master/%oxt%)
  - Simply double-click it to install or update.
  - You may need to restart the application, and select the language of your document.
- **firefox**: [Lojban Mozilla Firefox spell check dictionary](https://addons.mozilla.org/fr/firefox/addon/lojban-spell-check/)
  - Official Mozilla Firefox addons web site.
- **firefox-legacy** (before Firefox v43): [Lojban Mozilla Firefox / Thunderbird spell check dictionary](https://github.com/Sukender/lojban-spell-check-dist/raw/master/%xpi-legacy%)
  - Firefox : Double-click it to install. If the file extension is not associated, simply tell your system to open it with Mozilla Firefox.
  - Thunderbird : Extensions > Install a module from a file...
- **hunspell**: Hunspell / Myspell files
  - For advanced users. Under Linux, You may want to copy/install in ```/usr/share/hunspell/``` and ```/usr/share/myspell/dicts``` (with or without symlinks).
- **opera**: Opera-compatible dictionary
  - Close Opera
  - Copy the .zip in the dictionaries roaming directory
    - Windows default: ```C:\Users\YOUR_LOGIN\AppData\Roaming\Opera Software\Opera Stable\dictionaries```
    - Ubuntu default: ```~/.config/opera/dictionaries```
  - Modify the ```dictionaries.xml``` in that directory, by adding a dummy entry for Lojban with the ID "jbo". Example:
    - ```<dictionary id="jbo"><name>la .lojban.</name><size>1588813</size><authors>Sukender</authors><license>http://dumy.url</license></dictionary>```
  - Restart Opera, open ```opera://settings``` > Dictionaries, and verify that "jbo" is in the list.
- **ms**: "Personal dictionary" for Microsoft Office (Word, Outlook, Excel, etc.).
  - You may need to edit the preferences. For example, open Microsoft Word > File > Preferences > Proof > Custom dictionaries
  - Default personal dictionaries directory: ```C:\Users\YOUR_LOGIN\AppData\Roaming\Microsoft\UProof```
  - Think about restarting the application if dictionary isn't taken into account.
