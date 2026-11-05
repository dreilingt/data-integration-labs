## Task 1 Get to know your shell

### 1. Which shell?

**Shell Name**: `echo $0`

Output:
```bash
<user>@DR-XMG UCRT64 ~
$ echo $0
/usr/bin/bash
```

**Shell Version**: `bash --version`

Output:
```bash
<user>@DR-XMG UCRT64 ~
$ bash --version
GNU bash, version 5.3.15(2)-release (x86_64-pc-cygwin)
Copyright (C) 2025 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```
The terminal runs Bash (GNU Bash), version 5.3.15.

### 2. Where am I?
I used a command `pwd` to determine the **absolute path to my home directory**:
```bash
<user>@DR-XMG UCRT64 ~
$ pwd
/c/Users/tndre
```
To navigate to the **Downloads** I used the `cd` (change directory) command:
```bash
<user>@DR-XMG UCRT64 ~
$ cd ~/Downloads
```
To check the current location, I used `pwd` again: \
Output:
```bash
/c/Users/<user>/Downloads
```
**Windows File Explorer** shows the following path `C:\Users\<user>\Downloads`\
The paths match, but Bash and WFE use different path formats.

### 3. Where do commands come from?
PATH is a list of directories that are searched whenever a command is run, these directories are separated by `:`. Following results are for a directory with a path: `C:\Users\<user>\Downloads`

The first directory: `/c/Users/<user>/bin`, as it is the first line in the list created with the following command:
```bash
echo $PATH | tr ':' '\n'
```
Quantity of directories: 30
```bash
<user>@DR-XMG UCRT64 ~/Downloads
$ echo $PATH | tr ':' '\n' | wc -l
30
```
I used the command `which` to find the locations of the programs:
```bash
<user>@DR-XMG UCRT64 ~/Downloads
$ which curl
/ucrt64/bin/curl
```
`python3` is in: `/c/Users/<user>/AppData/Local/Microsoft/WindowsApps/python3` \
`git` is installed in: `/ucrt64/bin/git` and git version is: **2.56.0.windows.4**

### 4. How full is your disk?
How much space is left on it: **722 GB**
```bash
<user>@DR-XMG UCRT64 ~/Downloads
$ df -h
Filesystem            Size  Used Avail Use% Mounted on
C:/Program Files/Git  931G  210G  722G  23% /
G:                     15G  201M   15G   2% /g
```
How much space do my downloads take up: **8.2 GB**
```bash
<user>@DR-XMG UCRT64 ~/Downloads
$ du -sh ~/Downloads
8.2G    /c/Users/<user>/Downloads
```
### 5. Stop a runaway process
Search for the sleeping process in the second window:
```bash
<user>@DR-XMG UCRT64 ~/Downloads
$ ps -ef | grep sleep
   <user>     934     912 cons0    20:13:22 sleep 600
```
Here `ps -ef | grep sleep` command displayed only one process. It can list two processes because `grep sleep` is also a running process. Its command line contains the word `sleep`, so it can find itself in the search results. However, in my Git Bash environment only the sleep process was displayed.

The first terminal after 'killing' the `sleep` command:
```bash
<user>@DR-XMG UCRT64 ~
$ sleep 600
Terminated                 sleep 600
```
