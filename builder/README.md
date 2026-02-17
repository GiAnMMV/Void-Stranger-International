# How to build

## Requirements

- Windows 10, 11
- [UndertaleModTool CLI 0.8.x.x](https://github.com/UnderminersTeam/UndertaleModTool/releases) (built and tested with 0.8.2.0)
- Void Stranger 1.1.3

## Instructions

Run `builder.bat`. The first time you'll be asked to input:
- the path to `UndertaleModCli.exe`;
- the path to Void Stranger's directory.

These paths will be saved in `variables.bat` and won't be asked again, so edit `variables.bat` if you want to change them.

Make sure you didn't install any mod or modified your `data.win` beforehand.

A copy of `data.win` will be created as `data.win.bak` the first time. `data.win.bak` will be the one loaded by the builder script the next times you run it, while the patched file will override `data.win`.