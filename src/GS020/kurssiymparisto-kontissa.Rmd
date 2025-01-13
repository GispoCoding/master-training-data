## Kurssiympäristö kontissa

Voit ajaa kurssiympäristöä kontissa, jolloin tarvitset vain docker- /
podman-asennuksen.

Aja komennot repositorion juuressa.

Rakenna kontti:

```console
docker build . --tag python-gis-training:latest
```

Aja kontti:

```console
docker run -it --rm -v ./:/home/gis-user/python-gis-training --network host python-gis-training:latest
```

Olet nyt komentorivillä, jossa voit käyttää kurssin conda-ympäristöä:

```console
conda activate gis
```

```console
jupyter lab
```

**Windows**- ja **macOS** -ympäristössä `--network host` ei ilmeisesti toimi.
aja kontti siis määritämällä portti:

```console
docker run -it --rm -v ./:/home/gis-user/python-gis-training -p 8888:8888 python-gis-training:latest
```

Tämä aiheuttaa sen, että jupyter lab täytyy käynnistää hieman eri tavoin:

```console
jupyter lab --ip 0.0.0.0
```
