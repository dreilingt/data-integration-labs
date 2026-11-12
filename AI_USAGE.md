## November 2026, Lab 2, Task 1-3
**Tool and model:** Claude (Anthropic), Claude Sonnet 5.5.\
**Prompts** (summarised): Provide lists of commands to answer questions (Tasks 1 and 3) and guide me through completing the tasks step by step, asking guiding questions and waiting for me to provide the outputs from my terminal.\
**Accepted:** A list of necessary commands adapted to my file locations.\
**How I checked:** I executed all commands myself in my terminal. Task 2 is not fully done yet.

## 11.11.2026 Lab 2, Task 4
**Tool and model:** Claude (Anthropic), Claude Sonnet 5.5.\
**Prompts** (summarised):
1. Work through Task 4 step by step with explanations (I attached the lecture slides and the task text).
2. How to get a download URL for the Genesis table (I pasted the page URL and the "Copy as cURL" output from the browser).
3. Pasted the output of each step and asked what to do next; asked how to stop a looping script.

**Accepted:**
- The script structure: shebang and comments, two variables, `mkdir -p`, `curl -fL -o ... || exit 1`, `>>` into SOURCES.txt, and the "first look" commands (`ls -lh`, `file`, `wc -l`, `head`, `tr`).
- The download URL and the licence (dl-zero-2-0).

**Changed:**
- I built the script step by step in VS Code and added my own comment for each task step.
- I switched the dataset from Destatis CPI to the Cologne bike counts. Claude only listed the options from the task; the decision was mine. Reason: I could not get URL of the "Download" process.

**Rejected or wrong:** I did not use the Genesis POST request in the script.

**How I checked:** Ran the script: 1864 bytes, which matches the 1.82 KB on the dataset page.

## 12.11.2026 Lab 2, Task 5
**Tool and model:** Claude (Anthropic), Claude Sonnet 5.5.\
**Prompts** (summarised): Check my explanations of the ten commands; then, for each command, explain how to test it in the sandbox where necessary. Also, review my own wording and suggest improvements.\
**Accepted:** The decisions and replacement commands for *reject* and *approve with a change*.\
**Changed:** I further edited the "What it does" and "Why" columns trying to keep them informative, but not too long.\
**Rejected:** Commands 6-10 were not run in the terminal, I made my decisions based on the documentation and [Explainshell](https://explainshell.com).\
**How I checked:** By running commands in my terminal or checking their explanations using Explainshell and the `--help` option in the terminal (e.g. `chmod --help`).
