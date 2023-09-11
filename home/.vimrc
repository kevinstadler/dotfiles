set nocompatible
let mapleader="-"

" DISPLAY
syntax enable
colorscheme torte
" let black be black
"let g:dracula_colorterm = 0
"packadd! dracula
"colorscheme dracula

" show tabs (→)
set listchars=tab:›\ ,trail:•
set invlist
" toggle tab display
noremap <Leader><Tab> :set invlist<CR>
set number relativenumber
set backspace=indent,eol,start
filetype plugin on
filetype plugin indent on


" INTERACTION
set showcmd " show incomplete leader commands
"set hlsearch
set incsearch


" EDITING
set tabstop=2
set shiftwidth=2
" set expandtab " vimwiki doesn't correctly copy indentation of spaces unless expand is on...
set copyindent " copy the previous indentation on autoindenting
set autoindent " always set autoindenting on

set textwidth=80
set formatoptions-=lo " also break lines that are already too long, but don't add when adding 'o'
set formatoptions+=a/w " reformat paragraph on any change, but don't extend 1-line comments, and trailing whitespace means paragraph continues

" COLEMAK
" https://www.reddit.com/r/Colemak/comments/j98ds1/an_example_of_vim_key_remapping/
" Colemak mnei(hjkl) t(i) <C-n>(f) <C-e>(e)
noremap m h|        "move Left
noremap n gj|       "move Down
noremap e gk|       "move Up
noremap i l|        "move Right
noremap t i|        "(t)ype           replaces (i)nsert
noremap T I|        "(T)ype at bol    replaces (I)nsert
noremap E e|        "end of word      replaces (e)nd
noremap h n|        "next match       replaces (n)ext
noremap H N|        "previous match   replaces (N) prev
" make easymotion match the new mnei(hjkl) motions
map <Leader>m <Plug>(easymotion-linebackward)
map <leader>n <Plug>(easymotion-j)
map <leader>e <Plug>(easymotion-k)
map <Leader>i <Plug>(easymotion-lineforward)
" below: not remapping, just fixing sequences:
" fix (i)nner and (t)ill, e.g. (c)hange (i)n (w)ord
nnoremap ci ci|
nnoremap di di|
nnoremap vi vi|
nnoremap yi yi|
nnoremap ct ct|
nnoremap dt dt|
nnoremap vt vt|
nnoremap yt yt|

" MY NAV
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
" nnoremap t0 :tabfirst<CR>
" nnoremap t$ :tablast<CR>
" nnoremap tt :tabedit<Space>
nnoremap <leader>t :tabedit<Space>
nnoremap <leader>f :tabedit<Space>
nnoremap TT :tabclose<CR>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>
nnoremap <C-P> :! pdfreport %<CR>
nnoremap <C-O> :! open %

" edit/source .vimrc
:nnoremap <leader>ev :tabedit $MYVIMRC<cr>
:nnoremap <leader>iv :source $MYVIMRC<cr>

" gitgutter
set signcolumn=number
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
" let g:gitgutter_sign_removed = '-'
highlight GitGutterChangeDelete ctermfg=4
highlight DiffAdd ctermfg=2 ctermbg=NONE
highlight DiffChange ctermfg=3 ctermbg=NONE
highlight DiffDelete ctermfg=1 ctermbg=NONE
highlight DiffText ctermfg=3 ctermbg=NONE


" watch out for overrides of 
" https://vimdoc.sourceforge.net/htmldoc/vimindex.html#g
nnoremap gj <Plug>(GitGutterNextHunk)
nnoremap gn <Plug>(GitGutterNextHunk)
nnoremap gk <Plug>(GitGutterPrevHunk)
nnoremap ge <Plug>(GitGutterPrevHunk)
nnoremap ghs <Plug>(GitGutterStageHunk)
nnoremap ghu <Plug>(GitGutterUndoHunk)
nnoremap ghd <Plug>(GitGutterPreviewHunk)
nnoremap ghp <Plug>(GitGutterPreviewHunk)
" nmap gd :GitGutterDiffOrig<CR>
" autocmd FileType fugitiveblame nmap <buffer> q gq

" fugitive
nnoremap <leader>g :Git<Space>
nnoremap <leader>g<Space> :Git<Space>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gs :Git<CR>

" eclim
nnoremap <Leader>na :Ant<Space>
nnoremap <Leader>na<Space> :Ant<Space>
nnoremap <Leader>naa :Ant<CR>
nnoremap <Leader>nc :JavaClasspath<CR>
nnoremap <Leader>nf :JavaFormat<CR>
nnoremap <Leader>ng :JavaSearch -x declarations<CR>
nnoremap <Leader>ni :JavaImport<CR>
nnoremap <Leader>no :JavaImportOrganize<CR>
nnoremap <Leader>nv :Validate<CR>

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'easymotion/vim-easymotion'

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

let g:airline_theme='dark_minimal'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
" show tab number instead of number of splits inside tab
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_y = '' " hide encoding
let g:airline_symbols = {}
let g:airline_symbols.modified = '*'
" let g:airline_symbols.linenr = ' '
let g:airline_section_z = '%l/%L:%v (%p%%)'


