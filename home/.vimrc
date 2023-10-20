set nocompatible
let mapleader="-"
nmap <space> -

" APPEARANCE
syntax enable
colorscheme torte
filetype plugin on
" show tabs (→)
set listchars=tab:›\ ,trail:·
" •
set invlist
hi SpecialKey ctermfg=102
" toggle tab display
noremap <Leader><Tab> :set invlist<CR>
" show line numbers
set number relativenumber
set backspace=indent,eol,start
" gitgutter
set updatetime=100
set signcolumn=number
" let g:gitgutter_sign_removed = '-'
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
" show incomplete leader commands
set showcmd
" open help in new tab
nnoremap <leader>h<space> :tab<space>help<space>
" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
"set hlsearch
set incsearch


" EDITING
filetype indent on
set tabstop=2
set shiftwidth=2
" set expandtab " vimwiki doesn't correctly copy indentation of spaces unless expand is on...
set copyindent " copy the previous indentation on autoindenting
set autoindent " always set autoindenting on

set textwidth=80
" autocmd FileType html set formatoptions-=a
" autocmd FileType html set formatoptions-=t
autocmd FileType markdown set formatoptions-=a
autocmd FileType markdown set formatoptions-=t

set formatoptions+=a " automatically reformat paragraphs on any change...
set formatoptions-=l " ...including lines that are already too long when starting to edit...
set formatoptions-=t " ...but don't auto-wrap any old text...
set formatoptions+=c " ...only comments
set formatoptions+=q " allow 'gq' to format comment lines
set formatoptions+=w " trailing whitespace means paragraph continues

" autoformat entire file
nnoremap g= gg=G

" easymotion
map <Leader> <Plug>(easymotion-prefix)

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

" backspace and delete in normal mode
nnoremap <BS> X<Esc>
nnoremap <Delete> x<Esc>
" delete word
nnoremap <C-BS> <C-w>
inoremap <C-BS> <C-w>

" NAVIGATION

" always leave cursor at the end after paste
nnoremap p gp
" make gm go to middle of *text*
nnoremap gm gM

" Shift+Arrow selection in visual mode
" noremap <Esc>[5~ v<Up>
" noremap <Esc>[6~ v<Down>
" vnoremap <Esc>[5~ <Up>
" vnoremap <Esc>[6~ <Down>
" noremap <S-Left> v<Left>
" noremap <S-Right> v<Right>

" scrolling (Ctrl+key for cursor, Ctrl+Shift+key for just screen)
nnoremap <Esc>[6~ <C-d>z.
nnoremap <Esc>[5~ <C-u>z.
"colemak
nnoremap <C-m> ^
nnoremap <C-n> <C-d>z.
" nnoremap <C-N> <C-e>
nnoremap <C-e> <C-u>z.
" nnoremap <C-E> <C-y>
nnoremap <C-i> $
"qwerty
nnoremap <C-h> ^
nnoremap <C-j> <C-d>z.
nnoremap <C-k> <C-u>z.
nnoremap <C-l> $

nnoremap <leader>w :w<Enter>
nnoremap <leader>W :wq<Enter>
nnoremap <leader>q :q<Enter>
nnoremap <leader>Q :q!<Enter>

" disable ex mode (ZZ and ZQ still work for closing)
" nnoremap Q <nop>
nnoremap Q :q<Enter>
nnoremap <C-q> :q<Enter>
" nnoremap <C-s> :w<Enter>

" alternatively: !./%<Enter>
nnoremap <leader><CR> :!"%:p"<Enter>

" 'untab' shortcut, now ignored/overridden by supertab...
inoremap <S-Tab> <C-D>
" save file https://vi.stackexchange.com/questions/8895/how-to-map-a-shortcut-for-saving-the-file/8897
inoremap <C-S> <Esc>:update<CR>gi

" tabline and tab navigation
nnoremap <leader>t :tabedit<Space>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>
" nnoremap <C-P> :! pdfreport %<CR>
" nnoremap <C-O> :! open %

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

" preview/diff unstaged hunk
nnoremap g<Space> <Plug>(GitGutterPreviewHunk)
nnoremap gp <Plug>(GitGutterPreviewHunk)
nnoremap gP :GitGutterFold<CR>

nnoremap gs <Plug>(GitGutterStageHunk)
" make repeatable
silent! call repeat#set("\<Plug>(GitGutterStageHunk)", -1)
" stage whole file
nnoremap gS :Gwrite<CR>

nnoremap gu <Plug>(GitGutterUndoHunk)
" actual git checkout --reset (but in buffer only)
nnoremap gU :Gread<CR>
" unstage whole file
nnoremap gr :Git restore --staged %<CR>

" auto-hide preview on cursor move:
" https://github.com/airblade/vim-gitgutter/issues/369#issuecomment-602464330
au CursorMoved * if !gitgutter#hunk#in_hunk(line(".")) | pclose | endif

" fugitive
" preview/diff unstaged file
nnoremap gvu :Gvdiffsplit<CR>
" preview/diff staging area
nnoremap gvs :Git diff --staged %<CR>
nnoremap gvS :Git diff --staged<CR>

" nmap gd :GitGutterDiffOrig<CR>
" autocmd FileType fugitiveblame nmap <buffer> q gq

nnoremap <leader>G :Git<CR>
nnoremap <leader>g :Git<Space>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>ga :Git commit --amend<CR>
nnoremap g<Space> :Git<Space>
nnoremap gl :Git log<CR>
nnoremap gL :Git log %<CR>
nnoremap gb :Git blame<CR>

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
Plug 'aymericbeaumet/vim-symlink' " fix fugitive not following symlinks
Plug 'tpope/vim-sleuth' " auto indent detection
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'easymotion/vim-easymotion'

call plug#end()
