syntax enable
syntax on
filetype plugin indent on
" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Set PowerShell as shell
"-----------------------------
set shell=powershell 
set shellquote=
set shellpipe=\| 
set shellxquote=
set shellcmdflag=-NoLogo\ -ExecutionPolicy\ RemoteSigned\ -Command
set shellredir=\|\ Out-File\ -Encoding\ UTF8

" Enabling Windows Clipboard
" -----------------------------
source $VIMRUNTIME/mswin.vim

" Notes (Plugin : vim-waikiki)
" ------------------------------
let g:waikiki_roots = ['~/Documents/Notes/']
let maplocalleader = "\<F7>"
let g:waikiki_default_maps = 1
let g:waikiki_conceal_markdown_url= 1
let g:waikiki_wiki_patterns = []
let g:waikiki_conceal_markdown_url = 1

" Templates
" -----------------

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.md '0r ~\.vim\templates\skeleton.md
  augroup END
endif

" Key Map
" --------
" see :gf
nmap gf :silent<CR>:w<CR>:e <cfile><CR>
" Esc to exit terminal mode
tnoremap <Esc> <C-\><C-N>
" Toggle between twobuffers
nnoremap gb :w<CR>:b# <CR>
" Go to next buffer in buffer list
nnoremap ]b :w<CR>:bnext<CR>

" Go to previous buffer in buffer list
nnoremap [b :w<CR>:bprevious<CR>
 
" Goto to index file
nmap <leader>ww :silent<CR>:split<CR>:e ~/Documents/Notes/index.md<CR>
" Goto TODO file
nmap <leader>td :split<CR>:e ~/Documents/Notes/TODO.md<CR>
" Make :grep use ripgrep
if executable('rg')
    set grepprg=rg\ --color=never\ --vimgrep
endif
" To change leader key to spacebar
let mapleader=" "
let maplocalleader='\'
nnoremap <space> <nop>
vnoremap <space> <nop>

" Note Template
command! MD :0r "$HOME/.vim/templates/skeleton.md"

" Code Folding
" ------------
"set foldenable
"set foldlevelstart=2
"set foldnestmax=5
"set foldmethod=indent

" Indent
" ---------------
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set tabstop =4 softtabstop=4

" Line Numbering
" -----------------
set number
set relativenumber

" Save undo trees
" -----------------
set undofile
set undodir="~\AppData\Local\nvim\undodir"
set noswapfile
set nobackup


" Colour Scheme
" -----------------
set termguicolors
set background=dark
colorscheme gruvbox
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" Font
" ---------------
"set guifont="Cascadia Mono":h11:cANSI
set guifont=Source\ Code\ Pro\ for\ Powerline:h11:cANSI
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
