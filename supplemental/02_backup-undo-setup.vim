let l:backupdir = $HOME."/.cache/nvim/backupfiles"

if !isdirectory(fnamemodify(l:backupdir, ":p"))
  call mkdir(fnamemodify(l:backupdir, ":p"), "p")
endif

autocmd BufWritePre * let &backupext = substitute(expand('%:p:h'), '/', '%', 'g')

set backup
let &backupdir=l:backupdir


let l:undodir = $HOME. "/.cache/nvim/undofiles"
if !isdirectory(fnamemodify(l:undodir, ":p"))
  call mkdir(fnamemodify(l:undodir, ":p"), "p")
endif

set undofile
let &undodir=l:undodir
