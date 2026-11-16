# Conflict
## countries.csv as Git left it
```
<<<<<<< HEAD
name,iso3,iso2,numeric
Czech Republic,CZE,CZ,203
Germany,DEU,DE,276
Macedonia,MKD,MK,807
Swaziland,SWZ,SZ,748
Turkey,TUR,TR,792
=======
name,iso3,iso2
Czechia,CZE,CZ
Germany,DEU,DE
North Macedonia,MKD,MK
Eswatini,SWZ,SZ
Türkiye,TUR,TR
>>>>>>> feature/new-names
```
`cut -d, -f1 countries.csv` shows the first column twice: `name` appears two times, and every country appears once with its old name and once with its new name (Germany twice). The three marker lines `<<<<<<< HEAD`, `=======` and `>>>>>>> feature/new-names` appear in the same column as if they were country names. A program that reads this file would take them for data rows, so it would see 15 rows in total instead of 6.

Output of `git log --oneline --graph -8`
```bash
<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/03 (main)
$ git log --oneline --graph -8
*   f55c381 (HEAD -> main) Merge branch 'feature/new-names'
|\
| * a9348bd (feature/new-names) Countries are renamed to their current names
* | 201e9aa Numeric column added to countries.csv
|/
* b498b5d (feature/iso2) iso2 column added to countries.csv
* c18db23 countries.csv added with country names and ISO3 codes
* a08a298 (origin/main, origin/HEAD) Task 4 added to git.md
* 3d30b0c Revert "Change a year in download URL"
* bb13ec2 Change a year in download URL
```
## Questions
1. *The two branches changed different columns, so why did Git report a conflict?*

Git did not merge column by column. In `countries.csv`, both branches changed the same lines: `main` added a value to every line (the `numeric` column) and `feature/new-names` changed the names in four of those lines. Git cannot automatically resolve differences, therefore in this case it could not combine two versions of these lines.

2. *Why are Germany and the header part of the conflict, although only one branch changed them?*

Only `main` changed the header and the Germany line (it added the `numeric` column), `feature/new-names` left them as they were. But the changed lines of both branches lie directly next to each other, with no unchanged line in between. Git therefore does not split them up and shows the whole table as one conflict block.

3. *How could your team avoid conflicts like this one in a shared data file?*

Agree who changes which part of the file, and warn other team members before merging. It would also be helpful doing one kind of change per branch and merge it first.