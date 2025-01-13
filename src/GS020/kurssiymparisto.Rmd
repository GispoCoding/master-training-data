# Kurssiympäristö

## Kurssihakemisto ja sen lataaminen

Lataa kurssimateriaali alla olevasta linkistä, ja pura `.zip`-tiedosto
hakemiston `C:\Ohjelmat\miniconda3` alle. Tietokoneellesi tehty Python-asennus
on tehty siten, että pythonin kanssa työskentely kannattaa tehdä tämän
hakemiston alla.

[Kurssimateriaali.zip](https://github.com/GispoCoding/python-gis-training/archive/refs/heads/2024-11.zip)

Kun olet purkanut kurssimateriaalin oikeaan paikkaan, on tiedostopolku
kurssimateriaaliin seuraavanlainen:

```
C:\Ohjelmat\miniconda3\python-gis-training-2024-11
```

> **Huom!** Riippuen siitä, miten purit tiedoston, saattaa varsinainen
> kurssimateriaalihakemisto olla vielä erillisen samannimisen hakemiston
> sisällä. Tämä ei haittaa. Alla esimerkkipolku tässä tapauksessa:

```
C:\Ohjelmat\miniconda3\python-gis-training-2024-11\python-gis-training-2024-11
```

## Komentorivi ja kurssihakemistoon navigointi (windows)

### Anaconda Prompt

Kurssilla käytetään Python-pakettien sekä -ympäristöjen hallintaan
komentorivikäyttöliittymää, tarkemmin sanottuna **Anaconda
Prompt**-komentoriviä. Anaconda Promptin löydät Windowsilla esimerkiksi
etsimällä sanalla "Anaconda".

Avaa nyt **Anaconda Prompt**. Avautuvassa ikkunassa näkyy teksti `(base)`, sekä
tiedostopolku. `(base)` tarkoittaa sitä, että tällä hetkellä aktiivinen
conda-**ympäristö** on nimeltään `base`, kun taas tiedostopolku näyttää polun
siihen hakemistoon, jossa komentorivi on nyt aktiivinen. Kulloinkin aktiivisena
olevaa hakemistoa kutsutaan **työhakemistoksi** (working directory), ja sitä
voidaan muuttaa navigoimalla johonkin muuhun hakemistoon.

### Navigointi kurssihakemistoon

Tällä kurssilla käytetään lähes pelkästään conda-komentoja, mutta ainakin kaksi
muutakin komentoa kannattaa opetella: `dir` ja `cd`.

- `dir`-komennolla voit listata työhakemiston tiedostot ja hakemistot.
- `cd` (change directory) vaihtaa työhakemistoa komennolle argumenttina
  annettuun hakemistoon.

Työhakemistolla (ja täten myös komentorivillä navigoinnilla) on merkitystä
tilanteissa, joissa komentoja täytyy tai kannattaa suorittaa tietyssä
hakemistossa. Python-ympäristön luonti tai kurssilla käytettävän
**JupyterLab**-ohjelmointityökalun käynnistys ovat esimerkkejä tällaisista
tilanteista.

Navigoi siis kurssihakemistoon. Koska tiedät jo minne kurssihakemisto on
tallennettu, voit siirtyä sinne seuraavalla komennolla:

```
cd C:\Ohjelmat\miniconda3\python-gis-training-2024-11
```

*Jos* `dir`-komento näyttää, että hakemiston sisällä on vielä yksi
`python-gis-training-2024-11`-niminen hakemisto, siirry vielä sinne:

```
cd python-gis-training-2024-11
```

## Kurssiympäristön luominen

Kun olet päässyt kurssihakemistoon, voit luoda kurssin Python-ympäristön
seuraavalla komennolla:

```
conda env create --file environment.yml --name gis
```

`conda env create` -komennolla luodaan uusi conda-ympärisö. Huomaa ettemme
erittele erikseen ympäristöön asennettavia paketteja, vaan conda lukee ne
suoraan `--file`-vivulle parametrina annetusta `environment.yml`-tiedostosta.
Tiedosto löytyy kurssihakemistosta, eli komento onnistuu kun se ajetaan oikeassa
hakemistossa. Lisäksi kurssin Python-ympäristölle annetaan nimeksi `gis`
käyttämällä `--name`-vipua.

Komennon suorituksessa saattaa mennä hetki, kun useita paketteja ladataan. Kun
ympäristö on valmis, komentorivillä pitäisi näkyä:

```
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate gis
#
# To deactivate an active environment, use
#
#     $ conda deactivate
```

## Ohjelmoinnin aloitus JupyterLabissa

Kun ympäristö on luotu, aktivoi se:

```
conda activate gis
```

Nyt komentorivillä pitäisi työhakemiston edessä näkyä `(gis)`, eli aktiivinen
conda-ympäristö on `gis`.

Voit käynnistää JupyterLab-ohjelmointiympäristön seuraavalla komennolla (huomaa
väli ja pienet kirjaimet):

```
jupyter lab
```

JupyterLabin pitäisi käynnistyä internet-selaimessa. Jos selainsivu ei aukea
automaattisesti, kopioi komentorivi-ikkunassa näkyvä linkki selaimen
URL-kenttään.

Huomaat, että JupyterLabin käyttöliittymä aukesi kurssihakemistoosi. Tämä johtuu
siitä, että ajoit `jupyter lab` -komennon kurssihakemistossa. Kannattaa siis
aina käynnistää JupyterLab ajamalla `jupyter lab` siinä hakemistossa, jossa aiot
myös työskennellä.

## Kurssiympäristön käyttö jatkossa

Kun haluat palata käyttämään mitä vain aiemmin luomaasi conda-ympäristöä
(esimerkiksi kurssiympäristöä), askeleet ovat varsin yksinkertaiset:

1. Navigoi komentorivillä hakemistoon jossa työskentelet (windowsilla käytä
   komentorivinä **Anaconda Promptia**)
1. Aktivoi haluamasi ympäristö `conda activate` -komennolla (anna ympäristön
   nimi argumenttina, esim `conda activate gis`)
1. Kurssiympäristön tapauksessa aja komento `jupyter lab`

## Condan käyttö jatkossa

Tässä vielä muutama esimerkki hyödyllisistä conda-komennoista.

Tämä materiaali ei edes yritä kattaa kaikkia condan tominnallisuuksia.
Lisätietoa löydät monestakin paikasta googlaamalla, mutta hyvä paikka aloittaa
on
[condan dokumentaatio](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-pkgs.html#).
Kokeile myös ajaa komentorivillä:

```
conda --help
```

### Ympäristöjen hallinta

Uuden tyhjän ympäristön luonti:

```
conda create -n <ympäriston nimi>
```

Ympäristön luonti tiedostosta:

```
conda env create --file <tiedostopolku>
```

Ympäristön aktivointi:

```
conda activate <ympäristön nimi>
```

Aktiivisen ympäristön deaktivointi:

```
conda deactivate
```

Olemassaolevien ympäristöjen listaus:

```
conda env list
```

Ympäristön poisto:

```
conda env remove -n <ympäristön nimi>
```

### Pakettien hallinta

Paketin asennus aktiiviseen ympäristöön:

```
conda install -c conda-forge <paketin nimi>
```

> [!TIP]
>
> Huomaa `-c conda-forge`! Tällä määritellään mistä kanavasta (channel) paketti
> ladataan. Conda-forge on lähes aina suositeltavin vaihtoehto.

Voit myös määritellä tarkan version, kun asennat pakettia. Samalla komennolla
voit myös muuttaa jo asennetun paketin versiota. Esimerkiksi paketin jupyterlab
version 4.3.0 asentaminen:

```
conda install -c conda-forge jupyterlab=4.3.0
```

Paketin poisto aktiivisesta ympäristöstä:

```
conda remove <paketin nimi>
```
