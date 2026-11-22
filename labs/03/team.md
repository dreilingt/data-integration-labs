## Links

| Type | Name and Link |
| --- | --- |
| Issue #4 | [Lizenzabschnitt abschließen und Roadmap-Häkchen korrigieren - #4](https://github.com/Esmaa21/Data-Integration-3.3/issues/4) |
| Pull Request #3 by Melissa (Review) | [Platzhalter F3 aus der README entfernen - #3](https://github.com/Esmaa21/Data-Integration-3.3/pull/3) |
| Pull Request #8 | [Lizenzabschnitt abschließen und Roadmap korrigieren - #8](https://github.com/Esmaa21/Data-Integration-3.3/pull/8), my commits: 5d52d51, aff378f |

## Output of `git log --oneline --graph -15` in the team's repository (17.11.2026, 19:18):
```bash
<user>@DR-XMG UCRT64 ~/Data-Integration-3.3 (main)
$ git log --oneline --graph -15
*   ea7008f (HEAD -> main, origin/main, origin/HEAD) Merge pull request #9 from Esmaa21/fix/5-data-dateien
|\
| * 0f8e986 Rename README.md to README.md
| * 60e55f2 Datendateien in data/ hinzufügen
| * 9b32a05 Create README.md for project data documentation
* |   90d85e1 Merge pull request #13 from Esmaa21/Esmaa21-patch-2
|\ \
| * | 03576ec (origin/Esmaa21-patch-2) Fix license link for highest-grossing concert tours
* | |   6ad0de5 Merge pull request #12 from Esmaa21/MuhammedSalihAkpolat-patch-2
|\ \ \
| |/ /
|/| |
| * | 8c626fc (origin/MuhammedSalihAkpolat-patch-2) Update dataset description for Muhammed
|/ /
* |   b011460 Merge pull request #11 from Esmaa21/Esmaa21-patch-1
|\ \
| * | 8d7ece8 Roadmap für Meilenstein 2 und 3 ergänzt, damit Aufgaben und Zuständigkeiten klar sind.
|/ /
* | e26357d Add entry for highest-grossing concert tours
* | 7069073 Update README.md
* |   cf18fe5 Merge pull request #8 from Esmaa21/feature/4-lizenzen
|\ \
| * | aff378f Revise milestone status and licensing information
| * | 5d52d51 Revise licensing details and data source acknowledgments
| |/
```
I reviewed Melissa's PR #3, which removes the F3 placeholder from the README, and approved it. Melissa then assigned me issue #4, which I handled in PR #8. She requested changes on my first version, because my description said that I had updated the roadmap ticks, but the commit only changed the licence section. She also passed on an answer from our lecturer (Timo Breuer): the README must state clearly that the licence covers only our rights to the combined dataset and does not grant any rights to third parties or to the underlying news articles. I added both points in a second commit, and after her approval I merged the PR.

I had no conflict to resolve, because we merged our pull requests one after another. In our team, we agreed that nobody works directly on main: each change goes into its own branch and is merged only after a teammate has reviewed it in a pull request.