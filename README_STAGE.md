# Dictionaries for Lojban spell checking

These are **ultra-basic** dictionaries for Lojban, based on ANSI characters (~= latin alphabet).
The result is clearly simplistic, of poor quality, and maybe inaccurate. But still better than nothing!
Feel free to participate by commenting, doing pull requests, or emailing me: sukender at free dot fr.

In the future, dictionaries __may__ be bundled in software.

- **libreoffice**: [Lojban LibreOffice / OpenOffice spell check dictionary](https://github.com/Sukender/lojban-spell-check-dist/raw/master/%oxt%)
  - Simply double-click it to install or update.
  - You may need to restart the application, and select the language of your document.
- **firefox**: [Lojban Firefox spell check dictionary](https://github.com/Sukender/lojban-spell-check-dist/raw/master/%xpi%)
  - Double-click it to install. If the file extension is not associated, simply tell your system to open it with Mozilla Firefox.
- **hunspell**: Hunspell / Myspell files
  - For advanced users. Under Linux, You may want to copy/install in ```/usr/share/hunspell/``` and ```/usr/share/myspell/dicts``` (with or without symlinks).
- **opera**: Opera-compatible dictionary
  - Copy the .zip in the dictionaries roaming directory
    - Windows default: ```C:\Users\YOUR_LOGIN\AppData\Roaming\Opera Software\Opera Stable\dictionaries```
    - Ubuntu default: ```~/.config/opera/dictionaries```
  - Modify the ```dictionaries.xml``` in that directory, by adding a dummy entry for Lojban with the ID "jbo". Example:
    - ```<dictionary id="jbo"><name>la .lojban.</name><size>1588813</size><authors>Sukender</authors><license>http://dumy.url</license></dictionary>```
  - Restart Opera
  - Open ```opera://settings```, open the dictionaries popup, and verify that "jbo" is in the list.
- **ms**: "Personal dictionary" for Microsoft Office (Word, Outlook, Excel, etc.).
  - You may need to edit the preferences. For example, open Microsoft Word > File > Preferences > Proof > Custom dictionaries
  - Default personal dictionaries directory: ```C:\Users\YOUR_LOGIN\AppData\Roaming\Microsoft\UProof```
