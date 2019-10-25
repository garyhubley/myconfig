"#execute pathogen#infect()
filetype on
filetype plugin indent on

syntax on

set number

set tabstop=4
set shiftwidth=4
set matchpairs+=<:>

set clipboard=unnamed
colo slate

set expandtab

call matchadd('ColorColumn', '\%81v', 100)

set hlsearch

nnoremap ; :

set title titlestring=

autocmd FileType make setlocal noexpandtab

set updatetime=100

