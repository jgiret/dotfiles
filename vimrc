set nocompatible              " required
filetype off                  " required

:let mapleader = ","

let g:powerline_pycmd = 'python3'

" set the runtime path to include Vundle and initialize
set rtp+=~/.local/share/nvim/site/autoload/plug.vim
" add fzf in runtime path
set rtp+=~/.fzf
call plug#begin('~/.local/share/nvim/plugged')

if !has('nvim')
  Plug 'tpope/vim-sensible'
endif

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'

" Plug to fold code blocks
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'hdima/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jeetsukumaran/vim-pythonsense'

" snippets
" Plug 'SirVer/ultisnips'
 " Plug 'honza/vim-snippets'
" let g:neosnippet#snippets_directory="~/.local/share/nvim/plugged/vim-snippets/snippets"

"Tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

"Undo
Plug 'mbbill/undotree'
nnoremap <F1> :UndotreeToggle<cr>

"Motion
Plug 'justinmk/vim-sneak'

"Latex
Plug 'lervag/vimtex'
Plug 'PietroPate/vim-tex-conceal'

set concealcursor=""
let g:tex_flavor='pdflatex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=1
set conceallevel=2
let g:tex_conceal='abdmgs'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" RST/Sphink
"
Plug 'Rykka/riv.vim'
let gems = { 'path': '/mnt/M/homes/jc.giret/workspace/gems/doc_src/sphinx/source', }
let g:riv_projects = [gems]

" Whitespaces handling
Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_enabled=1
" let g:strip_whitespace_on_save=1
" Color themes

Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'icymind/NeoSolarized'

" NERDTree sideline bar
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Ale: Asynchronous linting and fixing
Plug 'dense-analysis/ale'

" Autotag: automatically regenerate tags for a file when written.
Plug 'craigemery/vim-autotag'

" Highlight the yanked text
Plug 'machakann/vim-highlightedyank'

" Boilerplate for Python docstring
Plug 'jgiret/vim-pydocstring'
" let g:pydocstring_templates_dir = '~/.vim/bundle/vim-pydocstring/template/google'

" Autopep8 Plugin
Plug 'tell-k/vim-autopep8'

" Isort the module import
Plug 'fisadev/vim-isort'

" Vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" The fantastic fuzzy search finder
Plug 'junegunn/fzf.vim'

" Vim integration with tmux
Plug 'benmills/vimux'
Plug 'janko-m/vim-test'

" Git plugins
Plug 'airblade/vim-gitgutter'

" Other Tim Pope's plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'

Plug 'rstacruz/vim-closer'

" Indentation line, quite useful in Python
Plug 'Yggdroot/indentLine'

" To easily grep in the working directory
Plug 'mhinz/vim-grepper'

" PlantUML support
Plug 'aklt/plantuml-syntax'
Plug 'scrooloose/vim-slumlord'
" ...

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

" Enable hidden buffers
set hidden

" Source the vimrc file after saving it
au bufwritepost .vimrc source $MYVIMRC

" no automatic backup and no swapfile
set nobackup
set nowritebackup
set noswapfile

" Enable folding
set foldmethod=indent
set foldlevel=99

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1
syntax on

"colorscheme
if has("termguicolors")
  set termguicolors
  endif
colorscheme NeoSolarized
set background=dark

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set nu
set clipboard=unnamed
set mouse=a

set undofile
set undodir=~/.vim/undodir

let g:ale_linters = {'python': ['pycodestyle','pydocstyle','pyflakes','pylint']}
let g:ale_fixers = {'python': ['yapf', 'trim_whitespace','remove_trailing_lines','isort']}
nnoremap <leader>f :ALEFix<CR>
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

let test#strategy = "vimux"

" Escape sortcuts
inoremap jk <Esc>

" Toogle NerdTree
map <C-n> :NERDTreeToggle<CR>

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Disable Ex mode
map Q <Nop>

" FZF Shortcuts
nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>a :Commands<CR>
nnoremap <leader>x :x<CR>

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" Return to last edit position when opening files (You want this!)
 autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
