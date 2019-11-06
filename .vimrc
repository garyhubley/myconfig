filetype on
filetype plugin indent on

"Turn on syntax highlighting
syntax on

"map <leader> to space 
let mapleader = ' '

"Turn on line numbers
set nu

"Map F3 to toggle line numbers
nmap <F3> :set nu! <CR>

"Map to toggle relative line numbers
nmap <leader><F3> :set rnu! <CR>

"Set tabs to n spaces
set tabstop=4

set shiftwidth=4

"Highlight pairs of []{}""...
set matchpairs+=<:>

"use default clipboard
set clipboard=unnamed

"set colourscheme to slate
colo slate

"Expand tabs to spaces
set expandtab

"Highlight the 100th column 
call matchadd('ColorColumn', '\%81v', 100)

"Highlight all search matches
set hlsearch

"remap ; to : in normal mode
nnoremap ; :


set title titlestring=

"Disable expand tabs for make files
autocmd FileType make setlocal noexpandtab

"Refresh vim every 100ms
set updatetime=100

"Turn off noises!
set belloff=all

nnoremap <C-N> :NERDTreeToggle <CR>
