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
