## Task 3. Mine half a million journal articles
### 1. Shape

**Column names of `2014-01_JA.tsv` with their numbers:**

```bash
$ head -n 1 2014-01_JA.tsv | tr "\t" "\n" | cat -n
     1  File
     2  Creator
     3  Issue
     4  Volume
     5  Journal
     6  ISSN
     7  ID
     8  Citation
     9  Title
    10  Place Labe
    11  Language
    12  Publisher
    13  Date
```
The name of column 10 is cut off: `Place Labe`(probably it's `Place Label`).

**Do all four files have the same header?**

```bash
$ head -n 1 2014-01_JA.tsv > h1.txt
$ head -n 1 2014-01-31_JA-africa.tsv > h2.txt
$ head -n 1 2014-01-31_JA-america.tsv > h3.txt
$ head -n 1 2014-02-02_JA-britain.tsv > h4.txt
$ diff h1.txt h2.txt
$ diff h1.txt h3.txt
$ diff h1.txt h4.txt
-- (here I got no output)
$ rm h1.txt h2.txt h3.txt h4.txt
```
`diff` prints nothing, so all four files have the same header.

**How many articles does each file contain?**
```bash
$ wc -l *.tsv
  507732 2014-01_JA.tsv
  13712 2014-01-31_JA-africa.tsv
  27392 2014-01-31_JA-america.tsv
  5375 2014-02-02_JA-britain.tsv
  554211 total

$ tail -n +2 2014-01_JA.tsv | wc -l
507731
```
Each file has one header line, so the number of articles is the number of lines minus 1: 507 731 (JA), 13 711 (africa), 27 391 (america) and 5 374 (britain).

### 2. Missing values
```bash
$ cut -f 11 2014-01_JA.tsv | head -n 10
Language
eng
eng
eng
eng
eng
eng
eng
eng
eng

$ tail -n +2 2014-01_JA.tsv | cut -f 11 | sort | uniq -c | sort -nr | head -n 15
  403284 eng
  40155 fre
  36100
  28192 ger
```
3 100 articles have no language (the empty value). The languages are English (403 284), French (40 155) and German (28 192); together with the empty value they add up to 507 731, the number of articles.

### 3. Years
**Which year has the most articles?**
```bash
$ cut -f 13 2014-01_JA.tsv | head -n 5
Date
1993
1993
1993
1993

$ tail -n +2 2014-01_JA.tsv | cut -f 13 | grep -o "[0-9]\{4\}$" | sort | uniq -c | sort -nr | head -n 10
  30813 1997
  28215 1998
  27968 1996
  27916 2002
  27335 2001
  27073 1999
  26266 2003
  26129 2005
  26117 2000
  25831 2008
```
1997 has the most articles (30 813).

**Which year cannot be right?**
```bash
$ tail -n +2 2014-01_JA.tsv | cut -f 13 | grep -o "[0-9]\{4\}$" | sort | uniq -c | sort -k2 -n | tail -n 10
  26129 2005
  24556 2006
  24681 2007
  25831 2008
  25264 2009
  24912 2010
  24788 2011
  21804 2012
   8430 2013
     20 2077
```
2077 cannot be right: it's related to the future, and the data was collected in 2014. It occurs in 20 articles.

**Which journal do these articles come from?**
```bash
$ cut -f 5,13 2014-01_JA.tsv | grep "2077$" | sort | uniq -c
     20 FRANCAIS DANS LE MONDE  2077

$ cut -f 3,4,8,13 2014-01_JA.tsv | grep "2077$" | head -n 5
SUPP    353     FRANCAIS DANS LE MONDE 353(SUPP), 2-2. (2077)   2077
SUPP    353     FRANCAIS DANS LE MONDE 353(SUPP), 4-5. (2077)   2077
SUPP    353     FRANCAIS DANS LE MONDE 353(SUPP), 6-7. (2077)   2077
SUPP    353     FRANCAIS DANS LE MONDE 353(SUPP), 8-9. (2077)   2077
SUPP    353     FRANCAIS DANS LE MONDE 353(SUPP), 10-11. (2077) 2077
```
All 20 articles come from the journal FRANCAIS DANS LE MONDE, issue SUPP, volume 353. The Citation column also says 2077.

**Which year was probably meant?**
```bash
$ cut -f 5,13 2014-01_JA.tsv | grep "FRANCAIS DANS LE MONDE" | cut -f 2 | sort | uniq -c
     68 1995
    170 1996
    200 1997
    200 1998
    333 1999
    191 2000
    236 2001
    321 2002
    314 2003
    296 2004
    243 2005
    210 2006
    226 2007
    268 2008
    285 2009
    159 2010
    173 2011
    137 2012
     77 2013
     20 2077

$ cut -f 3,4,5,13 2014-01_JA.tsv | grep "FRANCAIS DANS LE MONDE" | grep -E "200[78]$" | cut -f 1,2,4 | sort -u | head -n 30
349             2007
350             2007
351             2007
352             2007
354             2007
355             2008
356             2008
357             2008
358             2008
359             2008
360             2008
SUPP    351     2007
SUPP    357     2008
SUPP    360     2008
```
The journal has articles from 1995 to 2013 and 2077 is an outlier. The volume numbers grow with the year: volumes 349-352 and 354 are from 2007, volumes 355-360 from 2008. Volume 353 lies between 352 and 354, therefore the correct year is probably 2007.

### 4. Lines are not fields
```bash
$ grep -ci africa 2014-01_JA.tsv
33577
$ cut -f 9 2014-01_JA.tsv | grep -ci africa
13711
$ grep -i africa 2014-01_JA.tsv | cut -f 5,9 | head -n 5
NORTHEAST AFRICAN STUDIES       Inequality and Democracy in Sudanese History
NORTHEAST AFRICAN STUDIES       Non-Acceptance of Islam in the Southern Sudan: The Case of the Dinka from the Pre-Colonial Period to Independence (1956)
NORTHEAST AFRICAN STUDIES       Missed Opportunities: The Failure of Intensification and Diversification in the Gezira Scheme
NORTHEAST AFRICAN STUDIES       The Problem of Centralization in the Sudan
NORTHEAST AFRICAN STUDIES       Sudan's Democratic Experiment: Present Crisis and Future Prospects
```
33 577 lines contain "africa", but only 13 711 titles do. `grep` searches the whole line, so it also matches "africa" in other columns, i.e. in journal names such as NORTHEAST AFRICAN STUDIES, where the title itself does not contain the word.

### 5. Where does a file come from?
```bash
$ tail -n +2 2014-01_JA.tsv | cut -f 9 | grep -i africa > t_all.txt
$ tail -n +2 2014-01-31_JA-africa.tsv | cut -f 9 > t_africa.txt
$ diff t_all.txt t_africa.txt
(no output)
$ wc -l t_all.txt t_africa.txt
  13711 t_all.txt
  13711 t_africa.txt
  27422 total
```
`diff` prints nothing, both files have 13 711 titles, so the claim holds for the Africa file: it contains exactly the articles of `2014-01_JA.tsv` with *africa* in the title.

**Does it hold for the America file, too?**
```bash
$ tail -n +2 2014-01_JA.tsv | cut -f 9 | grep -i america > t_all.txt
$ tail -n +2 2014-01-31_JA-america.tsv | cut -f 9 > t_america.txt
$ diff t_all.txt t_america.txt | head
12280c12280
< British Trade with Spanish America, 1763Ã¯Â¿Â½1808 - by Pearce, A. J.
---
> British Trade with Spanish America, 1763ï¿½1808 - by Pearce, A. J.
$ wc -l t_all.txt t_america.txt
  27391 t_all.txt
  27391 t_america.txt
  54782 total
```
Both files contain 27 391 titles, and `diff` finds only one difference: in line 12280 the dash between 1763 and 1808 is garbled differently in the two files (¯Â¿Â½ vs. ï¿½, an encoding problem). So the America file contains the same articles, but one title was changed.

### 6. Spreadsheet damage
```bash
$ tail -n +2 2014-01_JA.tsv | cut -f 3 | sort | uniq -c | sort -nr | head -n 20
  99743 1
  96514 2
  75421 3
  58325 4
  30668
   9650 5
   5325 6
   4219 01-Feb
   3157 03-Apr
   2736 7
   2077 8
   2035 10
   2009 12
   1965 11
   1829 9
   1731 02-Mar
    793 SUM
    781 AUT
    732 WIN
    707 SPR

$ cut -f 3,8 2014-01_JA.tsv | grep "^01-Feb" | head -n 5
01-Feb  WASHINGTON MONTHLY 28(1/2), 4-9. (1996)
01-Feb  WASHINGTON MONTHLY 28(1/2), 9-16. (1996)
01-Feb  WASHINGTON MONTHLY 28(1/2), 17-25. (1996)
01-Feb  WASHINGTON MONTHLY 28(1/2), 26-42. (1996)
01-Feb  WASHINGTON MONTHLY 28(1/2), 43-47. (1996)

$ cut -f 3,8 2014-01_JA.tsv | grep "^03-Apr" | head -n 5
03-Apr  INTERNATIONALES ASIENFORUM 26(3/4), 233-248. (1995)
03-Apr  INTERNATIONALES ASIENFORUM 26(3/4), 249-285. (1995)
03-Apr  INTERNATIONALES ASIENFORUM 26(3/4), 285-302. (1995)
03-Apr  INTERNATIONALES ASIENFORUM 26(3/4), 303-326. (1995)
03-Apr  INTERNATIONALES ASIENFORUM 26(3/4), 327-342. (1995)

$ cut -f 3,8 2014-01_JA.tsv | grep "^02-Mar" | head -n 5
02-Mar  NORTHEAST AFRICAN STUDIES 1(2/3), 7-18. (1994)
02-Mar  NORTHEAST AFRICAN STUDIES 1(2/3), 19-48. (1994)
02-Mar  NORTHEAST AFRICAN STUDIES 1(2/3), 49-74. (1994)
02-Mar  NORTHEAST AFRICAN STUDIES 1(2/3), 75-102. (1994)
02-Mar  NORTHEAST AFRICAN STUDIES 1(2/3), 103-118. (1994)

$ tail -n +2 2014-01_JA.tsv | cut -f 3 | grep -cE "^[0-9]{2}-[A-Z][a-z]{2}$"
11632
```
Most values are issue numbers (1, 2, 3 etc.). Not issue numbers are the empty value (30 668 rows), the seasons SUM, AUT, WIN and SPR (valid issue names of some journals), and values that look like dates, such as 01-Feb, 03-Apr and 02-Mar.
