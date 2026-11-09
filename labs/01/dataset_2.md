## Dataset: [Verbraucherpreisindex: Deutschland, Monate](https://genesis.destatis.de/datenbank/online/statistic/61111/table/61111-0002)
table 61111-0002

### 1. Facts

|  | Verbraucherpreisindex für Deutschland |
|---|---|
| Full title | Verbraucherpreisindex: Deutschland, Monate, table 61111-0002 |
| Publisher | Statistisches Bundesamt (Destatis), GENESIS-Online |
| Link / identifier | https://genesis.destatis.de/datenbank/online/statistic/61111/table/61111-0002 · table 61111-0002 · statistic 61111 |
| Formats | CSV (flat layout), downloaded; CSV; XLSX |
| Size | 1 file, 57,233 bytes (≈56 KB); 360 data rows + 1 header row, 18 columns (flat format: one row per month and measure; 3 measures × 120 months) |
| Coverage period | Jan 2017-Dec 2026 (120 months per measure). Observations exist from Jan 2017 to Sep 2026 (117 months). Oct-Dec 2026 contain the placeholder `...` (9 cells in total) |
| Coverage area | Germany (national, `DG`), no regional breakdown |
| Granularity | Monthly. Three measures: index (2020 = 100), change vs. the same month of the previous year (%), change vs. the previous month (%) |
| Last update | The file has no export timestamp, but the last update can be checked on the [dataset page](https://genesis.destatis.de/datenbank/online/statistic/61111/table/61111-0002). Latest value: Sep 2026 |
| Licence | Datenlizenz Deutschland – Namensnennung – Version 2.0 (dl-de/by-2-0), [stated](https://www.destatis.de/DE/Service/Impressum/copyright-genesis-online.html) by Destatis for GENESIS-Online |

### 2. Stars (5-star scheme)
★★★ Open format (CSV, no proprietary software needed).
Missing for the 4th and 5th star: URIs to identify entities in the data and links to other datasets.

### 3. Open the data

The file was opened in Microsoft Excel 365 and Notepad++. Encoding: UTF-8 with BOM, separator: semicolon. `value` column was imported as text, therefore it was additionally transformed via Transform Data -> Data Type -> Decimal Number.

Statistics per measure, over the months with a numeric value (Jan 2017–Sep 2026):

| Measure | Values | Min | Max | Mean |
|---|---|---|---|---|
| Price index (2020 = 100) | 117 | 95,1 | 126,6 | 108,59 |

**Empty cells:** the `value` column has 0 empty cells. Instead, it contains two placeholders: `...` in 9 rows (Oct–Dec 2026) and `-` in 13 rows (all in the month-on-month change, means 0 and reflect no change). The `value_q` (flag) column is empty in exactly these 22 rows.

**Odd things:**
 
- The two `%` measures cannot be told apart by any column. Year-on-year and month-on-month rows have the same `value_unit` (`%`), the same `value_variable_code` (`PREIS1`) and the same label `in`. Only the order of rows inside a month separates the measures: index, then year-on-year, then month-on-month.
  I checked this order against the index. For all 117 months, the second row matches the recomputed year-on-year change and the third matches the month-on-month change (maximum deviation 0,05, which is rounding).
  A column `measure` has to be built from this order, so the file must not be re-sorted before that step.
- The value `in` in `value_variable_label` looks strange (probably "in %").
- Rows are not sorted by time.
- 11 of 18 columns have the same value in every row (for example `statistics_code`, `time_code`, `2_variable_attribute_code`).
- Year (`time`) and month (`1_variable_attribute_code`, e.g. `MONAT02`) are in separate columns, so a date `YYYY-MM` has to be built.
- Numbers stored as text.

### 4. Data dictionary

| Column | Meaning | Type and unit | Example |
|---|---|---|---|
| `time` | Year of the observation | integer, year | `2025` |
| `1_variable_attribute_code` | Month of the observation (`MONAT01`–`MONAT12`); the label is in `1_variable_attribute_label` | text | `MONAT07` (Juli) |
| `value` | Index or rate of change, depending on the row (see `value_unit` and the row order) | decimal number (text with decimal comma), or placeholder `...` / `-` | `122,2` |
| `value_unit` | Unit of the value: index points with base year, or percent | text | `2020=100` or `%` |
| `value_q` | Quality flag of the value | text | `e` |

**Documentation by the publisher:** Destatis documents the statistic, not the columns of the CSV. The meaning of `e`, `...` and `-` is in the Zeichenerklärung (Sign Explanation) on the dataset page. There is no description of the columns and no description of how the three measures are ordered in the flat file.

### 5. License and Attribution line (TASL)

**Open according to the Open Definition?** Yes. The licence dl-de/by-2-0 allows free use, modification and sharing, including commercial use, and only requires attribution.

**What we must do when reusing it:** name the provider (Statistisches Bundesamt (Destatis)), add the licence note "dl-de/by-2-0" with a link to the licence text, refer to the dataset (with a link), and state that the data is changed ("own calculation") if it is being modified.

> Source: [Copyright for the Genesis-Online database](https://www.destatis.de/EN/Service/Legal-Notice/CopyrightGENESISOnlineDatabase.html)

**Attribution line for the README:**\
"Verbraucherpreisindex: Deutschland, Monate (Table 61111-0004, series CC13-09421)" by Statistisches Bundesamt (Destatis), Genesis-Online, https://genesis.destatis.de/datenbank/online/statistic/61111/table/61111-0002, [Data licence by-2-0](https://www.govdata.de/dl-de/by-2-0)

### 6. People
The dataset contains *no personal data*. It is a monthly national price index, aggregated over all of Germany, with no individuals, households or small groups, therefore nothing needs to be minimised for this dataset.
