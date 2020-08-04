# nvim-from-scratch

Steps to create a basic neovim config from scratch

Make your life easier: `ESC` -> `CAPSLOCK` 😁

## Step 1: setup Python and wrap vim cmd

* `brew install neovim ripgrep`

* setup virtualenv
  ```sh
  python3 -m venv $HOME/.venv
  source "$HOME/.venv/bin/activate"
  rehash
  pip install --upgrade pip
  pip install pynvim
  ```

## Step 2: boilerplate & basic config

* `./supplemental/02_boilerplate.vim`
* <https://github.com/junegunn/vim-plug>
* <https://github.com/junegunn/fzf.vim>
* <https://github.com/tpope/vim-fugitive>
* `tpope/vim-sensible`

## Step 3: basic mappings

Window navigation
```
nmap <Space> <C-W>
map <unique> <silent> <C-W>Q :bd!<CR>
map <unique> <silent> <C-W>q :bd<CR>
map <C-W>+ :resize +10<CR>
map <C-W>- :resize -10<CR>
map <C-W>< :vertical resize -15<CR>
map <C-W>> :vertical resize +15<CR>
```


fzf
```
nnoremap vf :FZF<CR>
nnoremap vF :FZF -m<CR>

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
```


statusline
```
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %{&paste==1?\"[PASTE]\":\"\"}%y%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+b\":\"\").\",\".&ff.\"]\ \"}\ %{FugitiveStatusline()}\ %P
```

clear out `v`
```
nnoremap vv v
nnoremap vV V
nnoremap V <C-V>
nnoremap v <Nop>
```

inner and outer text object selection
```
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
nmap s  <Plug>ReplaceWithRegisterOperator
nmap ss <Plug>ReplaceWithRegisterLine
xmap s  <Plug>ReplaceWithRegisterVisual
nnoremap s <Nop>
```

## Step 4: undo and backup

`./supplemental/02_backup-undo-setup.vim`

## Step 4: my plugins

```
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-eunuch'
Plug 'gasparch/tagbar'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'inkarkat/vim-ReplaceWithRegister'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tmhedberg/matchit'
Plug 'jlanzarotta/bufexplorer'
Plug 'sjl/gundo.vim'
Plug 'samoshkin/vim-mergetool'
```

## Step 5: completion & snippets

Plugins
```
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
Plug 'ncm2/ncm2-cssomni'
Plug 'yuki-ycino/ncm2-dictionary'
Plug 'fgrsnau/ncm2-otherbuf'
```

mappings
```
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
```


## Step 6: grep

```
"https://www.freecodecamp.org/news/how-to-search-project-wide-vim-ripgrep-ack/
Plug 'mileszs/ack.vim'
```
```
let g:ackprg = 'rg --vimgrep --smart-case'
let g:ack_use_cword_for_empty_search = 1
command Ak ":Ack!"
command -nargs=* Ak :call ack#Ack('grep!', <q-args>)
```

## if there is time

* startuptime
* lua interface
* python interface

## Outlook

* <https://github.com/neoclide/coc.nvim>

## Resources

* [basic neovim plugins](https://donniewest.com/a-guide-to-basic-neovim-plugins/)
* [vim awesome](https://vimawesome.com/)
