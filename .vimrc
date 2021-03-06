" load pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax highlighting on and colorfy
syntax enable
filetype plugin indent on

" 256 color version of rdark
" colorscheme rdark

" basic options
set nowrap " don't wrap text
set cpoptions=$ " continue to show the piece of text you're in the process of changing
set modelines=0 " disable modelines for security
set encoding=utf-8 " use utf8 file encoding
set showcmd " show commands while typing
set scrolloff=4 " space around the current line
set gdefault " global replacement by default
set ignorecase " case insensitive searches
set smartcase " unless we specify a capital letter
set hlsearch " highlight search results
set incsearch " search while still typing
set wildmenu " show command line completions
set wildmode=list:longest " list possible entries and autocomplete longest substring
set backspace=indent,eol,start " allow backspace to cut through autoindent, ends of lines, and the start of insert mode
set visualbell " flash the screen instead of beeping
set autoindent " continue indentation if not told otherwise
set relativenumber

" show tabs and trailing spaces
set listchars=tab:>-,trail:~
set list

" default tabulation
set expandtab
set smarttab
set softtabstop=4
set tabstop=4
set shiftwidth=4

" hide generated files
set wildignore+=*build/*,*data/*,*git/*,*.pyc,*.png,*.gif,*.so,*.o,*~,

" slower python syntax parsing (does a better job at multiline docstrings)
let python_slow_sync=1

" ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column --ignore-dir=build"

" ctrl-p
let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = 0

" syntastic
let g:syntastic_check_on_open=1  " don't wait 'til saving the file to check syntax
let g:syntastic_enable_signs=0  " get rid of the sign that screws up the left side

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make comma the leader character
let mapleader = ","

" tab navigation
map tl :tabnext<CR>
map th :tabprev<CR>
map <C-t> :tabnew<CR>

" make split navigation a bit cleaner
map <leader>" :split<CR>
map <leader>% :vsplit<CR>
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" keep visual selection after indenting
vmap > >gv
vmap < <gv

" ,a is the "ack" command
map <leader>a :Ack 
vnorem // y/<c-r>"<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup okonskia 
    au!

    " make the window title something useful
    au BufEnter * let &titlestring=expand("%:t")

    " mark trailing whitespace
    " au BufWinEnter * match ExtraWhitespace /\s\+\%#\@<!$/

    " 'make' specific stuff
    au FileType make setlocal softtabstop=8 tabstop=8 shiftwidth=8
    au FileType make setlocal noexpandtab

    " python specific stuff
    au FileType python setlocal colorcolumn=80  " helps with pep-8
    au FileType python setlocal list listchars=tab:>·,trail:· " make tabs and trailing whitespace visible

    au FileType c setlocal list listchars=tab:>_,trail:_

    " html stuff
    au FileType html setlocal softtabstop=2 tabstop=2 shiftwidth=2

    " puppet stuff
    au FileType puppet setlocal softtabstop=2 tabstop=2 shiftwidth=2

    " go stuff
    au FileType go setlocal noexpandtab

    " turn on pig syntax highlighting
    au BufRead *.pig setlocal syntax=pig

    " turn on markdown syntax highlighting
    au BufRead *.md setlocal filetype=markdown
augroup END
