**IN & OUT OF VIM:**

`ZZ` = Save file if modified and quit. Same as `:x`  
`ZQ` = Quit without saving. Same as `:q!`

**WORKING WITH THE SHELL:**

`C-z` = Drop to shell. Type `fg` to return to vim  
`:sh` = Drop to shell. Type `exit` to return to vim  
`:!ctags -R` = (Re)generate the tags file for current directory  
`:!wc %` = Count words in current file  
`:!rot13` = Encode selected text with ROT13. Same as `g?`  
`:!php -l %` = Check syntax of current PHP file  
`:r !date` = Insert current date  
`:r !cal` = Insert calendar  
`:r !ls` = Insert directory listing  
`:!!` = Reexecute last shell command  

**SEARCHING & INDENTING:**

`:%s/A/B/gc` = Search for A, replace with B. With confirmation  
`*`, `#` = Search for word under cursor  
`/`, `?` = Search for text  
`%` = Find matching bracket  
`==` = Reindent current line  
`=` = Format selected block  
`=%` = Format block to matching bracket  
`>>`, `<<` = Indent and unindent current line  
`C-U`, `C-D` = Scroll half screen up / down

**BLOCK FOLDING:**

`zo` = Open current fold  
`zc` = Close current fold  
`za` = Toggle current fold  
`zm` = Collapse all folds  
`zr` = Expand all folds  

**TEXT DIFFS:**

Open vim in *diff mode* with `vimdiff` or `vim -d`, they are equivalent.

`do` = Diff obtain changes from other window  
`dp` = Diff put changes into the other window  
`]c` = Next difference  
`[c` = Previous difference  
`C-W + w` = Switch to the other split window. Same as C-W + C-W  
`:diffu` = Update or recalculate diff  
`:syntax off` = Disable syntax highlighting  

**COMFORT:**

`C-C` = Enter normal mode  
`C-N`, `C-P` = Trigger and navigate autocomplete  
`C-]` = Go to tag definition for tag under cursor  
`gf` = Open file under cursor  
`zz` = Scroll to focus on current line  
`cc` = Change line  
`ciw` = Change inside word  
`ciX` = Change inside X. X can be (, {, ", etc  
`C` = Change from cursor to EOL  
`H`, `M`, `L` = Jump to top, middle or bottom of screen

`gcc` = Comment out line  
`gc` = Comment out selection or movement  
`cs"'` = Change surrounding " to ' (or other strings)  
`ds"` = Delete surrounding " (or other string)