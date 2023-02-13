"set hlsearch
set incsearch

set tabstop=2
set shiftwidth=2
" set expandtab " vimwiki doesn't correctly copy indentation of spaces unless expand is on...
set copyindent " copy the previous indentation on autoindenting
set autoindent " always set autoindenting on

set number relativenumber
set backspace=indent,eol,start
set nocompatible
filetype plugin on
" filetype plugin indent off
syntax enable
" let black be black
"let g:dracula_colorterm = 0
"packadd! dracula
"colorscheme dracula

" gitgutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
" let g:gitgutter_sign_removed = '-'
highlight GitGutterChangeDelete ctermfg=4
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)


" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

let mapleader=";"
map - <leader>
set showcmd " show incomplete leader commands
"nmap q <leader>ww
"nmap s <leader>t+
" execute on \\
nnoremap <leader><leader> :!"%:p"<Enter>
nnoremap <leader>q :q<Enter>
nnoremap <leader>w :w<Enter>
nnoremap <leader>ww :w<Enter>
nnoremap <leader>wq :wq<Enter>


" 'untab' shortcut, now ignored/overridden by supertab...
inoremap <S-Tab> <C-D>
" save file https://vi.stackexchange.com/questions/8895/how-to-map-a-shortcut-for-saving-the-file/8897
inoremap <C-S> <Esc>:update<CR>gi

" disable ex mode (ZZ and ZQ still work for closing)
nnoremap Q <nop>

" tabline and tab navigation
nnoremap t0 :tabfirst<CR>
nnoremap t$ :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap TT :tabclose<CR>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>
nnoremap <C-P> :! pdfreport %<CR>
nnoremap <C-O> :! open %
let g:airline#extensions#tabline#enabled = 1
" show tab number instead of number of splits inside tab
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1

