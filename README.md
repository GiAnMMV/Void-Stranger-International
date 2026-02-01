[![fr](https://img.shields.io/badge/français-green.svg)](./README.fr.md)
[![it](https://img.shields.io/badge/italiano-green.svg)](./README.it.md)

__Currently included translations:__
* Spanish by AnaximanDraws
* French by Oskilla
* Italian by GiAnMMV

## Setting things up

The first thing to do is to download the latest version of Void Stranger International from [here](/../../releases/latest).

After extracting it, go to the game directory (usually `C:\Program Files (x86)\Steam\steamapps\common\Void Stranger`), paste there the `Languages` folder and patch `data.win` with `VSInternational.xdelta` using an xDelta patcher (such as [DeltaPatcher](https://www.romhacking.net/utilities/704/)).

In this way you should already have the game translated in the languages currently available in Void Stranger International.

___You can ignore the rest if you're here only to download the currently included translations.___

## Starting to translate

To create a new translation into another language, get the files in [this folder](/Languages/EN), which contain all the original English strings, and translate them, making sure that the every string remains in the same line. After doing that, you'll have `included.txt` and `extracted.txt` translated files.

Now create a new folder in `[game_directory]\Languages`, name it the [language code](https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes) of your language (uppercase) and drop there your translated files. If you did the previous steps correctly, you should be able to select the new language after opening the game.

To add your name in the credits, write it in the second-last line of `extracted.txt`; multiple names need to be separated by a `|` and only a maximum of 4 names is possible.

## Publishing the translation

Now that everything's done you can publish your translation, sharing your translated `.txt` files.

If you want you can also add them to Void Stranger International! To do so, you can create a commit in this repository or simply contact me. We currently support only Latin alphabet languages, but we can add others if there's request.
