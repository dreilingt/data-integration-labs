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

## Dataset Profile (Updated from 08.11.26 for CSV-Flat format after checking in Notepad++)
### 1. Facts

|  | Verbraucherpreisindex |
|---|---|
| Full title | Verbraucherpreisindex: Deutschland, Monate, Klassifikation der Verwendungszwecke des Individualkonsums (COICOP 2-5-Steller Hierarchie). The series used is CC13-09421 “Besuch von Kino, Theater, Konzert, Zirkus u.Ä.” |
| Publisher | Statistisches Bundesamt (Destatis), GENESIS-Online |
| Link / identifier | https://genesis.destatis.de/datenbank/online/statistic/61111/table/61111-0004 · table 61111-0004 · series code CC13-09421 |
| Formats | CSV (flat layout), downloaded; CSV; XLSX |
| Size | 1 file, 134,604 bytes (≈131 KB); 480 data rows + 1 header row, 22 columns (flat/long format: one row per series and month; 4 series × 120 months) |
| Coverage period* | Jan 2017-Dec 2026 (120 months per series). Observations exist from Jan 2017 to Sep 2026 (117 months). Oct-Dec 2026 contain the placeholder `...` (data not yet available; 12 rows = 4 series × 3 months) |
| Coverage area | Germany (national, `DG`), no regional breakdown |
| Granularity | Monthly price index (2020 = 100). Concerts are not separated from cinema, theatre and circus |
| Last update | The file has no export timestamp, but the last update can be checked on the [dataset page](https://genesis.destatis.de/datenbank/online/statistic/61111/table/61111-0004). Latest value: Sep 2026 |
| Licence | Datenlizenz Deutschland – Namensnennung – Version 2.0 (dl-de/by-2-0), [stated](https://www.destatis.de/DE/Service/Impressum/copyright-genesis-online.html) by Destatis for GENESIS-Online |
\* *Destatis allows to select a period between 1991 and 2026*

### 2. Stars (5-star scheme)
★★★ Open format (CSV, can be used without proprietary software)
Missing for the 4th star and the 5th star: URIs to identify entities within the data and links to other datasets

### 3. Open the data

The file was opened in Microsoft Excel 365 and Notepad++. Encoding: UTF-8 with BOM, separator: semicolon. `value` column was imported as text, therefore it was additionally transformed via Transform Data -> Data Type -> Decimal Number.

Statistics over the 117 monthly values (Jan 2017–Sep 2026), index points (2020 = 100):

| Series | Min | Max | Mean |
|---|---|---|---|
| CC13-09 Freizeit, Unterhaltung und Kultur | 92,1 | 122,4 | 107,33 |
| CC13-09421 Besuch von Kino, Theater, Konzert, Zirkus u.Ä. | 95,6 | 121,8 | 105,13 |

**Empty cells:** in the source file, the `value` column has no empty cells, but the placeholder `...` in 12 rows (Oct–Dec 2026). When I converted the column to numbers (Power Query in Excel 365), these cells became `Error`. I replaced the errors with empty cells, so each series has 3 empty values (12 in total). The `value_q` (flag) column is empty exactly in these rows: 12 cells in the whole file.

**Odd things:**

- Flat format, 22 columns: 13 of them have the same value in every row (for example `statistics_code`, `time_code`, `value_unit`), because the file repeats the table metadata in each row.
- Rows are not sorted by time or by series.
- Year (`time`) and month (`1_variable_attribute_code`, e.g. `MONAT02`) are in separate columns, so a date such as `2020-02` has to be built.
- Numbers have a decimal comma and are stored as text (`100,8`).
- Placeholders: `...` in the `value` column for months without data. Сonverting the whole column to numbers produces errors until these placeholders replaced by empty cells.
- Flags in `value_q`: `e` (457 rows; meaning "endgültiger Wert" according to GENESIS Zeichenerklärung (Sign Explanation)), `()` (11 rows, all in CC13-09421: Apr–Jun 2020 and Nov 2020–Jun 2021; meaning "Aussagewert eingeschränkt, da der Zahlenwert statistisch relativ unsicher ist").
- No totals row, but nested aggregates: CC13-09 > CC13-094 > CC13-0942 > CC13-09421. Index values must not be summed.

### 4. Data dictionary

| Column | Meaning | Type, unit | Example |
|---|---|---|---|
| `time` | Year of the observation | integer, year | `2020` |
| `1_variable_attribute_code` | Month of the observation (`MONAT01`–`MONAT12`); the label is in `1_variable_attribute_label` | text | `MONAT02` (Februar) |
| `3_variable_attribute_code` | Expenditure category (COICOP) of the series; the label is in `3_variable_attribute_label` | text | `CC13-09421` |
| `value` | Consumer price index of the category | decimal number (original: text with decimal comma), index points, base 2020 = 100 | `100,8` |
| `value_q` | Quality flag of the value | text | `e` |

**Documentation by the publisher:** Destatis documents the statistic (population, sources, price collection, reporting period, quality), not the columns of the CSV file: [Erläuterungen zur Statistik 61111](https://genesis.destatis.de/datenbank/online/statistic/61111/table/61111-0004)).
It also mentions that rates of change against the previous year's month and the previous month are published next to the indices. The meaning of the flags and placeholders (`e`, `...`, `-`) is explained in Zeichenerklärung (Sign Explanation) on the page with the dataset. \
There is no description of the individual columns.

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
| F1 | ~ | A stable URL and the table code `61111-0004`, but no DOI. The flat CSV contains only the statistic code (`statistics_code` = `61111`); the table number appears only in the file name and on the website. The values are updated under the same table URL, with no version identifier. Two identifiers are assigned in the catalogues: [GDI-DE](https://registry.gdi-de.org/id/de.bund.destatis/DE-30303036-3131-4031-312d-303030340000) and [data.europa.eu](http://data.europa.eu/88u/dataset/30303036-3131-4031-312d-303030340000) |
| F2 | ~ | On the GENESIS table page the dataset has a title, classification, unit (Verbraucherpreisindex (2020=100)), copyright line and "Stand" date, but no description text and no keywords. The flat CSV itself repeats labels and the unit in every row (`statistics_label`, `value_unit`), but has no title line, copyright line or date |
| F4 | ✓ | Listed on [data.europa.eu](https://data.europa.eu/data/datasets/30303036-3131-4031-312d-303030340000?locale=en), harvested from the GDI-DE catalogue. Also searchable by table code `61111-0004` in GENESIS-Online itself |
| A1 | ✓ | Datasets from [GENESIS-Online](https://www.destatis.de/EN/Service/OpenData/api-webservice.html) "can be used free of charge and without registering", and all users get the same data. Tables can be both viewed in the web interface and downloaded from there |
| I1 | ✓ | CSV (flat layout), UTF-8 with BOM, semicolon as separator, decimal comma. One header row and one observation per row. Destatis also offers other formats, such as XLSX and a wide CSV |
| I2, I3 | ~ | Categories use a classification code (`CC13-09421`, based on COICOP 2018, 2-5-digit hierarchy). Time is a year in `time` plus a month code (`MONAT02`) with a German month name as label (`Februar`), not ISO 8601. The area is the code `DG` with the label `Deutschland`, not an ISO 3166 code. Placeholders (`...`) are text. There are no links to related data or sources inside the file |
| R1 | ✗ | No column dictionary: the file has codes and labels, but no description of its columns, and the flags (`e`, `()`) and placeholders (`...`) are explained separately on the website.
| R1.1 | ✓ | Clear: [Data licence Germany – attribution – version 2.0](https://www.destatis.de/EN/Service/Legal-Notice/CopyrightGENESISOnlineDatabase.html). Machine-readable: the [DCAT](https://data.europa.eu/api/hub/repo/distributions/fd24c79f-ff13-43bd-97bb-890c044b093b.jsonld) record has a `dct:license` field (a `LicenseDocument` labelled “…Datenlizenz by-2-0”). The CSV file itself carries no licence information, copyright is on the dataset page |
| R1.2 | ~ | Original data from the primary publisher (Statistisches Bundesamt), not a copy. The methodological notes describe who collects the data and how (price collection by the statistical offices around the middle of the month, quality checks). The flat CSV file has no timestamp or version, so the retrieval date must be recorded by the user. [The record's provenance text](https://gdk.gdi-de.org/gdi-de/srv/eng/csw?Service=CSW&version=2.0.2&Request=GetRecords&resultType=results&elementSetName=full&outputFormat=application/xml&OutputSchema=http://www.isotc211.org/2005/gmd&typeNames=csw:Record&startPosition=1&maxRecords=1&typeNames=csw:Record&elementSetName=full&ConstraintLanguage=CQL_TEXT&constraint_language_version=1.1.0&constraint=csw:ResourceIdentifier=%27https://registry.gdi-de.org/id/de.bund.destatis/DE-30303036-3131-4031-312d-303030340000%27) only says that Destatis checks the data and gives no guarantee. There is no revision history |
| R1.3 | ~ | The dataset record [states](https://gdk.gdi-de.org/gdi-de/srv/eng/csw?Service=CSW&version=2.0.2&Request=GetRecords&resultType=results&elementSetName=full&outputFormat=application/xml&OutputSchema=http://www.isotc211.org/2005/gmd&typeNames=csw:Record&startPosition=1&maxRecords=1&typeNames=csw:Record&elementSetName=full&ConstraintLanguage=CQL_TEXT&constraint_language_version=1.1.0&constraint=csw:ResourceIdentifier=%27https://registry.gdi-de.org/id/de.bund.destatis/DE-30303036-3131-4031-312d-303030340000%27) conformance to Regulation (EU) No 1089/2010 (INSPIRE) |

The chosen dataset is **open**: the licence dl-de/by-2-0 allows free reuse and modification with attribution, and the data is free to download as CSV. It is also **FAIR, but with limitations**. It has a stable URL, a table code, catalogue records, open access and a licence in the metadata, but no DOI or version identifier, and the downloaded CSV has no ISO 8601 dates, no data dictionary and no links to sources.

3 things to improve for milestone 2:
- Publish the final dataset with a persistent identifier and a version.
- Use standard formats: ISO 8601 dates (`YYYY-MM`) and a `LICENSE`/metadata file with the licence. ISO 3166 codes are not needed here, because the data covers only Germany.
- Provide a data dictionary for every column and document the provenance: where each source comes from, when it was retrieved and which script built the table.

## What to combine the chosen dataset with

**Second source: [Wikimedia Pageviews API](https://doc.wikimedia.org/generated-data-platform/aqs/analytics-api/)** – pageview statistics for individual Wikipedia articles

The API provides the number of views for individual Wikipedia articles over time. I plan to use the German Wikipedia articles (e.g. "Konzert", "Kino", "Theater", "Zirkus") as an indicator of public online attention to different cultural activities.

The data can be retrieved in [JSON format](https://doc.wikimedia.org/generated-data-platform/aqs/analytics-api/documentation/getting-started.html) and aggregated monthly. 

Sample of the API-query:\
`https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/de.wikipedia.org/all-access/user/Konzert/monthly/2015070100/2026100100`

The API data is available under the [**CC0 1.0 licence**](https://doc.wikimedia.org/generated-data-platform/aqs/analytics-api/documentation/access-policy.html).

### Shared key 

Both sources contain a time dimension. The shared key will be the year and month.

| Source | Original date format | After cleaning |
|---|---|---|
| Destatis VPI | Year in `time` (`2017`) and month as code in `1_variable_attribute_code` (`MONAT01`, label `Januar`) | 2017-01 |
| Wikimedia Pageviews API | Timestamp (e.g. `2017010100`) | 2017-01 |

The Wikimedia data will be requested with monthly granularity. The Destatis month code is turned into a number (the last two digits of `MONAT01`), and both sources are converted to ISO 8601 format (`YYYY-MM`).

### Granularity

Destatis dataset contains monthly national price indices for Germany. The Wikimedia API can provide monthly pageview counts. Therefore the time granularity matches after selecting monthly data.

One limitation is that views of the German Wikipedia are not necessarily views by people located in Germany. They represent attention to the German-language Wikipedia article, not exclusively German users.

### Research questions

1. Are changes in online attention to different cultural activities (concerts, cinema, theatre and circus) associated with changes in the consumer price index for cultural events in Germany?
2. Do changes in online attention to different cultural activities occur before, at the same time as, or after changes in the consumer price index for cultural events in Germany?

### Licences

The Destatis dataset is published under the **Datenlizenz Deutschland – Namensnennung – Version 2.0** licence. The Wikimedia Pageviews API data is available under **CC0 1.0**.

The datasets can be combined and the resulting dataset can be published, provided that the Destatis attribution requirements are followed. This includes naming Destatis as the source, linking to the original dataset and licence, and indicating any modifications made to the original data. The Wikimedia data is available under CC0 and does not require attribution.

## Next steps: from two downloads to the joined table

1. Download the Destatis flat CSV and keep it unchanged in `data/raw/`.
2. Select the series `CC13-09421` and clean it: replace the placeholder `...` with an empty value, convert the decimal comma to a number.
3. Build the date `YYYY-MM` from the year (`time`) and the month code (`MONAT01` → `01`).
4. Request the monthly pageviews of the German Wikipedia articles "Konzert", "Kino", "Theater" and "Zirkus" from the Wikimedia API and keep the JSON in `data/raw/`.
5. Extract the timestamp and the number of views, convert the timestamp to `YYYY-MM` and give each article its own column.
6. Check for missing months and align the date ranges (Jan 2017–Sep 2026).
7. Join both tables on the column `date`.
8. Save the result in `data/processed/` with a data dictionary and the source, retrieval date and licence of each column.

### Verdict
Yes, I would build the project on this dataset: it is open (dl-de/by-2-0), it has monthly values for the same period as the Wikimedia pageviews, and both sources can be joined on the month (`YYYY-MM`). The biggest risk is validity: the Destatis series is a price index and the pageviews measure interest in an encyclopedia article, so neither measures how many people actually go to concerts or cinemas. In addition, the German-language Wikipedia is also read outside Germany, and the pandemic months of 2020-2021, which are flagged `()` as statistically uncertain in the Destatis file, may distort the relationship.
