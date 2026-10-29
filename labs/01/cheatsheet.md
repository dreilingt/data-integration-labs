# Markdown Cheat Sheet

## Table of contents

- [1. Text](#text)
- [Lists](#lists)
- [Links and images](#links-and-images)
- [Code](#code)
- [Quotes](#quotes)
- [Tables](#tables)
- [Layout](#layout)
- [GitHub extras](#github-extras)
- [Pitfalls](#pitfalls)

## 1. Text
### 1.1. Headings (CommonMark)
One to six `#` signs followed by a space make a heading. More `#` means a lower level.

Syntax:
```markdown
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6
```
Output examples:
#### Heading 4
##### Heading 5
###### Heading 6

### 1.2. Paragraphs and line breaks (CommonMark)
A blank line starts a new paragraph. A single line break inside a paragraph is joined into one line. To force a line break, end the line with a backslash or two spaces.

Syntax:
```markdown
First paragraph.

Second paragraph, first line\
second line after a forced break.
```
Output:\
First paragraph.

Second paragraph, first line\
second line after a forced break.

### 1.3. Italic, bold and both (CommonMark)
One asterisk makes *italic*, two make **bold**, three make ***both***.

### TO BE CHECKED 1.4. Strikethrough
Two tildes on each side cross text out.\
Example:\
~~no longer true~~

### 1.5. Inline code (CommonMark)
Backticks around text show it as code without formatting.

Syntax:
```markdown
Run `python src/clean.py` first.
```
Output:\
Run `python src/clean.py` first.

### 1.6. Escaping a character (CommonMark)

A backslash in front of a special character shows it as plain text.

Syntax:
```markdown
\*not italic\*
```
Output:\
\*not italic\*
