call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-eunuch'
Plug 'gasparch/tagbar'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'jwbargsten/ag.nvim'
Plug 'FooSoft/vim-argwrap'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tmhedberg/matchit'
Plug 'jlanzarotta/bufexplorer'
Plug 'sjl/gundo.vim'
Plug 'samoshkin/vim-mergetool'

" COMPLETION
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-cssomni'
Plug 'yuki-ycino/ncm2-dictionary'
Plug 'fgrsnau/ncm2-otherbuf'

" MARKDOWN
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" PYTHON
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'
Plug 'nvie/vim-flake8'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'cespare/vim-toml'

" JAVASCRIPT
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" OTHER
Plug 'jwbargsten/slimux'
call plug#end()
