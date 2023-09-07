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
filetype plugin indent on
syntax enable
" let black be black
"let g:dracula_colorterm = 0
"packadd! dracula
"colorscheme dracula

let mapleader=";"
" map - <leader>
set showcmd " show incomplete leader commands
"nmap q <leader>ww
"nmap s <leader>t+
" execute on \\
nnoremap <leader><leader> :!"%:p"<Enter>
nnoremap <leader>q :q<Enter>
nnoremap <leader>Q :q!<Enter>
nnoremap <leader>w :w<Enter>
nnoremap <leader>ww :w<Enter>
nnoremap <leader>wq :wq<Enter>

" alternatively: !./%<Enter>
nnoremap <leader><Space> :!"%:p"<Enter>

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


" gitgutter
set signcolumn=number
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
" let g:gitgutter_sign_removed = '-'
highlight GitGutterChangeDelete ctermfg=4
nmap gj <Plug>(GitGutterNextHunk)
nmap gk <Plug>(GitGutterPrevHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" nmap gd :GitGutterDiffOrig<CR>

nnoremap <leader>gg :Git<CR>

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
call plug#end()






" CoC: https://github.com/neoclide/coc.nvim#example-vim-configuration
" " Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" To make coc.nvim format your code on <cr>:
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <leader>do <Plug>(coc-codeaction)





" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

let g:airline#extensions#tabline#enabled = 1
" show tab number instead of number of splits inside tab
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#branch#enabled = 1


