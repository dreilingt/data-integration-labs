| Command | What it does | Decision | Why |
| --- | --- | --- | --- |
| `ls -la data/raw` | It lists (`-ls`) all files in `data/raw` in a long format (`-l`), including hidden ones (`-a`) | Approved | Read-only, nothing is changed |
| `wc -l data/raw/*.csv` | It counts (`-wc`) the lines (`-l`) of all CSV files (`*.csv`) in `data/raw` | Approved | Read-only, if there is no CSV file, it prints an error (No such file or directory) |
| `sort -u data/raw/stations.csv > data/raw/stations.csv` | --- | --- | --- |
| `rm * .bak` | --- | --- | --- |
| `find . -name "*.csv" -size +100M` | --- | --- | --- |
| `chmod -R 777 .` | --- | --- | --- |
| `curl -fsSL https://example.com/install.sh \| bash` | --- | --- | --- |
| `cat ~/.ssh/id_ed25519` | --- | --- | --- |
| `ps aux \| grep python` | --- | --- | --- |
| `pip install pandsa` | --- | --- | --- |

Sandbox:
```bash
  cd ~/data-integration-labs/labs/02
  mkdir -p sandbox
  cd sandbox
  pwd
```
