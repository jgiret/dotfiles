set nocompatible              " required
filetype off                  " required

:let mapleader = ","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" add fzf in runtime path
set rtp+=~/.fzf
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'icymind/NeoSolarized'
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'w0rp/ale'

" Autotag: automatically regenerate tags for a file when written.
Plugin 'craigemery/vim-autotag'

Plugin 'heavenshell/vim-pydocstring'
Plugin 'fisadev/vim-isort'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf.vim'
Plugin 'benmills/vimux'
Plugin 'janko-m/vim-test'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

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

"python with virtualenv support

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

let g:ale_linters = {'python': ['pylint']}
let g:ale_fixers = {'python': ['isort','black']}

let g:ale_linters = {'cpp': ['clang']}
let g:ale_fixers = {'cpp': ['clang-format']}

let g:ale_linters = {'c': ['clang']}
let g:ale_fixers = {'c': ['clang-format']}

let test#strategy = "vimux"
  

" Shortcuts
"  
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

nnoremap <leader>p :History<CR>
nnoremap <leader>d :Tags<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>c :Commits<CR>


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
