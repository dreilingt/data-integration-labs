| Command | What it does | Decision | Why |
| --- | --- | --- | --- |
| `ls -la data/raw` | It lists (`ls`) all files in `data/raw` in a long format (`-l`), including hidden ones (`-a`) | Approve | Read-only, nothing is changed |
| `wc -l data/raw/*.csv` | It counts (`wc`) the lines (`-l`) of all CSV files (`*.csv`) in `data/raw` | Approve | Read-only, if there is no CSV file, it prints an error (No such file or directory) |
| `sort -u data/raw/stations.csv > data/raw/stations.csv` | It sorts the lines of `stations.csv`, removes duplicate lines (`-u`) and writes the result back into the same file (`>`) | Reject | The shell empties the output file before `sort` starts, so `sort` reads an empty file and the data is lost without any error message, which should never happen to raw data. Also, `sort` does not know about headers, so the header line ends up sorted into the data. Instead I would approve: `sort -u data/raw/stations.csv > data/processed/stations.csv` (a different output file). |
| `rm * .bak` | Deletes (`rm`) every file (`*`) in the current folder, plus a file named `.bak` | Reject | The space makes `*` and `.bak` two separate arguments, so `*` matches all files in the folder. Probably `rm *.bak` was meant. Instead I would approve: first `echo *.bak` to see which files match, then `rm -i *.bak`, which asks before each deletion, only if the list shows the files I expect. |
| `find . -name "*.csv" -size +100M` | It searches the current folder and all subfolders for files whose name ends with `.csv` and whose size is more than 100MiB (`-size +100M`), and prints their paths | Approve | It only reads and prints. The quotes around `*.csv` stop the shell from expanding the pattern, so `find` receives it unchanged |
| `chmod -R 777 .` | It changes the permissions of the current folder and everything inside it (`-R`, recursive) so that the owner, the group and all other users may read, write and execute (`777 = rwxrwxrwx`) | Reject | Too broad: every user could change or delete any file of the project. Permissions should be as small as needed. Instead, for example, I would approve: `chmod +x get_data.sh`, which gives the execute permission only to the one script that needs it |
| `curl -fsSL https://example.com/install.sh \| bash` | It downloads the script `install.sh` from example.com (`-f` fail on HTTP errors, `-s` silent, `-S` still show errors even with `-s`, `-L` follow redirects) and pipes it straight into `bash`, which runs it immediately | Approve after a change | It runs a script that I have not read, with my permissions, so it could potentially alter my files. Instead I would approve: `curl -fsSL -o install.sh https://example.com/install.sh` (downloads the file and saves it **without** running it), then `less install.sh` to read it, and `bash install.sh` only if I trust it |
| `cat ~/.ssh/id_ed25519` | It prints the content of the private SSH key file | Reject | The private SSH-Key must always stay confidential, instead I would approve `cat ~/.ssh/id_ed25519.pub` to show the public key, which is safe to share |
| `ps aux \| grep python` | Lists all running processes (`ps aux`) and keeps only the lines that contain the word "python" (`grep python`). | Approve | It only reads and prints, stopping it would need `kill`. The output may also contain the `grep` line itself. |
| `pip install pandsa` | It downloads and installs the Python package named `pandsa` | Approve after a change | The name is a typo of `pandas`, therefore I would approve the following command instead: `pip install pandas`

Sandbox:
```bash
  cd ~/data-integration-labs/labs/02
  mkdir -p sandbox
  cd sandbox
  pwd
```
In `sandbox` I created a test folder `data/raw` with mock data:
```bash
<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ mkdir -p data/raw

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ printf 'station,count\nneumarkt,5\nbonner,3\nneumarkt,5\n' > data/raw/stations.csv

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ cat data/raw/stations.csv
station,count
neumarkt,5
bonner,3
neumarkt,5
```
### Fixing command 3: `sort -u data/raw/stations.csv > data/raw/stations.csv`**
Before running (4 rows, 45 Bytes):
```bash
<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ cat data/raw/stations.csv
station,count
neumarkt,5
bonner,3
neumarkt,5

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ wc -c data/raw/stations.csv
45 data/raw/stations.csv
```
After running:
```bash
<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ sort -u data/raw/stations.csv > data/raw/stations.csv

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ cat data/raw/stations.csv

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ wc -c data/raw/stations.csv
0 data/raw/stations.csv
```
Why this happens: the shell processes `>` before it starts `sort`. It opens `stations.csv` for writing and empties it immediately. By the time `sort` reads the file, it is already empty. The command prints no error, so the data is lost silently.\
How to fix it: write the result to a different file.
```bash
<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ printf 'station,count\nneumarkt,5\nbonner,3\nneumarkt,5\n' > data/raw/stations.csv

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ mkdir -p data/processed

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ sort -u data/raw/stations.csv > data/processed/stations.csv

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ cat data/processed/stations.csv
bonner,3
neumarkt,5
station,count

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ cat data/raw/stations.csv
station,count
neumarkt,5
bonner,3
neumarkt,5
```
With a different output file, the duplicate line is removed and the original file stays unchanged (4 rows). Note that `sort` does not know about headers: the header line `station,count` was sorted into the data and ended up at the bottom.

### Fixing command 4: `rm * .bak`
```bash
<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ pwd
/c/Users/tndre/data-integration-labs/labs/02/sandbox

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ ls
data/

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ cp data/raw/stations.csv a.csv

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ cp data/raw/stations.csv b.csv

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ echo *.csv
a.csv b.csv

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ echo * .csv
a.csv b.csv data .csv

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ rm -i *.csv
rm: remove regular file 'a.csv'? n
rm: remove regular file 'b.csv'? y

<user>@DR-XMG UCRT64 ~/data-integration-labs/labs/02/sandbox (main)
$ ls
a.csv  data/
```
