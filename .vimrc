filetype on
filetype plugin indent on

"Turn on syntax highlighting
syntax on

"map <leader> to space 
let mapleader = ' '

"Turn on line numbers
set rnu
set nu

"Map F3 to toggle line numbers
nmap <F3> :set nu! <CR>

"Map to toggle relative line numbers
nmap <leader><F3> :set rnu! <CR>

"Ability to insert newline below or above quickly
nmap <leader>o o<esc>
nmap <leader>O O<esc>

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

" Match Y with the behaviour of C and D
nnoremap Y y$

set title titlestring=

"Disable expand tabs for make files
autocmd FileType make setlocal noexpandtab

"Refresh vim every 100ms
set updatetime=100

"Turn off noises!
set belloff=all

" flash the line that contains the cursor
map K :set cursorline<CR>:set cursorcolumn<CR>:sleep 500m<CR>:set nocursorline<CR>:set nocursorcolumn<CR>

" flash the cursor position after every search
map n nK
map N NK
map # #K
map * *K

" use bright yellow for the cursor location
hi CursorLine ctermbg=yellow guibg=yellow
hi CursorColumn ctermbg=yellow guibg=yellow

nnoremap <C-N> :NERDTreeToggle <CR>

nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

nnoremap <UP> <nop>
nnoremap <DOWN> <nop>
nnoremap <LEFT> <nop>
nnoremap <RIGHT> <nop>

map <C-y> :!clear && /home/gary/projects/cpp/pitchAdapter/cmd.sh<CR>

" Auto format on buffer write 
let g:clang_format#auto_format=1

" Update markdown preview on buffer write or exit insert mode
let g:mkdp_refresh_slow=1
