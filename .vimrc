set ts=4 sw=4 sts=4 et
set encoding=utf-8
set nu
"----------------------------------------------------
" neobundle.vim
"----------------------------------------------------
set nocompatible              " be iMproved
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'


" original repos on GitHub
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle "Shougo/neocomplete"
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'

NeoBundleLazy 'groenewege/vim-less', {'autoload': {'filetypes': ['less']}}
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload': {'filetypes': ['coffee']}}
NeoBundle 'elzr/vim-json'
"NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}} 
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'moll/vim-node'

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'itchyny/thumbnail.vim'

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'mattn/emmet-vim'
NeoBundle 't9md/vim-quickhl'

"NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'vim-scripts/Wombat'
"NeoBundle 'itchyny/landscape.vim'
NeoBundle 'nanotech/jellybeans.vim'

if has('conceal')
    NeoBundle 'Yggdroot/indentLine'
    "NeoBundleLazy 'Yggdroot/indentLine', { 'autoload' : {
    "    \   'commands' : ['IndentLinesReset', 'IndentLinesToggle'],
    "    \ }}
    "set list listchars=tab:\|\
    "let g:indentLine_color_term=111
    "let g:indentLine_char='|'
endif

" vim-scripts repos
"Bundle 'RunView'
"Bundle 'Changed'

" non-GitHub repos

" Git repos on your local machine (i.e. when working on your own plugin)

" ...

if !has('gui_running')
    set t_Co=256
endif
"set background=dark
"colorscheme solarized
"colorscheme wombat
"colorscheme landscape
colorscheme jellybeans
set cursorline

syntax on
filetype plugin indent on     " required!

let g:neomru#time_format = '(%Y/%m/%d %H:%M:%S) '

"===========================================
" lightline.vim
"===========================================
set laststatus=2

let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'mode_map': {'c': 'NORMAL'},
    \ 'active': {
    \   'left': [
    \     ['mode', 'paste'],
    \     ['fugitive', 'gitgutter', 'filename'],
    \   ],
    \   'right': [
    \     ['lineinfo', 'syntastic'],
    \     ['percent'],
    \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
    \   ]
    \ },
    \ 'component_function': {
    \   'modified': 'MyModified',
    \   'readonly': 'MyReadonly',
    \   'fugitive': 'MyFugitive',
    \   'filename': 'MyFilename',
    \   'fileformat': 'MyFileformat',
    \   'filetype': 'MyFiletype',
    \   'fileencoding': 'MyFileencoding',
    \   'mode': 'MyMode',
    \   'syntastic': 'SyntasticStatuslineFlag'
    \ },
    \ 'separator': {'left': '〉', 'right': '〈'},
    \ 'subseparator': {'left': '>', 'right': '<'}
    \ }


function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"==========================================
"neocomplete.vim
"==========================================
"use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>  neocomplete#undo_completion()
inoremap <expr><C-l>  neocomplete#complete_common_string()

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


let g:syntastic_javascript_checkers = ['jshint'] "JavaScriptのSyntaxチェックはjshintで
let g:syntastic_check_on_open = 0 "ファイルオープン時にはチェックをしない
let g:syntastic_check_on_save = 1 "ファイル保存時にはチェックを実施
let g:syntastic_enable_signsu = 1


" open the last modified line
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""

"Grunt compile
function! _compileByGrunt()
    exe ":!grunt compile"
endfunction

command! CompileByGrunt call _compileByGrunt()
"autocmd BufWritePost *.{coffee} :CompileByGrunt


"Emmet
let g:user_emmet_settings = {
\   'lang': 'ja'
\}


nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)


"normal mode's line number solarize=#268bd2 wombat=#8ac6f2
"hi CursorLineNr ctermfg=15 ctermbg=4 guifg=#268bd2
"autocmd InsertLeave * hi CursorLineNr ctermfg=15 ctermbg=4 guifg=#268bd2
" Wombat
"hi CursorLineNr ctermfg=238 ctermbg=117 guifg=#268bd2
"autocmd InsertLeave * hi CursorLineNr ctermfg=238 ctermbg=117 guifg=#268bd2
" landscape
"hi CursorLineNr ctermfg=231 ctermbg=21
"hi LineNr ctermfg=21 ctermbg=231
"autocmd InsertLeave * hi CursorLineNr ctermfg=231 ctermbg=21
"autocmd InsertLeave * hi LineNr ctermfg=21 ctermbg=231
"jellybeans
hi CursorLineNr ctermfg=236 ctermbg=103
autocmd InsertLeave * hi CursorLineNr ctermfg=236 ctermbg=103

"insert mode's line number solarize=#859900 wombat=#95e454
"autocmd InsertEnter * hi CursorLineNr ctermfg=15 ctermbg=2 guifg=#859900
"autocmd InsertEnter * hi CursorLineNr ctermfg=238 ctermbg=119 guifg=#859900
"landscape
"autocmd InsertEnter * hi CursorLineNr ctermfg=231 ctermbg=22
"autocmd InsertEnter * hi LineNr ctermfg=22 ctermbg=231
"jellybeans
autocmd InsertEnter * hi CursorLineNr ctermfg=236 ctermbg=107

augroup active_window_cursor_line_nu
    autocmd!
    autocmd VimEnter,BufWinEnter,WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END

"hi CursorLine cterm=NONE ctermbg=236
"hi LineNr ctermbg=244 ctermfg=238


"set guifont=Ricty_Discord_for_Powerline:h14:cSHIFTJIS
"set guifontwide=Ricty_Discord:h14:cSHIFTJIS

set scrolloff=7
set lazyredraw
set list
set listchars=tab:^\ ,trail:~,extends:<,precedes:>
