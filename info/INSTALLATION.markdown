# Installation :inbox_tray:

## For Mac OSX and Linux
- 1.) Get the Dart SDK from [here](https://dart.dev) and Git.
- 2.) Make sure you can run `dart --version` and `git --version` from the command-line.
- 3.) Clone this repository's source code with this command:
```bash
$ git clone https://github.com/iamtheblackunicorn/Chromos.git
```
- 4.) Change directory into the cloned source code directory with this command: `cd Chromos`
- 5.) Run `dart pub get`
- 6.) Run `dart compile exe bin/chromos.dart`.
- 7.) Run `mv bin/chromos.exe ./chromos`.
- 8.) Change permissions of the executable by running `chmod a+x chromos`.
- 9.) Create a directory called `bubin` in `$HOME`.
- 10.) Move the chromos executable to `$HOME/bubin`.
- 11.) Add the path `$HOME/bubin` to your system's `$PATH` by modifying your shell's `.zshrc` or `.bashrc`. This file can usually be found in the directory `$HOME`.

## For Windows
- 1.) Get the Dart SDK from [here](https://dart.dev) and Git.
- 2.) Make sure you can run `dart --version` and `git --version` from the command-line.
- 3.) Clone this repository's source code with this command:
```bash
$ git clone https://github.com/iamtheblackunicorn/Chromos.git
```
- 4.) Change directory into the cloned source code directory with this command: `cd Chromos`
- 5.) Run `dart pub get`
- 6.) Run `dart compile exe bin/chromos.dart`.
- 7.) Move the file `chromos.exe` to some directory that is on the system's `%PATH%`.

## Configuring editors

If you're using the Atom editor, please visit [this repository](https://github.com/iamtheblackunicorn/language-chromos) to get syntax-highlighting for your *Chromos* code.
