## 1. Versions

```bash
<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git log --oneline -- data/co2-mm-mlo.csv | wc -l
48

<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git log --format="%h %ad %an %s" --date=short -- data/co2-mm-mlo.csv | head -n 10
52f2be5 2026-11-01 github-actions Commit from GitHub Actions (Update Data from NOAA)
8c40972 2026-10-01 github-actions Commit from GitHub Actions (Update Data from NOAA)
c38f24f 2026-09-01 github-actions Commit from GitHub Actions (Update Data from NOAA)
146bdc6 2026-08-01 github-actions Commit from GitHub Actions (Update Data from NOAA)
7a67754 2026-07-01 github-actions Commit from GitHub Actions (Update Data from NOAA)
9f751e7 2026-06-01 github-actions Commit from GitHub Actions (Update Data from NOAA)
15827da 2026-04-01 github-actions Commit from GitHub Actions (Update Data from NOAA)
4ae30e8 2026-03-03 Luccas Gomes fix: harden NOAA fetch and restore co2-mm-mlo output
0c74626 2026-03-01 github-actions Commit from GitHub Actions (Update Data from NOAA)
cfeb549 2026-02-01 github-actions Commit from GitHub Actions (Update Data from NOAA)

<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git log --format="%an" -- data/co2-mm-mlo.csv | sort | uniq -c
     30 github-actions
      1 Joel
      1 Luccas Gomes
     15 Soren Jones
      1 subhankar

<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git log --format="%ad" --date=format:%Y -- data/co2-mm-mlo.csv | sort | uniq -c
     10 2015
      4 2016
      2 2017
     10 2024
     11 2025
     11 2026
     
git log --format="%h %ad" --date=short -- data/co2-mm-mlo.csv | grep -E "2017|2024" | tail -n 3
ed48c9c 2024-02-13
af2c0a6 2017-03-13
a864797 2017-01-21

<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git show af2c0a6:data/co2-mm-mlo.csv | tail -n 2
2016-11-01,2016.875,403.53,403.53,405.57,27
2016-12-01,2016.958,404.48,404.48,405.25,29
```
**Results:**\
48 commits changed the file. They were made by github-actions (30), Soren Jones (15), Joel, Luccas Gomes and subhankar (1 each), in the years 2015 (10), 2016 (4), 2017 (2), 2024 (10), 2025 (11) and 2026 (11). Nobody updated the file in 2018-2023, the last commit before the gap is `af2c0a6` (2017-03-13), the next one `ed48c9c` (2024-02-13). During these years the latest month in the file was December 2016.

## 2. The day data disappeared
```bash
<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git log --stat -- data/co2-mm-mlo.csv  # press Enter till March, the month we need commits
commit 4ae30e87c8fd9ce198729d132c91c416afab1923
Author: Luccas Gomes <luccasmmg@gmail.com>
Date:   Tue Mar 3 20:29:58 2026 -0300

    fix: harden NOAA fetch and restore co2-mm-mlo output

 data/co2-mm-mlo.csv | 815 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 815 insertions(+)

commit 0c7462649fd7804ab8088d434c4ac79c42e4b05d
Author: github-actions <41898282+github-actions[bot]@users.noreply.github.com>
Date:   Sun Mar 1 01:14:53 2026 +0000

    Commit from GitHub Actions (Update Data from NOAA)

 data/co2-mm-mlo.csv | 814 ----------------------------------------------------
 1 file changed, 814 deletions(-)

commit cfeb5496766ce6aafc3ed15a73eb3c8dc44b826c
Author: github-actions <41898282+github-actions[bot]@users.noreply.github.com>
Date:   Sun Feb 1 01:13:00 2026 +0000

    Commit from GitHub Actions (Update Data from NOAA)

 data/co2-mm-mlo.csv | 101 ++++++++++++++++++++++++++--------------------------
 1 file changed, 51 insertions(+), 50 deletions(-)

commit 85bf9a58ef815547cd7b31ae6d704f9549181995
Author: github-actions <41898282+github-actions[bot]@users.noreply.github.com>
Date:   Thu Jan 1 00:58:42 2026 +0000

    Commit from GitHub Actions (Update Data from NOAA)

<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git show 0c74626:data/co2-mm-mlo.csv | cat
Date,Decimal Date,Average,Interpolated,Trend,Number of Days

<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git show 0c74626:data/co2-mm-mlo.csv | wc -l
1
```
The update `0c74626` (2026-03-01, github-actions) deleted 814 lines. On that day my `get_data.sh` would have downloaded a file with only the header line and no data rows. The download itself would have succeeded, so `curl -f` would not have stopped the script.

```bash
tndre@DR-XMG UCRT64 ~/co2-ppm (main)
$ git show 4ae30e8 --stat | cat
commit 4ae30e87c8fd9ce198729d132c91c416afab1923
Author: Luccas Gomes <luccasmmg@gmail.com>
Date:   Tue Mar 3 20:29:58 2026 -0300

    fix: harden NOAA fetch and restore co2-mm-mlo output

 .github/workflows/update.yml        |   6 +-
 UPDATE_SCRIPT_MAINTENANCE_REPORT.md |  10 +
 data/co2-mm-mlo.csv                 | 815 ++++++++++++++++++++++++++++++++++++
 scripts/process.sh                  |   6 +-
 4 files changed, 835 insertions(+), 2 deletions(-)

tndre@DR-XMG UCRT64 ~/co2-ppm (main)
$ git show 4ae30e8 -- scripts/process.sh | cat
commit 4ae30e87c8fd9ce198729d132c91c416afab1923
Author: Luccas Gomes <luccasmmg@gmail.com>
Date:   Tue Mar 3 20:29:58 2026 -0300

    fix: harden NOAA fetch and restore co2-mm-mlo output

diff --git a/scripts/process.sh b/scripts/process.sh
index 0c0f8e1..cb3bdf2 100755
--- a/scripts/process.sh
+++ b/scripts/process.sh
@@ -53,7 +53,11 @@ mkdir -p data
 for index in "${!files[@]}"; do
   file="${files[$index]}"
   header="${headers[$index]}"
-  curl ftp://aftp.cmdl.noaa.gov/products/trends/co2/$file > tmp/$file
+  curl --fail --silent --show-error --location ftp://aftp.cmdl.noaa.gov/products/trends/co2/$file -o tmp/$file
+  if [ ! -s "tmp/$file" ]; then
+    echo "Download failed or empty file: $file" >&2
+    exit 1
+  fi
   output=`rename $file`
   write_csv_header "${header}" data/$output
   write_csv_content tmp/$file data/$output
```
Luccas Gomes repaired the file in commit `4ae30e8` on 2026-03-03, two days after the deletion (2026-03-01). It restored 815 lines of data.

## 3. Old numbers change
```bash
<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git show --stat 8c40972 | cat
commit 8c4097238570147adf6fa97ad357315528dac4c5
Author: github-actions <41898282+github-actions[bot]@users.noreply.github.com>
Date:   Thu Oct 1 02:50:42 2026 +0000

    Commit from GitHub Actions (Update Data from NOAA)

 data/co2-annmean-gl.csv |  40 +--
 data/co2-gr-gl.csv      |  48 +--
 data/co2-gr-mlo.csv     |   2 +-
 data/co2-mm-gl.csv      | 863 ++++++++++++++++++++++++------------------------
 data/co2-mm-mlo.csv     | 103 +++---
 5 files changed, 529 insertions(+), 527 deletions(-)

<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git diff 8c40972~1 8c40972 -- data/co2-mm-mlo.csv | head -n 60
diff --git a/data/co2-mm-mlo.csv b/data/co2-mm-mlo.csv
index 7726ac7..087f080 100644
--- a/data/co2-mm-mlo.csv
+++ b/data/co2-mm-mlo.csv
@@ -296,7 +296,7 @@ Date,Decimal Date,Average,Interpolated,Trend,Number of Days
 1982-09,1982.7083,338.37,341.56,21,0.59,0.25
 1982-10,1982.7917,338.41,341.77,26,0.50,0.19
 1982-11,1982.8750,339.44,341.59,24,0.39,0.15
-1982-12,1982.9583,340.78,341.70,26,0.30,0.11
+1982-12,1982.9583,340.78,341.71,26,0.30,0.11
 1983-01,1983.0417,341.57,341.75,28,0.47,0.17
 1983-02,1983.1250,342.78,342.25,24,0.37,0.15
 1983-03,1983.2083,343.37,341.85,27,0.88,0.32
@@ -426,7 +426,7 @@ Date,Decimal Date,Average,Interpolated,Trend,Number of Days
 1993-07,1993.5417,357.45,356.87,25,0.78,0.30
 1993-08,1993.6250,355.76,357.44,27,0.62,0.23
 1993-09,1993.7083,354.14,357.51,23,0.73,0.29
-1993-10,1993.7917,354.23,357.60,28,0.29,0.11
+1993-10,1993.7917,354.23,357.61,28,0.29,0.11
 1993-11,1993.8750,355.53,357.65,29,0.26,0.09
 1993-12,1993.9583,357.03,357.92,29,0.28,0.10
 1994-01,1994.0417,358.36,358.25,27,0.33,0.12
@@ -447,7 +447,7 @@ Date,Decimal Date,Average,Interpolated,Trend,Number of Days
 1995-04,1995.2917,363.44,360.76,29,0.65,0.23
 1995-05,1995.3750,363.83,360.73,29,0.66,0.24
 1995-06,1995.4583,363.33,360.98,27,0.37,0.14
-1995-07,1995.5417,361.78,361.10,28,0.36,0.13
+1995-07,1995.5417,361.78,361.11,28,0.36,0.13
 1995-08,1995.6250,359.33,360.93,24,0.70,0.28
 1995-09,1995.7083,358.32,361.70,24,0.68,0.26
 1995-10,1995.7917,358.14,361.52,29,0.26,0.09
@@ -742,28 +742,28 @@ Date,Decimal Date,Average,Interpolated,Trend,Number of Days
 2019-11,2019.8750,410.47,412.50,26,0.40,0.15
 2019-12,2019.9583,411.97,412.71,31,0.40,0.14
 2020-01,2020.0417,413.59,413.22,29,0.73,0.26
-2020-02,2020.1250,414.32,413.40,28,0.69,0.25
+2020-02,2020.1250,414.32,413.41,28,0.69,0.25
 2020-03,2020.2083,414.72,413.35,26,0.32,0.12
 2020-04,2020.2917,416.42,413.92,28,0.65,0.24
 2020-05,2020.3750,417.28,413.98,27,0.61,0.23
-2020-06,2020.4583,416.58,414.15,27,0.44,0.16
+2020-06,2020.4583,416.58,414.16,27,0.44,0.16
 2020-07,2020.5417,414.58,414.19,30,0.57,0.20
 2020-08,2020.6250,412.75,414.60,25,0.25,0.10
-2020-09,2020.7083,411.50,414.90,29,0.31,0.11
+2020-09,2020.7083,411.50,414.91,29,0.31,0.11
 2020-10,2020.7917,411.49,414.79,30,0.22,0.08
-2020-11,2020.8750,413.10,415.11,27,0.81,0.30
+2020-11,2020.8750,413.10,415.12,27,0.81,0.30
 2020-12,2020.9583,414.23,414.91,30,0.48,0.17
 2021-01,2021.0417,415.49,415.23,29,0.44,0.16
 2021-02,2021.1250,416.72,415.80,28,1.02,0.37
 2021-03,2021.2083,417.61,416.17,28,0.86,0.31
-2021-04,2021.2917,419.01,416.59,24,1.12,0.44
+2021-04,2021.2917,419.01,416.58,24,1.12,0.44
 2021-05,2021.3750,419.09,415.88,28,0.90,0.32
 2021-06,2021.4583,418.93,416.48,29,0.65,0.23
 2021-07,2021.5417,416.90,416.48,31,0.71,0.24
 2021-08,2021.6250,414.42,416.27,25,0.74,0.28
 2021-09,2021.7083,413.26,416.63,27,0.29,0.11

<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git diff 8c40972~1 8c40972 -- data/co2-mm-mlo.csv | grep "^-[0-9]" | head -n 1
-1982-12,1982.9583,340.78,341.70,26,0.30,0.11

<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git diff --word-diff --word-diff-regex='[^,]+' 8c40972~1 8c40972 -- data/co2-mm-mlo.csv | head -n 20
diff --git a/data/co2-mm-mlo.csv b/data/co2-mm-mlo.csv
index 7726ac7..087f080 100644
--- a/data/co2-mm-mlo.csv
+++ b/data/co2-mm-mlo.csv
@@ -296,7 +296,7 @@ Date,Decimal Date,Average,Interpolated,Trend,Number of Days
1982-09,1982.7083,338.37,341.56,21,0.59,0.25
1982-10,1982.7917,338.41,341.77,26,0.50,0.19
1982-11,1982.8750,339.44,341.59,24,0.39,0.15
1982-12,1982.9583,340.78,[-341.70-]{+341.71+},26,0.30,0.11
1983-01,1983.0417,341.57,341.75,28,0.47,0.17
1983-02,1983.1250,342.78,342.25,24,0.37,0.15
1983-03,1983.2083,343.37,341.85,27,0.88,0.32
@@ -426,7 +426,7 @@ Date,Decimal Date,Average,Interpolated,Trend,Number of Days
1993-07,1993.5417,357.45,356.87,25,0.78,0.30
1993-08,1993.6250,355.76,357.44,27,0.62,0.23
1993-09,1993.7083,354.14,357.51,23,0.73,0.29
1993-10,1993.7917,354.23,[-357.60-]{+357.61+},28,0.29,0.11
1993-11,1993.8750,355.53,357.65,29,0.26,0.09
1993-12,1993.9583,357.03,357.92,29,0.28,0.10
1994-01,1994.0417,358.36,358.25,27,0.33,0.12
```
**Results:**\
The update of 1 October 2026 changed 51 existing months, so a download from September contains values that the October version no longer has. In the lines I checked, the Interpolated value changed by 0.01. Numbers computed from the September file could therefore differ from numbers computed from the current file.

## 4. A header that no longer pins
```bash
<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git show 8c40972:data/co2-mm-mlo.csv | head -n 2
Date,Decimal Date,Average,Interpolated,Trend,Number of Days
1958-03,1958.2027,315.71,314.44,-01,-9.99,-0.99

<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git show af2c0a6:data/co2-mm-mlo.csv | head -n 2
Date,Decimal Date,Average,Interpolated,Trend,Number of Days
1958-03-01,1958.208,315.71,315.71,314.62,-1
```
Questions after comparison of two commits:\
*How many names does the header have, and how many values does a row have? Since which commit has it been that way?*

In the version of 1 October 2026 the header has 6 names, but a row has 7 values. In the version of 13 March 2017 the header had 6 names and a row 6 values. The date format also changed from `1958-03-01` to `1958-03`.

```bash
<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git show ed48c9c:data/co2-mm-mlo.csv | sed -n 2p
1958-03,1958.2027,315.70,314.43,-01,-9.99,-0.99

<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git show af2c0a6:data/co2-mm-mlo.csv | sed -n 2p
1958-03-01,1958.208,315.71,315.71,314.62,-1
```
Since commit `ed48c9c` (13 February 2024), the header has 6 names, but a row has 7 values. In `af2c0a6` (13 March 2017), the header and the rows both had 6. The same is still true in the latest version I checked (`52f2be5`, 1 November 2026).

*Is the problem known on Github?*

Yes, the problem is known on Github. There is an [open issue #18](https://github.com/datasets/co2-ppm/issues/18) ("co2-mm-gl.csv and co2-mm-mlo.csv have incorrect number of header names vs columns"). It has not been fixed: the issue is still open, and the latest version I checked (`52f2be5`, 1 November 2026) still has 6 header names and 7 values per row.

## 5. Pin your version
```bash
<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git rev-parse 8c40972
8c4097238570147adf6fa97ad357315528dac4c5

# URL with pinned version:
# https://raw.githubusercontent.com/datasets/co2-ppm/8c4097238570147adf6fa97ad357315528dac4c5/data/co2-mm-mlo.csv


<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ curl -fsSL https://raw.githubusercontent.com/datasets/co2-ppm/8c4097238570147adf6fa97ad357315528dac4c5/data/co2-mm-mlo.csv | tail -n 1
2026-08,2026.6250,427.55,429.51,17,0.36,0.17

<user>@DR-XMG UCRT64 ~/co2-ppm (main)
$ git checkout 0c74626
Note: switching to '0c74626'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at 0c74626 Commit from GitHub Actions (Update Data from NOAA)

<user>@DR-XMG UCRT64 ~/co2-ppm ((0c74626...))
$ wc -l data/co2-mm-mlo.csv
1 data/co2-mm-mlo.csv

<user>@DR-XMG UCRT64 ~/co2-ppm ((0c74626...))
$ git switch main
Previous HEAD position was 0c74626 Commit from GitHub Actions (Update Data from NOAA)
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
```
**Results:**

This URL always returns the file as it was on 1 October 2026.The version of the day the data disappeared (`0c74626`) has 1 line (only the header). Git calls the state in between **detached HEAD**: HEAD points directly to a commit and not to a branch.

## Conclusion
In my project README, I note for every dataset the access date and, if the source is in Git, the full commit hash or a URL with this hash instead of `main`. For a portal without Git (Destatis), there is no hash, so I note the access date and the exact download URL. To make it even safer, I could also publish the exact version I used with a DOI (e.g. on Zenodo).