## Lab 4, Task 1: Setup

| Question | Answer |
| --- | --- |
| Tool, model and version | GitHub Copilot in VS Code (Copilot Student plan). VS Code 1.147.0 (user setup), Copilot components: @github/copilot 1.0.111-0, @github/copilot-sdk 1.0.33-preview.0; OS: Windows 10.0.26200 x64. Model shown in the chat: Copilot Fusion GPT 5.6 Luna. |
| Permission mode in the beginning and switch | Agent mode: *Interactive*, Permissions: *Manual permissions*. I switch modes in the menu under the chat input (Agent mode: Interactive / Plan / Autopilot; Permissions: Manual / Assisted / Allow all). I added `"chat.tools.edits.autoApprove": {"**/*": false}` to the user settings so that file edits also ask for approval. |
| What it did without asking | Read files: yes. Run commands: `git log` ran without a prompt (read-only command). Edit files: no, creating `hello.txt` only happened after my approval. In Plan mode it presented a plan in the chat and created no files; accepting or rejecting it was my decision. |
| See changes and undo them | `git status` (and `git diff`) show the changes. In the chat: *Keep* / *Undo*, or *Restore Checkpoint* (appears once the chat has more than one message). Alternatively delete the file, e.g. `rm hello.txt`. |
|Start a fresh session, check the context window and the quota? | New session: the **+** (New Chat) button at the bottom left of the Chat panel. Context window: I did not find where its fill level is shown. Quota: click the Copilot icon at the bottom right of the chat window. This task used about 1.9 of 200 credits (about 1%). |
| Instructions | It reads `AGENTS.md` |
| Training models with my data | The option was enabled at the beginning. I disabled it manually in the Copilot settings of my GitHub account (*Allow GitHub to use my data for AI model training*). |

## Why this tool?
I chose GitHub Copilot in VS Code because I get it for free with my Student plan and it works inside VS Code, which I already know. As for data protection, it lets me disable training on my data in the account settings, and I can set it to ask for approval before it edits files. However, its drawbacks are the monthly credit limit (usage limits) and that it is not open source (openness).