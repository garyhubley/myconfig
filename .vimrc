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

" Move cursor to last space before 80th column
nmap <leader>e 80\|F<Space>

" Set tabs to n spaces
set tabstop=2
set shiftwidth=2

" "Highlight pairs of []{}""...
set matchpairs+=<:>

"Set folding based on syntax highlighting
set fdm=syntax

"use default clipboard
set clipboard=unnamed

"set colourscheme to slate
colo slate

"Always use spaces. :( 
set expandtab

"Highlight the 80th column 
call matchadd('ColorColumn', '\%80v', 100)
set tw=80

"Highlight all search matches
set hlsearch

" Match Y with the behaviour of C and D
nnoremap Y y$

set title titlestring=

"Disable expand tabs for make files
autocmd FileType make setlocal noexpandtab
autocmd FileType py setlocal expandtab

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

" Search for highlighted text using // from visual mode
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Auto format on buffer write 
let g:clang_format#auto_format=1

" Update markdown preview on buffer write or exit insert mode
let g:mkdp_refresh_slow=1
