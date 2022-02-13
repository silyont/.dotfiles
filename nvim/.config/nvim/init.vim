" --- General
let mapleader = ' ' " override the default leader

" enables syntax highlighting
syntax on

" Better colors
set termguicolors

" number of spaces in a <Tab>
set tabstop=4
set softtabstop=4
set expandtab

" enable autoindents
set smartindent

" number of spaces used for autoindents
set shiftwidth=4

" adds line numbers
set number

" adds relative number
set relativenumber

" prevent swap files
set noswapfile

" columns used for the line number
set numberwidth=4

" highlights the matched text pattern when searching
set incsearch
set nohlsearch

" navigate buffers without losing unsaved work
set hidden

" start scrolling when 8 lines from top or bottom
set scrolloff=8

" Save undo history
set undofile

" set undo directory
set undodir=~/.config/nvim/undodir

" Enable mouse support
set mouse=a

" case insensitive search unless capital letters are used
set ignorecase
set smartcase




" --- Plugins
call plug#begin('~/.config/nvim/plugged')

" General
Plug 'kyazdani42/nvim-web-devicons'
Plug 'gruvbox-community/gruvbox'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }

call plug#end()

lua require('tony')



" --- Colors
set background=dark
colorscheme gruvbox




" --- Split Management
" open splits intuitively
set splitbelow
set splitright

" override default split window switching
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>





" --- Mappings
" make simple highlight removal
nmap <Leader><space> :nohls<cr>
nnoremap <esc><esc> :silent! nohls<cr>







