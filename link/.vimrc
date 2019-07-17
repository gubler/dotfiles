" BASIC CONFIG
set nocompatible     " not compatible with plain vi
set hidden           " hide buffers without saving them
let mapleader=","    " map leader key to comma
set history=1000     " remember more commands
set wildmenu         " display tab completions as a menu
set cursorline       " highlight current line
set encoding=UTF-8   " use UTF-8
set scrolloff=4      " vertical scroll offset
set sidescrolloff=5  " horizonal scroll offset
set backspace=indent,eol,start " make backspace work like other editors

" ----------------------------

" GUI SETTINGS
set gfn=AnonymiceNerdFontComplete-:h18

" ----------------------------

" BACKUP, SWAP AND UNDO
set directory=$HOME/.vim/swp//    " save swapfiles to single location
set nobackup                      " disable backup files
set undofile                      " persistend undo
set undodir=$HOME/.vim/undodir//  " save undo files to single location
set undolevels=1000               " levels of undo to save

" ----------------------------

" PLUG
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'StanAngeloff/php.vim'
Plug 'takac/vim-hardtime'
Plug 'connorholyday/vim-snazzy'

call plug#end()

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
set showbreak=↪ 

" Toggle wrapping with Wrap and Nowrap
command! -nargs=* Wrap set wrap linebreak breakindent breakindentopt=sbr showbreak=…
command! -nargs=* Nowrap set nowrap nolinebreak nobreakindent

" ----------------------------

" SEARCHING
set hlsearch
set incsearch

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
let g:lightline = { 'colorscheme': 'snazzy' }
set laststatus=2
set background=dark
colorscheme snazzy

" ----------------------------

" SPLITS
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ----------------------------

" don't use arrowkeys
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" really, just don't
" inoremap <Up>    <NOP>
" inoremap <Down>  <NOP>
" inoremap <Left>  <NOP>
" inoremap <Right> <NOP>

" ----------------------------

" AUTOCOMPLETE
" let g:deoplete#enable_at_startup = 1

" ----------------------------

" COMMANDS

" Toggle FZF
nmap <C-t> :Files<CR>
nmap ; :Buffers<CR>

" Toggle NerdTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=20
