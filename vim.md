# Vim tips

## Help

Search help for word under cursor: `K`

Search help for pattern: `:helpg PATTERN`

Follow help link: `CTRL-]`

Go back from help link: `CTRL-T`

## In and out

Save and quit: `ZZ` or `:x`

Quit without saving: `ZQ` or `:q!`

## Jump around

Jump to top / middle / bottom of screen: `H` / `M` / `L`

Jump to matching bracket: `%`

Jump to block start: `[{`

Jump to block end: `]}`

Go to definition: `CTRL-]`

Go back from definition: `CTRL-T`

Jump to older position: `CTRL-O`

Jump to newer position: `CTRL-I`

Jump to next / previous paragraph: `}` / `{`

Jump to next / previous sentence: `)` / `(`

Scroll half page: `CTRL-D` (down) or `CTRL-U` (up)

Scroll full page: `CTRL-F` (down) or `CTRL-B` (up)

Bring current line to focus: `zz`

Open file under cursor: `gf`

## Searching

Search for word under cursor: `*` or `#` (backward)

Search for custom text: `/` or `?` (backward)

Repeat last search: `//`

Search for A, replace with B (with confirmation, case-insensitive): `:%s/A/B/gci`

Search all files for A: `:grep A` or `:Ack A`

Search for files: `CTRL-P`

## Editing

Join lines: `J`

Change line: `cc`

Change from cursor to EOL: `C`

Change word: `cw` (from start) or `ciw` (from anywhere)

Change inside delimiters: `ci(`

Delete word: `dw` or `diw`

Comment out line: `gcc`

Comment out selection or movement: `gc`

Change surrounding " to ': `cs"'`

Delete surrounding ": `ds"`

Trigger and cycle autocomplete: `CTRL-N` or `CTRL-P`

Select word: `viw`

Select word and paste: `viwp`

Select line: `V`

Selection to lowercase: `u`

Selection to uppercase: `U`

Selection to inverted case: `~`

Yank word: `yiw`

Cycle between current file and previous file: `CTRL-^` or `:b#`

Find and edit some file under ./src: `:find src/**/somefile`

## Format

Reindent current line: `==`

Reindent selection: `=`

Reindent block to matching bracket: `=%`

Reindent current block: `=i{`

Change indent of line: `>>` or `<<`

## Shell work

Drop to shell: `CTRL-Z`. Return to Vim: `fg`

Drop to shell: `:sh`. Return to Vim: `exit`

Regenerate tags file: `:!ctags -R`

Count lines, words, bytes of current file: `:!wc %`

ROT13 encode current line: `g??`

ROT13 encode selection: `g?` or `:!rot13`

Insert current date: `:r !date`

Insert calendar: `:r !cal`

Insert directory listing: `:r !ls`

Lint current PHP file: `:!php -l %`

Re-execute last shell command: `:!!`

Re-execute last Ex command: `@:`

## Block folds

`zo` = Open current fold

`zc` = Close current fold

`za` = Toggle current fold

`zm` = Collapse all folds

`zr` = Expand all folds

## Text diffs

Open Vim in diff mode: `vimdiff` or `vim -d`

`do` = Diff obtain changes from other window

`dp` = Diff put changes into the other window

`]c` = Next difference

`[c` = Previous difference

`CTRL-w + w` = Switch to the other split window. Same as CTRL-W + CTRL-W

`:diffu` = Update or recalculate diff

`:syntax off` = Disable syntax highlighting
