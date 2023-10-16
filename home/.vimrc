set nocompatible
let mapleader="-"

" APPEARANCE
syntax enable
colorscheme torte
" let black be black
"let g:dracula_colorterm = 0
"packadd! dracula
"colorscheme dracula

" show tabs (→)
set listchars=tab:›\ ,trail:·
" •
set invlist
" toggle tab display
noremap <Leader><Tab> :set invlist<CR>
" show line numbers
set number relativenumber
set backspace=indent,eol,start
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
" airline
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
:nnoremap ve :tabedit $MYVIMRC<cr>
:nnoremap vs :source $MYVIMRC<cr>


" DEVELOPING
" watch out for overrides of 
" https://vimdoc.sourceforge.net/htmldoc/vimindex.html#g

" gitgutter hunk navigation and staging
" TODO figure out how to make repeatble with https://github.com/tpope/vim-repeat
nnoremap gn <Plug>(GitGutterNextHunk)z.
nnoremap ge <Plug>(GitGutterPrevHunk)z.
" last hunk in file
nnoremap gN G<Plug>(GitGutterPrevHunk)z.
" first hunk in file
nnoremap gE gg<Plug>(GitGutterNextHunk)z.
nnoremap gG gg<Plug>(GitGutterNextHunk)z.
" QWERTY
nnoremap gj <Plug>(GitGutterNextHunk)z.
nnoremap gk <Plug>(GitGutterPrevHunk)z.
nnoremap gJ G<Plug>(GitGutterPrevHunk)z.
nnoremap gK gg<Plug>(GitGutterNextHunk)z.

nnoremap gs <Plug>(GitGutterStageHunk)
" make repeatable
silent! call repeat#set("\<Plug>(GitGutterStageHunk)", -1)
nnoremap gu <Plug>(GitGutterUndoHunk)
nnoremap gp <Plug>(GitGutterPreviewHunk)
nnoremap g<Space> <Plug>(GitGutterPreviewHunk)
" stage whole file
nnoremap gS :Gwrite<CR>
" unstage whole file
nnoremap gU :Git reset %<CR>
" actual git checkout --reset
nnoremap gR :Gread<CR>

" auto-hide preview on cursor move 
" https://github.com/airblade/vim-gitgutter/issues/369#issuecomment-602464330
au CursorMoved * if !gitgutter#hunk#in_hunk(line(".")) | pclose | endif

" nmap gd :GitGutterDiffOrig<CR>
" autocmd FileType fugitiveblame nmap <buffer> q gq

" fugitive
nnoremap <leader>G :Git<CR>
nnoremap <leader>g :Git<Space>
nnoremap <leader>g<Space> :Git<Space>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gb :Git blame<CR>
" stage/unstage file
nnoremap <leader>ga :Git add %<CR>
nnoremap <leader>gr :Git reset %<CR>

" eclim
nnoremap <Leader>a<CR> :Ant<CR>
nnoremap <Leader>aa :Ant<CR>
nnoremap <Leader>a<Space> :Ant<Space>
nnoremap <Leader>ac :Ant compile<CR>
nnoremap <Leader>ai :Ant install<CR>
nnoremap <Leader>ad :Ant dist-slim<CR>
nnoremap <Leader><Leader>c :JavaClasspath<CR>
nnoremap <Leader><Leader>f :JavaFormat<CR>
nnoremap <Leader><Leader>g :JavaSearch -x declarations<CR>
nnoremap <Leader><Leader>i :JavaImport<CR>
nnoremap <Leader><Leader>o :JavaImportOrganize<CR>
nnoremap <Leader><Leader>v :Validate<CR>

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


" PLUGINS
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth' " auto indent detection
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'easymotion/vim-easymotion'

call plug#end()
