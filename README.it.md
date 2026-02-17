__Traduzioni attualmente incluse:__
* Italiano di GiAnMMV
* Spagnolo di AnaximanDraws
* Francese di Oskilla

## Preparazione

La prima cosa da fare è scaricare l'ultima versione di Void Stranger International da [qui](/../../releases/latest).

Dopo aver estratto la cartella compressa, andare alla cartella del gioco (di solito è `C:\Program Files (x86)\Steam\steamapps\common\Void Stranger`), incollare lì la cartella `Languages` e applicare sul file `data.win` la patch `VSInternational.xdelta` usando un programma che supporti tale formato (come [DeltaPatcher](https://www.romhacking.net/utilities/704/)).

Dopo aver seguito questo passaggio il gioco dovrebbe già essere tradotto nelle lingue attualmente disponibili in Void Stranger International.

___Se si è interessati solo a scaricare le traduzioni attualmente incluse, la guida termina qui.___

## Cominciare a tradurre

Per creare una nuova traduzione in un'altra lingua, scaricare i file presenti in [questa cartalla](/Languages/EN), che contengono tutte le stringhe in inglese, e tradurli, assicurandosi che ogni stringa rimanga alla riga corretta. Dopo aver fatto ciò, si avranno i file tradotti `included.txt` e `extracted.txt`.

Ora andare nella cartella `Languages`, creare una sotto-cartella e rinominarla usando il [codice](https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes) della lingua scelta (tutto maiuscolo) e rilasciare lì i file tradotti. Se i precedenti passi sono stati eseguiti correttamente, aprendo il gioco dovrebbe già essere possibile selezionare la nuova lingua.

Per aggiungere il proprio nome nei titoli di coda scriverli alla riga 348 di `extracted.txt`; per aggiungere più nomi separarli con una barra verticale `|`, tenendo a mente che quelli dopo il quarto saranno ignorati.

## Pubblicare la traduzione

Ora che la traduzione è completa è possibile pubblicarla, condividendo i file `.txt` tradotti.

È inoltre possibile aggiungerli a Void Stranger International! Per fare ciò, basta richiedere un commit in questo repository o semplicemente contattarmi. Al momento supportiamo solo l'alfabeto latino, ma possiamo aggiungerne altri se richiesto.
