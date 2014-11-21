set background=dark
colorscheme jellybeans
"colorscheme solarized
"let g:lightline['colorscheme'] = 'solarized'

" solarize
"hi CursorLineNr ctermfg=15 ctermbg=4 guifg=#268bd2
"jellybeans
hi CursorLineNr ctermfg=236 ctermbg=103 guifg=#30302c guibg=#8198bf
"autocmd InsertLeave * hi CursorLineNr ctermfg=236 ctermbg=103 guifg=#30302c guibg=#8198bf

" solarize
"autocmd InsertEnter * hi CursorLineNr ctermfg=238 ctermbg=119 guifg=#859900
"jellybeans
"autocmd InsertEnter * hi CursorLineNr ctermfg=236 ctermbg=107 guifg=#30302c guibg=#99ad6a

"augroup active_window_cursor_line_nu
"    autocmd!
"    autocmd VimEnter,BufWinEnter,WinEnter * set cursorline
"    autocmd WinLeave * set nocursorline
"augroup END

set guifont=Ricty_Discord_for_Powerline:h14:cSHIFTJIS
set guioptions-=T

set lines=70 columns=120
au GUIEnter * simalt ~x

gui
"set transparency=242
set transparency=217
