" BASIC CONFIG
set nocompatible             " not compatible with plain vi
set hidden                   " hide buffers without saving them
let mapleader="\<Space>"     " map leader key to space
set history=1000             " remember more commands
set wildmenu                 " display tab completions as a menu
set cursorline               " highlight current line
set encoding=UTF-8           " use UTF-8
set scrolloff=4              " vertical scroll offset
set sidescrolloff=5          " horizonal scroll offset
" set backspace=indent,eol,start " make backspace work like other editors
set viminfo+=n~/.vim/viminfo " move .viminfo file to .vim dir
set mouse=n                  " use the mouse in normal mode
set clipboard=unnamed        " use system clipboard by default
set ttyfast                  " faster redrawing


" ----------------------------

" GUI SETTINGS
set gfn=AnonymiceNerdFontComplete-:h18

" ----------------------------

" BACKUP, SWAP AND UNDO
set swapfile                       " enable swapfiles
set directory^=$HOME/.vim/swap//   " save swapfiles to single location
set writebackup                    " protect against crash-during write
set nobackup                       " but do not persist backup after successful write
set backupcopy=auto                " use rename-and-write-new method whenever safe
set backupdir^=$HOME/.vim/backup// " set backup files to single location
set undofile                       " persistend undo
set undodir^=$HOME/.vim/undo//     " save undo files to single location
set undolevels=1000                " levels of undo to save

" ----------------------------

" PLUG
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'
Plug 'itchyny/lightline.vim'
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'sheerun/vim-polyglot'
Plug 'takac/vim-hardtime'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'TaDaa/vimade'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ryanoasis/vim-devicons'
" Plug 'terryma/vim-multiple-cursors'
Plug 'hecal3/vim-leader-guide'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'kristijanhusak/deoplete-phpactor'
endif
Plug 'kristijanhusak/deoplete-phpactor'

call plug#end()

" ----------------------------

" EDITING

" <space>-w to save
nnoremap <leader>w :w<cr>

" ----------------------------

" TAGS

" set tags+=.git/tags    " search in .git for a tags file if not in root
" <space>-ct to create tags file in .git
" Do not index .git or sql files
" nnoremap <leader>ct :!ctags -Rf .git/tags --tag-relative --extras=+f --exclude=.git --languages=-sql<cr><cr>
let g:gutentags_cache_dir=expand('$HOME/.vim/tags/')
" ----------------------------

" FOLDING
set foldenable          " enable folding
set foldlevelstart=0   " open most folds by default
set foldnestmax=10      " 10 nested fold max
:autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
" nnoremap <space> za     " space open/closes folds

" ----------------------------

" TABS & SPACES
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " > indents same as tab width
set expandtab       " tabs are spaces
set shiftround " round indentation to multiples of 'shiftwidth'


" ----------------------------

" INDENTATION
" filetype indent on
set wrap
set linebreak

set breakindent
set breakindentopt=sbr
set showbreak=↪\  

" Toggle wrapping with Wrap and Nowrap
command! -nargs=* Wrap set wrap linebreak breakindent showbreak=↪\  breakindentopt=sbr
command! -nargs=* Nowrap set nowrap nolinebreak nobreakindent

" ----------------------------

" SEARCHING
set hlsearch    " highlight search
set incsearch   " incremental search
set ignorecase  " search ignores case
set smartcase   " unless it contain a capital letter

" ----------------------------

" SCROLLING AND LINE NUMBERS

set sidescroll=1          " horizontal scrolling
set number relativenumber " hybrid line numbers

" toggle relative and absolute line numbers
" when changing buffers or in insert mode
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" ----------------------------

" COLORS
set laststatus=2
set background=dark
colorscheme onedark

" ----------------------------

" SPLITS
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ----------------------------

" AUTOCOMPLETE
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}
let g:deoplete#sources.php = ['omni', 'phpactor', 'buffer']

" ----------------------------

" LIGHTLINE

let g:lightline = { 'colorscheme': 'onedark' }
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = { 'right': [['lineinfo'], ['percent'], ['fileencoding', 'filetype'], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

" ----------------------------

" COMMANDS

" Toggle FZF
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>f :Find<CR>
" Add a :Find command that searches files with FZF and ripgrep
" via https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Toggle NerdTree
map <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinSize=30
let NERDTreeBookmarksFile='$HOME/.local/NERDTreeBookmarks'  " where to save bookmarks file
let NERDTreeIgnore=['^\.idea$[[dir]]', '^\.git$[[dir]]']    " ignore .git and .idea directories
let NERDTreeMouseMode=2                                     " single click folders, double click files
let NERDTreeShowHidden=1                                    " show hidden files by default

nmap <F8> :TagbarToggle<CR>
nnoremap <F5> :UndotreeToggle<cr>

" Enable HardTime by default
" This can go away when I'm better at vim motion
let g:hardtime_default_on=1

" Leader guide configuration.
let g:lmap =  {}
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

let g:lmap.k = {
      \'name': 'PhpActor',
      \'b': ['call phpactor#ClassExpand()', 'ExpandClass'],
      \'c': ['call phpactor#CopyFile()', 'Copy file'],
      \'d': ['call phpactor#GotoDefinition()', 'Go to definition'],
      \'e': ['call phpactor#mxtractMethod()', 'Extract method'],
      \'f': ['call phpactor#FindReferences()', 'Find references'],
      \'k': ['call phpactor#ContextMenu()', 'Menu'],
      \'h': ['call phpactor#Hover()', 'Hover'],
      \'i': ['call phpactor#ClassInflect()', 'Inflect'],
      \'l': ['call phpactor#ClassNew()', 'New class'],
      \'m': ['call phpactor#MoveFile()', 'Move file'],
      \'n': ['call phpactor#Navigate()', 'Navigate'],
      \'t': ['call phpactor#Transform()', 'Transform/Complete'],
      \'u': ['call phpactor#UseAdd()', 'UseAdd'],
      \}

let g:ale_linters = {
\   'php': ['php'],
\}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'
