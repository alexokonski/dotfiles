if has("win32")
    set guifont=Consolas:14
elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h16
else
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
    set nowrap
endif

colorscheme rdark
highlight ColorColumn guibg=#2c3032

set number
set numberwidth=4
set columns=84

set list listchars=tab:>·,trail:·
