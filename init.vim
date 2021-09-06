syntax enable
syntax on
filetype plugin indent on
set nocompatible
set encoding=UTF-8

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath


" Vim-plug Plugins
" ----------------------
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.

Plug 'tpope/vim-sensible'

" Tools
Plug 'junegunn/goyo.vim', {'for': 'markdown'}
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


" Autocompletion
Plug 'universal-ctags/ctags'
Plug 'szw/vim-tags'
Plug 'Raimondi/delimitMate'

" Colour schemes
Plug 'sainnhe/gruvbox-material'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Syntax-Highlighting
Plug 'vim-jp/vim-cpp', {'for': 'cpp'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}


" Integrations
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }


Plug 'ryanoasis/vim-devicons'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Builtin Fuzzy File search
" Search down into subfolders
set path+=**
" Display all matching files
set wildmenu

" Set PowerShell 7.x as shell
" ----------------------------
set shell=pwsh
set shellquote=
set shellpipe=\| 
set shellxquote=
set shellcmdflag=-NoLogo\ -ExecutionPolicy\ RemoteSigned\ -Command
set shellredir=\|\ Out-File\ -Encoding\ UTF8

" Enabling Windows Clipboard
" -----------------------------
source $VIMRUNTIME/mswin.vim


" Templates
" -----------------

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.cpp 0read ~\.vim\templates\skeleton.cpp
  augroup END
endif

" Snippets
" ------------------
function Table()
  read ~\.vim\snippets\table.md
endfunction
function Header()
  0 read ~\.vim\snippets\header.md 
  4 read !"%:r"
endfunction
function Backlinks()
    !rg -F "%" -l
endfunction

" Mappings
" --------
" see :h gf
nmap gf :silent<CR>:w<CR>:e <cfile><CR>
" Esc to exit terminal mode
tnoremap <Esc> <C-\><C-N>
" Toggle between buffers
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

" Code Folding
" ------------
"set foldenable
"set foldlevelstart=2
"set foldnestmax=5
"set foldmethod=indent

" Vim-markdown
"  ----------------------------------
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_autowrite = 1
set conceallevel=2
let g:vim_markdown_conceal = 1 " Conceal links, italics, bold only
let g:vim_markdown_conceal_code_blocks = 0 " disable codeblock concealing
" Disable math conceal with Latex math syntax
let g:tex_conceal = ""
let g:vim_markdown_math = 1


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
colorscheme gruvbox-material

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:airline_theme="lessnoise"
let g:airline_powerline_fonts = 1
"let g:airline_extensions = []

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
let g:airline_left_sep ='≡'
let g:airline_left_alt_sep ='〉'
let g:airline_right_sep ='≡'
let g:airline_right_alt_sep ='〈'
let g:airline_symbols.branch =''
let g:airline_symbols.readonly =''
let g:airline_symbols.linenr ='☰'
let g:airline_symbols.maxlinenr =''

" Font
" ---------------
set guifont="Cascadia Code PL":h11:cANSI
"set guifont=Source\ Code\ Pro\ for\ Powerline:h11:cANSI
"if !exists('g:airline_symbols')
"        let g:airline_symbols = {'\'}
"endif

