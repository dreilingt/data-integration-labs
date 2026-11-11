
## 11.11.2026 Lab 2, Task 4

**Tool and model:** Claude (Anthropic), Claude Sonnet 5.5.

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

**Rejected or wrong:**
- I did not use the Genesis POST request in the script.
- Claude's first guess for the endless loop was wrong. The real cause: I had put the step 6 commands (`./get_data.sh`) inside get_data.sh, so the script started itself.

**How I checked:** Ran the script: 1864 bytes, which matches the 1.82 KB on the dataset page.
