# Lab 03: Version control

## Contents
- `get_data.sh`: downloads the raw data and prints a first look at it
- `.gitignore`: keeps `data/raw/` out of the repository
- `graph.md`, `git-graph.png`: covers Task 1
- `git.md`: covers Task 2-4

## Rebuild the raw data
`data/raw/` is not in the repository. To rebuild it, open a terminal in `labs/03` and run:
```bash
    cd labs/03
    ./get_data.sh
```

The script downloads the file to `data/raw/koeln_2022.csv`, appends a line (date, URL, target file) to `data/raw/SOURCES.txt` and prints a checksum.

## Source and licence
- Data: "Fahrrad Verkehrsdaten Köln 2022" by Amt für nachhaltige Mobilitätsentwicklung (Stadt Köln), Offene Daten Köln
- Source: https://www.offenedaten-koeln.de/dataset/fahrrad-verkehrsdaten-koeln-2022
- Licence: Datenlizenz Deutschland – Zero – Version 2.0 (dl-de/zero-2-0), http://dcat-ap.de/def/licenses/dl-zero-de/2.0