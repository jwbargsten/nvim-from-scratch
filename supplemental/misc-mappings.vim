noremap g[ g]
map g] g<C-]>
nnoremap vi :set invpaste<CR>
nnoremap vm :make!<CR>
nnoremap vw :set invwrap<CR>
nnoremap vt :make! test<CR>
nnoremap vl :BufExplorer<CR>

nnoremap vs :nohlsearch<CR>
nnoremap vD :Glcd<CR>
nmap vP :NERDTreeToggle<CR>
nmap vp :NERDTreeFind<CR>
nnoremap vh :set invlist<CR>
noremap v_ :Gcommit<CR>
noremap v- :Gstatus<CR>
noremap v= :Gwrite<CR>
nnoremap vx :GundoToggle<CR>

nnoremap g! :Ack!<CR>


nnoremap <silent> gb <C-^>

nnoremap _ <Nop>
nnoremap _fi :set foldmethod=indent<CR>
nnoremap _fs :set foldmethod=syntax<CR>
nnoremap _fm :set foldmethod=marker<CR>
nnoremap _fe :set foldmethod=expr<CR>

nnoremap _l :lwindow<CR>
nnoremap _L :ll<CR>
nnoremap _n :lnext<CR>
nnoremap _N :lprev<CR>

nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap _c :cwindow<CR>
nnoremap _C :cc<CR>

" For all text files set 'textwidth' to 87 characters.
autocmd FileType text setlocal textwidth=87

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

let NERDTreeWinSize = 41
let NERDTreeHijackNetrw = 1
let g:gundo_prefer_python3 = 1

autocmd filetype *commit* set spell
