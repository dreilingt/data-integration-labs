# Markdown Cheat Sheet
*This cheat sheet will keep growing over the semester.*

## Table of contents

- [1. Text](#text)
- [2. Lists](#lists)
- [3. Links and images](#links-and-images)
- [4. Code](#code)
- [5. Quotes](#quotes)
- [6. Tables](#tables)
- [7. Layout](#layout)
- [8. GitHub extras](#github-extras)
- [9. Pitfalls](#pitfalls)

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

<!-- 
Lists: unordered, ordered and nested lists · task lists
Links and images:	inline and reference-style links · a relative link to another file in your repository · a link to a section · an image with alt text · an image that is a link
Code:	fenced code blocks with syntax highlighting for Python, Bash and JSON
Quotes:	blockquotes, nested and with formatting · alerts, like the boxes in this lab
Tables:	a table with aligned columns, and a cell that contains a link or a |
Layout:	horizontal rules · collapsed sections, like the hints in this lab · comments that do not render
GitHub extras:	footnotes · emoji shortcodes · @mentions and references to issues · a Mermaid diagram · a formula
-->

## 9. Pitfalls
1. **Headings:** I wrote `#Heading` without a space and it stayed plain text with a visible `#`.\
   Fix: a space between `#` and the text (`# Heading`).
