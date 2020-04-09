" FUNCTION TO SOURCE FILE IF IT EXISTS
function! SourceIfExists(file)
    if filereadable(expand(a:file))
        exe 'source' a:file
    endif
endfunction

" BASIC CONFIG
set nocompatible             " not compatible with plain vi
set hidden                   " hide buffers without saving them
let mapleader="\<Space>"     " map leader key to space
set history=1000             " remember more commands
set wildmenu                 " display tab completions as a menu
set cursorline               " highlight current line
set encoding=UTF-8           " use UTF-8
set scrolloff=4              " vertical scroll offset
set sidescrolloff=5          " horizontal scroll offset
set backspace=indent,eol,start " make backspace work like other editors
set viminfo+=n~/.vim/viminfo " move .viminfo file to .vim dir
set mouse=n                  " use the mouse in normal mode
set ttyfast                  " faster redrawing

" ----------------------------

" GUI SETTINGS
set guifont=AnonymicePowerline\ Nerd\ Font:h18

" ----------------------------

" BACKUP, SWAP AND UNDO
set swapfile                       " enable swapfiles
set directory^=$HOME/.vim/swap//   " save swapfiles to single location
set writebackup                    " protect against crash-during write
set nobackup                       " but do not persist backup after successful write
set backupcopy=auto                " use rename-and-write-new method whenever safe
set backupdir^=$HOME/.vim/backup// " set backup files to single location
set undofile                       " persist undo
set undodir^=$HOME/.vim/undo//     " save undo files to single location
set undolevels=1000                " levels of undo to save

" ----------------------------

" PLUG
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'
Plug 'itchyny/lightline.vim'
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'TaDaa/vimade'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'hecal3/vim-leader-guide'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug '907th/vim-auto-save'
Plug 'editorconfig/editorconfig-vim'
Plug 'amiorin/vim-project'
Plug 'justinmk/vim-sneak'
Plug 'kshenoy/vim-signature'
call plug#end()

" ----------------------------

" EDITING

" <space>-w to save
nnoremap <leader>w :w<cr>

" enable and disable spelling
nmap <silent> <leader>s :set spell!<CR>

" auto-save
let g:auto_save = 1         " enable by default
let g:auto_save_silent = 1  " do not display the auto-save notification

" ----------------------------

" Jump back to last edited buffer
nnoremap <C-b> <C-^>
inoremap <C-b> <esc><C-^>

" ----------------------------

" TAGS

" set tags+=.git/tags    " search in .git for a tags file if not in root
" <space>-ct to create tags file in .git
" Do not index .git or sql files
" nnoremap <leader>ct :!ctags -Rf .git/tags --tag-relative --extras=+f --exclude=.git --languages=-sql<cr><cr>
let g:gutentags_cache_dir=expand('$HOME/.vim/tags/')
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml', '*.phar', '*.ini', '*.rst', '*.md', '*vendor/*/test*', '*vendor/*/Test*', '*vendor/*/fixture*', '*vendor/*/Fixture*', '*var/cache*', '*var/log*']
" ----------------------------

" FOLDING
set foldenable          " enable folding
set foldlevelstart=0   " open most folds by default
set foldnestmax=10      " 10 nested fold max
:autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

" ----------------------------

" TABS & SPACES
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " > indents same as tab width
set expandtab       " tabs are spaces
set shiftround " round indentation to multiples of 'shiftwidth'


" ----------------------------

" INDENTATION
" file type indent on
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

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" No longer need to show the mode since it is displayed with LightLine
set noshowmode

" ----------------------------

"Jump back to last edited buffer
nnoremap <C-b> <C-^>
inoremap <C-b> <esc><C-^>

" ----------------------------

" COMMANDS

" Toggle FZF
nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Tags<CR>
nmap <Leader>r :Find<CR>
" Add a :Find command that searches files with FZF and ripgrep
" via https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Toggle NerdTree
" map <silent> <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinSize=30
let NERDTreeBookmarksFile='$HOME/.local/NERDTreeBookmarks'  " where to save bookmarks file
let NERDTreeIgnore=['^\.idea$[[dir]]', '^\.git$[[dir]]']    " ignore .git and .idea directories
let NERDTreeMouseMode=2                                     " single click folders, double click files
let NERDTreeShowHidden=1                                    " show hidden files by default

nmap <F8> :TagbarToggle<CR>
nnoremap <F5> :UndotreeToggle<cr>

" Leader guide configuration.
let g:lmap =  {}
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

let g:lmap.s = ['set spell!', 'Spellcheck Toggle']
let g:lmap.n = ['NERDTreeToggle', 'NERDTree Toggle']
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
let g:lmap.f = { 'name' : 'File Menu' }
let g:lmap.o = { 'name' : 'Open Stuff' }
" Provide commands and descriptions for existing mappings
nmap <silent> <leader>fd :e $MYVIMRC<CR>
let g:lmap.f.d = ['e $MYVIMRC', 'Open vimrc']

nmap <silent> <leader>fs :so %<CR>
let g:lmap.f.s = ['so %', 'Source file']

nmap <silent> <leader>fm :set filetype=markdown<CR>
let g:lmap.f.m = ['set filetype=markdown', 'Markdown syntax']

nmap <silent> <leader>oo  :copen<CR>
let g:lmap.o.o = ['copen', 'Open quickfix']

nmap <silent> <leader>ol  :lopen<CR>
let g:lmap.o.l = ['lopen', 'Open" locationlist']

" Create new menus not based on
" existing mappings:
let g:lmap.g = {
            \'name' : 'Git Menu',
            \'s' : ['Gstatus', 'Git Status'],
            \'p' : ['Gpull', 'Git Pull'],
            \'u' : ['Gpush', 'Git Push'],
            \'c' : ['Gcommit', 'Git Commit'],
            \'d' : ['Gdiff', 'Git Diff'],
            \'w' : ['Gwrite', 'Git Write'],
            \'h' : {'name': 'Git Hunks',
                \'p': ['GitGutterPreviewHunk', 'Preview'],
                \'s': ['GitGutterStageHunk', 'Stage'],
                \'u': ['GitGutterUndoHunk', 'UNstage'],
            \}
            \}

let g:gitgutter_map_keys = 0


function! s:my_displayfunc()
    let g:leaderGuide#displayname =
                \ substitute(g:leaderGuide#displayname, '\c<cr>$', '', '')
    let g:leaderGuide#displayname =
                \ substitute(g:leaderGuide#displayname, '^<Plug>', '', '')
endfunction

let g:leaderGuide_displayfunc = [function("s:my_displayfunc")]
let g:ale_linters = {
\   'php': ['php'],
\}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'

" set phpactor to do autocomplete for OmniComplete
autocmd FileType php setlocal omnifunc=phpactor#Complete
autocmd CompleteDone * pclose

" Delete Fugitive buffers on leaving them
autocmd BufReadPost fugitive://* set bufhidden=delete

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" ignore EditorConfig in fugitive windows
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Source local .vimrc if it exists
call SourceIfExists("~/.vimrc.local")
