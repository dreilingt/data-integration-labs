## Dataset: [Verbraucherpreisindex: Deutschland, Monate, Klassifikation der Verwendungszwecke des Individualkonsums](https://genesis.destatis.de/datenbank/online/statistic/61111/table/61111-0004) 
with the series code CC13-09421 Besuch von Kino, Theater, Konzert, Zirkus u.Ä.

### 5.1. Search for Data
| Where | What |
|-----------|-----------|
| Open.NRW | `Musikveranstaltungen` `Musik` `Eintrittspreise` |
| DESTATIS | `konzert` `Freizeit Kultur Preise` `Eintrittspreise` `Kulturstatistik`|
| Kaggle.com | `Concert Tickets` `live music tickets` `ticket pricing`|
| Google Dataset Search | `music concert ticket` `Freizeit Kultur Preise`|

### 5.2. Search like a machine
`https://www.govdata.de/ckan/api/3/action/package_search?q=konzert&rows=1`

Received:\
`"count": 24`\
`"title": "Selbstständige Konzertorchester, Mitglieder, Konzerte undBesuche - Land - Spielzeit"`\
`"license_id": ""`\
`"license": "http://dcat-ap.de/def/licenses/dl-by-de/2.0"`

## Dataset Profile
### 1. Facts

|  | Verbraucherpreisindex |
|---|---|
| Full Title | Verbraucherpreisindex: Deutschland, Monate, Klassifikation der Verwendungszwecke des Individualkonsums (COICOP 2-5-Steller Hierarchie). The series used is CC13-09421 “Besuch von Kino, Theater, Konzert, Zirkus u.Ä.”|
| Publisher | Statistisches Bundesamt (Destatis), GENESIS-Online |
| Link / identifier | https://genesis.destatis.de/datenbank/online/statistic/61111/table/61111-0004 · table 61111-0004 · series code CC13-09421 |
| Formats | CSV (downloaded); XLSX; CSV (Flat) |
| Size | 1 file, 9,63 KB; 4 series (rows), 290 columns (2 label columns + 144 months × 2: value and flag) |
| Coverage Period* | Header: Jan 2015-Dec 2026 (144 months). Values: Jan 2015-Sep 2026 (141 months). Oct-Dec 2026 are marked as `...` (not yet available). |
| Coverage Area | Germany (national), no regional breakdown |
| Granularity | Monthly, price index (2020 = 100). Concerts are not separated from cinema, theatre and circus |
| Last update | File status ("Stand"): 02.11.2026, 15:29:45 (export time). Latest value: Sep 2026. Frequency: monthly (inferred from the series) |
| Licence | Datenlizenz Deutschland – Namensnennung – Version 2.0 (dl-de/by-2-0), [stated](https://www.destatis.de/DE/Service/Impressum/copyright-genesis-online.html) by Destatis for GENESIS-Online |

\* *Destatis allows to select a period between 1991 and 2026*

### 2. Stars (5-star scheme)
★★★ Open format (CSV, can be used without proprietary software)
Missing for the 4th star: URIs (Uniform Resource Identifier)

### 3. Open the data
The downloaded file was opened in Microsoft Excel 365, file origin - UTF-8, delimiter - semicolon.

Statistics over the 141 monthly values (Jan 2015-Sep 2026), index point (2020 = 100). Excel formulas: =MIN(range), =MAX(range), =AVERAGE(range), with the range covering the value cells of the series (without the flag cells, the `...` placeholders and the labels).

| Series | Min | Max | Avg |
|---|---|---|---|
|Freizeit, Unterhaltung und Kultur|90,8|122,4|105,6|
|Besuch von Kino, Theater, Konzert, Zirkus u.Ä.|91,5|121,8|103,25|

**Empty cells**: for "Besuch von Kino, Theater, Konzert, Zirkus u.Ä." there are 0 empty value cells. The 3 missing months (Oct–Dec 2026) contain the placeholder `...` instead, and their flag cells are empty (3 empty flag cells per series, 12 in the whole data block). Formulas to check: =COUNTBLANK(range) on the flag cells, and =COUNTIF(range;"...") for the placeholders.

**Odd things**:

- Wide format with metadata: 8 title and header rows before the data, no single header row. Year and month are in two header rows, and each is repeated twice per month (once for the value, once for the flag).
- Flag column has no header: flags are `e` (meaning "endgültiger Wert" according to GENESIS Zeichenerklärung (Sign Explanation)), `()` (11 values: Apr-Jun 2020 and Nov 2020-Jun 2021 meaning "Aussagewert eingeschränkt, da der Zahlenwert statistisch relativ unsicher ist") and empty cells next to `...` placeholders.
- Placeholders: `...` means "Angabe fällt später an" (value will follow).
- Labels: leading spaces encode the hierarchy (CC13-09 > 094 > 0942 > 09421).
- No totals row, but nested aggregates: CC13-09 (Freizeit, Unterhaltung und Kultur) is the parent of the other three rows. Index values must not be summed.

### 4. Data dictionary

The file is wide, therefore after reshaping to long format, five columns would be:

| Name | Meaning | Type, unit | Example |
|---|---|---|---|
|series_code|COICOP code of the consumption category|string|CC13-09421|
|series_label|Name of the category (leading spaces show the hierarchy level)|string|Besuch von Kino, Theater, Konzert, Zirkus u.Ä.|
|year|Reference year (header row)|integer|2015|
|month|Reference month (header row)|string (convert to 1-12)|Januar|
|cpi_value|Consumer price index|decimal|91,5|

**Documentation**: the CSV itself documents the title and the number of the table, the series, the Dec 2024 footnote and the copyright.

### 5. License and Attribution line (TASL)

**Open according to the Open Definition?** Yes. The licence dl-de/by-2-0 allows free use, modification and sharing, including commercial use, and only requires attribution.

**What we must do when reusing it:** name the provider (Statistisches Bundesamt (Destatis)), add the licence note "dl-de/by-2-0" with a link to the licence text, refer to the dataset (with a link), and state that the data is changed ("own calculation") if it is being modified.

> Source: [Copyright for the Genesis-Online database](https://www.destatis.de/EN/Service/Legal-Notice/CopyrightGENESISOnlineDatabase.html)

**Attribution line for the README:**\
"Verbraucherpreisindex: Deutschland, Monate (Table 61111-0004, series CC13-09421)" by Statistisches Bundesamt (Destatis), Genesis-Online, https://genesis.destatis.de/datenbank/online/statistic/61111/table/61111-0004, [Data licence by-2-0](https://www.govdata.de/dl-de/by-2-0)

### 6. People
The dataset contains *no personal data*. It is a monthly national price index, aggregated over all of Germany, with no individuals, households or small groups, therefore nothing needs to be minimised for this dataset.

## Dataset Review with the FAIR principles

| Principle | Rating | Evidence |
|---|---|---|
|F1|~|A stable URL, and table code `61111-0004`, but no DOI. The values are updated monthly under the same URL, with no version identifier. Two unique identifiers assigned in the catalogues: registry.gdi-de.org/id/de.bund.destatis/DE-30303036-3131-4031-312d-303030340000 (DGI-DE) and data.europa.eu/88u/dataset/30303036-3131-4031-312d-303030340000|
|F2|~|The dataset has a title, classification, unit (Verbraucherpreisindex (2020=100)), copyright line and "Stand" date, but has no description text and no keywords|
|F4|✓|Listed on [data.europa.eu](data.europa.eu/88u/dataset/30303036-3131-4031-312d-303030340000), harvested from the GDI-DE catalogue. Also searchable by table code `61111-0004` in GENESIS-Online itself|
|A1|✓|Datasets from [GENESIS-Online](https://www.destatis.de/EN/Service/OpenData/api-webservice.html) "can be used free of charge and without registering", and all users get the same data. Tables can be both viewed by using the web interface and be downloaded from there|
|I1|✓|CSV, UTF-8. Destatis also offers other formats, such as XLSX and CSV (Flat)|
|I2, I3|~|Categories use a classification code (based on COICOP 2018, 2-5-digit hierarchy). Dates are German month names plus a year (Januar, 2015), not ISO 8601. The area is set in the text form in the title of the dataset ("Deutschland"), ISO 3166 code is not used. There are no links to related data or sources inside the file|
|R1|✗|No column dictionary in the file, flags are explained separately on the website. A user should read an additional [PDF-file](https://www.destatis.de/DE/Methoden/Qualitaet/Qualitaetsberichte/Preise/einfuehrung.html) (Verbraucherpreisindizes -> Verbraucherpreisindex für Deutschland) to find out about the method.|
|R1.1|✓|Clear: [Data licence Germany – attribution – version 2.0](destatis.de/EN/Service/Legal-Notice/CopyrightGENESISOnlineDatabase.html). Machine-readable: the [DCAT](https://data.europa.eu/api/hub/repo/distributions/fd24c79f-ff13-43bd-97bb-890c044b093b.jsonld) record has a `dct:license` field (a `LicenseDocument` labelled “…Datenlizenz by-2-0”).|
|R1.2|~|Original data from the primary publisher (Statistisches Bundesamt), not a copy. The downloaded CSV-file has a "Stand" timestamp (02.11.2026). [The record's provenance text](https://gdk.gdi-de.org/gdi-de/srv/eng/csw?Service=CSW&version=2.0.2&Request=GetRecords&resultType=results&elementSetName=full&outputFormat=application/xml&OutputSchema=http://www.isotc211.org/2005/gmd&typeNames=csw:Record&startPosition=1&maxRecords=1&typeNames=csw:Record&elementSetName=full&ConstraintLanguage=CQL_TEXT&constraint_language_version=1.1.0&constraint=csw:ResourceIdentifier=%27https://registry.gdi-de.org/id/de.bund.destatis/DE-30303036-3131-4031-312d-303030340000%27) only says that Destatis checks the data and gives no guarantee. The file has no revision history.|
|R1.3|✓|The metadata is a [DCAT distribution record](https://data.europa.eu/api/hub/repo/distributions/fd24c79f-ff13-43bd-97bb-890c044b093b.jsonld) with INSPIRE code lists (`accessRights`), and the dataset record [states](https://gdk.gdi-de.org/gdi-de/srv/eng/csw?Service=CSW&version=2.0.2&Request=GetRecords&resultType=results&elementSetName=full&outputFormat=application/xml&OutputSchema=http://www.isotc211.org/2005/gmd&typeNames=csw:Record&startPosition=1&maxRecords=1&typeNames=csw:Record&elementSetName=full&ConstraintLanguage=CQL_TEXT&constraint_language_version=1.1.0&constraint=csw:ResourceIdentifier=%27https://registry.gdi-de.org/id/de.bund.destatis/DE-30303036-3131-4031-312d-303030340000%27) conformance to Regulation (EU) No 1089/2010 (INSPIRE)|

The chosen dataset is **open**: the licence dl-de/by-2-0 allows free reuse and modification with attribution, and the data is free to download as CSV. It is also **FAIR, but with limitations**. Although the dataset has persistent identifiers, a catalogue record, open access and a licence in the metadata, the downloaded CSV-file has no ISO 8601 dates or ISO 3166 codes, no data dictionary and no links to sources.

3 things to improve for milestone 2:
- Publish a dataset with an identifier
- Use standard codes: ISO 8601 dates, ISO 3166 country codes, if it is relevant for a final dataset
- Provide all the documentation including data dictionary
