npm WARN exec The following package was not found and will be installed: prettier@2.7.1

# Vim tips

Search help for word under cursor: `K`

## Productivity

Search for files: `C-p`

Find in files: `:Ack PATTERN`

Find and replace in file: `:%s/FIND/REPLACE/gc`

Comment out line: `gcc`

Comment out selection or movement: `gc`

Change surrounding " to ': `cs"'`

Delete surrounding ": `ds"`

Cycle between current file and last edited file: `C-^`

Find and edit some file anywhere in ./src: `:e src/**/somefile`

## For your comfort

Jump to top, middle, bottom of screen: `H`, `M`, `L`.

Scroll to focus current line: `zz`.

Trigger and cycle autocomplete: `C-n` or `C-p`.

Go to definition: `C-]`.

Go back after going to definition: `C-t`.

Go to previous position: `C-o`.

Open file under cursor: `gf`.

Change line: `cc`.

Change from cursor to EOL: `C`.

Change word: `ciw`.

Change inside delimiters: `ci(`.

## In and out

Save and quit: `ZZ` or `:x`.

Quit without saving: `ZQ` or `:q!`.

## Search and indent

Search for A, replace with B: `:%s/A/B/gc`.

Search for word under cursor: `*`, `#`.

Search for text: `/` (forth) or `?` (back).

Find matching bracket: `%`.

Reindent current line: `==`.

Reindent selection: `=`.

Format block to matching bracket: `=%`.

Change indent of line: `>>` or `<<`.

Scroll half screen: `C-u` (up) or `C-d` (down).

## Shell work

Drop to shell: `C-z`. Return to Vim: `fg`.

Drop to shell: `:sh`. Return to Vim: `exit`.

Regenerate tags file: `:!ctags -R`.

Count lines, words, bytes of current file: `:!wc %`.

Encode selection with ROT13: `:!rot13` or `g?`.

Insert current date: `:r !date`.

Insert calendar: `:r !cal`.

Insert directory listing: `:r !ls`.

Lint current PHP file: `:!php -l %`.

Re-execute last shell command: `:!!`.

## Block folds

`zo` = Open current fold

`zc` = Close current fold

`za` = Toggle current fold

`zm` = Collapse all folds

`zr` = Expand all folds

## Text diffs

Open Vim in diff mode: `vimdiff` or `vim -d`.

`do` = Diff obtain changes from other window

`dp` = Diff put changes into the other window

`]c` = Next difference

`[c` = Previous difference

`C-w + w` = Switch to the other split window. Same as C-W + C-W

`:diffu` = Update or recalculate diff

`:syntax off` = Disable syntax highlighting
