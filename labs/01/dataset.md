## Dataset: [Verbraucherpreisindex: Deutschland, Monate, Klassifikation der Verwendungszwecke des Individualkonsums](https://genesis.destatis.de/datenbank/online/statistic/61111/table/61111-0004) 
CC13-09421 Besuch von Kino, Theater, Konzert, Zirkus u.Ä.

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

\* *DESTATIS allows to select a period between 1991 and 2026*

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
- Flag column has no header: flags are `e` (meaning "endgültiger Wert" according to GENESIS Zeichenerklärung (Sign Explanation)), `()` (11 values: Apr–Jun 2020 and Nov 2020-Jun 2021 meaning "Aussagewert eingeschränkt, da der Zahlenwert statistisch relativ unsicher ist") and empty cells next to `...` placeholders.
- Placeholders: `...` means "Angabe fällt später an" (value will follow).
- Labels: leading spaces encode the hierarchy (CC13-09 > 094 > 0942 > 09421).
- No totals row, but nested aggregates: CC13-09 (Freizeit, Unterhaltung und Kultur) is the parent of the other three rows. Index values must not be summed.
