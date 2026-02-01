__Traductions actuellement incluses&nbsp;:__
* Français par Oskilla
* Espagnol par AnaximanDraws
* Italien par GiAnMMV

## Installation du patch

Téléchargez la dernière version de Void Stranger International [ici](/../../releases/latest).

Extrayez le contenu, et chercher le dossier du jeu (par défaut `C:\Program Files (x86)\Steam\steamapps\common\Void Stranger`), coller le dossier `Languages`  et patcher  `data.win` avec `VSInternational.xdelta` en utilisant un patcher xDelta (comme [DeltaPatcher](https://www.romhacking.net/utilities/704/)).

Normalement, vous devriez avoirs accès au langage disponible dans Void Stranger International.

___Si vous souhaitez uniquement télécharger les traductions actuellement incluses, le guide se termine ici.___

## Demarrer une nouvelle traduction

Pour créer une nouvelle traductino, récupéré les fichier dans [ce dossier](/Languages/EN), qui contient tous le contenu du jeu en Anglais, et traduisez les, assurez vous que les lignes reste en place. Après vous aurrez les fichiers `included.txt` et `extracted.txt` traduits.

Créer un nouveau fichier `[game_directory]\Languages`, en le nommant suivant le [code langage](https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes) de votre langue (en majuscule) et deposez-y vos fichier traduits. Si vous avez correctement suivi les instruction précédentes, vous aurrez accès a votre langage dans les options.

Pour ajouter votre nom au crédits, écrivez le dans l'avant dernière ligne du fichier `extracted.txt`&nbsp;; plusieurs noms sont séparer par le symbole `|` et seul 4 noms sont possibles.

## Publication de la traduction

Maintenant que tout est traduit, vous poucez partagez vos fichier `.txt`.

Si vous voulez, vous pouvez les ajouter a Void Stranger International&nbsp;! Créer un commit sur ce repo ou contacter. Nous supportons uniquements l'alphabet latin pour le moment, mais nous verons si nous pouvons en ajouter d'autres.
