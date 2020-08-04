scriptencoding utf-8
set encoding=utf-8

let $PATH .= ':/usr/local/bin'

let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1
let g:python_host_prog  = $PYTHON3_HOST_PROG
let g:python3_host_prog = $PYTHON3_HOST_PROG

syntax on

set cmdheight=2 " use 2 liens for the cmd line
set nojoinspaces " only add 1 space after join
set numberwidth=3 " use at least 3 cols for line num
set complete=.,w,b,t " can buffers and tag file for completion items

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable " disable folding

set fileencodings+=default " make sure the fileencodings contains default

set autoindent                  " always set auto-indenting on
set nosmartindent                  " no smartindent
set ttimeoutlen=0 " do not wait for keycode sequences to complete

set history=1000          " keep a lot lines of command history
set ruler               " Show the cursor position all the time
set shada='100,<1000,s1000   " Keep a .viminfo file.
set shada^=h

set mouse= " deactivate mouse stuff

set autowrite "save files before invoking make
set autoread " read file if changed externally
set hidden " allow hidden buffers

set incsearch " incremental search
set hlsearch "highlight matches with last search pattern
set ignorecase
set smartcase
set report=0            " always report # of lines changed from : commands

" indenting
set shiftwidth=2 
set tabstop=2
set expandtab
set softtabstop=2

set showmatch "briefly jump to matching bracket if insert one
set showcmd "show (partial) command in status line

set backspace=indent,eol,start
set linebreak

set nostartofline
set display=lastline    " show as much of the last displayed line as possible

set wildchar=<tab>
set wildmenu
set wildmode=longest:full,full

set noerrorbells
set vb t_vb= " no beeps of any kind
set noinsertmode
set novisualbell

set laststatus=2        " always show the status line
set lazyredraw          " don't redraw during macros
set scrolloff=1         " keep N lines visible when scrolling up/down

set isfname-=\=

set listchars=tab:▹\ ,trail:●,extends:›,precedes:‹,nbsp:⎵
let &sbr = '↳ '
set fillchars=fold:.,vert:\

set nolist
set nomodeline

set conceallevel=2

set shortmess+=c
set completeopt=noinsert,menuone,noselect

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'sjl/gundo.vim'

Plug 'scrooloose/nerdtree'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-eunuch'
Plug 'gasparch/tagbar'
Plug 'godlygeek/tabular'

Plug 'tpope/vim-commentary'
Plug 'tmhedberg/matchit'
Plug 'jlanzarotta/bufexplorer'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'ncm2/ncm2-jedi'
Plug 'SirVer/ultisnips'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-cssomni'
Plug 'fgrsnau/ncm2-otherbuf'
Plug 'mileszs/ack.vim'
call plug#end()

set statusline=%<%f\ %h%m%r%=%-15.(%l,%c%V%)\ %{&paste==1?\"[PASTE]\":\"\"}%y%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+b\":\"\").\",\".&ff.\"]\ \"}\ %{FugitiveStatusline()}\ %P

nmap <Space> <C-W>
map <unique> <silent> <C-W>Q :bd!<CR>
map <unique> <silent> <C-W>q :bd<CR>
map <C-W>+ :resize +10<CR>
map <C-W>- :resize -10<CR>
map <C-W>< :vertical resize -15<CR>
map <C-W>> :vertical resize +15<CR>

nnoremap vf :FZF<CR>
nnoremap vF :FZF -m<CR>
nnoremap vv v
nnoremap vV V
nnoremap V <C-V>
nnoremap v <Nop>

nmap s  <Plug>ReplaceWithRegisterOperator
nmap ss <Plug>ReplaceWithRegisterLine
xmap s  <Plug>ReplaceWithRegisterVisual
nnoremap s <Nop>

set undodir=$HOME/.cache/nvim/undofiles
set undofile

if !isdirectory(fnamemodify($HOME."/.cache/nvim/backupfiles", ":p"))
  call mkdir(fnamemodify($HOME."/.cache/nvim/backupfiles", ":p"), "p")
endif

autocmd BufWritePre * let &backupext = substitute(expand('%:p:h'), '/', '%', 'g')

set backup


nnoremap vx :GundoToggle<CR>
nnoremap <silent> gb <C-^>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
set completeopt=noinsert,menuone,noselect
autocmd BufEnter * call ncm2#enable_for_buffer()
call ncm2#override_source('bufword', {'priority': 7})

let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsSnippetsDir=$HOME.'/.config/nvim/ultisnips'
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-s-z>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

let g:ackprg = 'rg --vimgrep --smart-case'
let g:ack_use_cword_for_empty_search = 1

command Ak ":Ack!"
command -nargs=* Ak :call ack#Ack('grep!', <q-args>)


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
