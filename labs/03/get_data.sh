#!/bin/bash
# get_data.sh: downloads the raw data of our project into data/raw/
# and prints a first look at it (size, type, lines, columns, first lines).
# Usage: run from this folder: ./get_data.sh
# Every run downloads the file again and appends one line to
# data/raw/SOURCES.txt (date, URL, target file).
# Data: "Fahrrad Verkehrsdaten Köln 2022" by Amt für nachhaltige
# Mobilitätsentwicklung (Stadt Köln), Offene Daten Köln,
# https://www.offenedaten-koeln.de/dataset/fahrrad-verkehrsdaten-koeln-2022,
# licence: Datenlizenz Deutschland – Zero – Version 2.0 (dl-de/zero-2-0),
# http://dcat-ap.de/def/licenses/dl-zero-de/2.0

# 2. Two variables: for URL and target file
URL="https://www.offenedaten-koeln.de/sites/default/files/distribution/Radverkehr%2520f%25C3%25BCr%2520Offene%2520Daten%2520K%25C3%25B6ln%25202022.csv"
TARGET="data/raw/koeln_2022.csv"

# 3. Create a folder and download
mkdir -p data/raw
curl -fL -o "$TARGET" "$URL" || exit 1

# 4. A line with the date and time, the URL and the target file
echo "$(date +"%Y-%m-%d %H:%M:%S") $URL $TARGET" >> data/raw/SOURCES.txt

# 5. Print a first look at the data:
echo "== Size"
ls -lh "$TARGET"
echo "== Type"
file "$TARGET"
echo "== Lines"
wc -l < "$TARGET"
echo "== Columns"
head -n 1 "$TARGET" | tr ';' '\n' | wc -l
echo "== First lines"
head -n 3 "$TARGET"

# Comparison with the dataset profile (Fahrrad Verkehrsdaten Köln 2022):
# The numbers match: 1,864 bytes, 12 monthly rows, 17 counting stations.
# wc -l prints 13 because it also counts the header line, and the column count is 18 because the first column 
# holds the month name (17 stations + 1). 
# ls -lh shows 1.9K because it rounds 1.82 KB up.
# Type: ISO-8859 text with CRLF line endings, so the file is not UTF-8.
