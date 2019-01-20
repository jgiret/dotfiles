set nocompatible              " required:j
filetype off                  " required

:let mapleader = ","

let g:python_host_prog = 'python'
let g:python3_host_prog = 'python'
let g:powerline_pycmd = 'py3'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" add fzf in runtime path
set rtp+=~/.fzf
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

if !has('nvim')
  Plug 'tpope/vim-sensible'
endif

" Plugin to fold code blocks 
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'hdima/python-syntax'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'jeetsukumaran/vim-pythonsense'

" snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab' 

" Forked version of YCM due to unicode issues in old systems
Plugin 'jgiret/YouCompleteMe'

" Color themes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'icymind/NeoSolarized'

" NERDTree sideline bar
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Ale: Asynchronous linting and fixing
Plugin 'w0rp/ale'

" Autotag: automatically regenerate tags for a file when written.
Plugin 'craigemery/vim-autotag'

" Highlight the yanked text
Plugin 'machakann/vim-highlightedyank'

" Boilerplate for Python docstring
Plugin 'jgiret/vim-pydocstring'
let g:pydocstring_templates_dir = '~/.vim/bundle/vim-pydocstring/template/google'

" Isort the module import
Plugin 'fisadev/vim-isort'

" Vim airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" The fantastic fuzzy search finder
Plugin 'junegunn/fzf.vim'

" Vim integration with tmux
Plugin 'benmills/vimux'
Plugin 'janko-m/vim-test'

" Git plugins
Plugin 'airblade/vim-gitgutter'

" Other Tim Pope's plugins
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'

Plugin 'rstacruz/vim-closer'
" Indentation line, quite useful in Python
Plugin 'Yggdroot/indentLine'

" To easily grep in the working directory
Plugin 'mhinz/vim-grepper'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
let g:ale_fixers = {'python': ['trim_whitespace','remove_trailing_lines','isort']}
nnoremap <leader>f :ALEFix<CR>

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


" YCM
" " nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>y :YcmCompleter GoTo<CR>
nnoremap <leader>yd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>yi :YcmCompleter GoToInclude<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <F6> :YcmDiags<CR>
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
