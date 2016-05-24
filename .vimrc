set encoding=utf-8
scriptencoding utf-8
"----------------------------------------------------
" neobundle.vim
"----------------------------------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

if has('clientserver')
    NeoBundle 'thinca/vim-singleton'
endif

" My Bundles here:
" original repos on GitHub
if !has('kaoriya')
    NeoBundle 'Shougo/vimproc', {
                \ 'build' : {
                \     'windows' : 'tools\\update-dll-mingw',
                \     'cygwin' : 'make -f make_cygwin.mak',
                \     'mac' : 'make -f make_mac.mak',
                \     'linux' : 'make',
                \     'unix' : 'gmake',
                \    },
                \ }
endif
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle "Shougo/neocomplete"
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite-outline'


NeoBundle 'kana/vim-submode'
NeoBundleLazy 'groenewege/vim-less', {'autoload': {'filetypes': ['less']}}
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload': {'filetypes': ['coffee']}}
NeoBundle 'elzr/vim-json'
"NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}} 
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'moll/vim-node'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
augroup VimCSS3Syntax
    autocmd!

    autocmd FileType css setlocal iskeyword+=-
augroup END
NeoBundle 'ap/vim-css-color'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'nginx.vim'

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'itchyny/thumbnail.vim'
NeoBundle 'vim-scripts/diffchar.vim'
NeoBundle 'chrisbra/BufTimer'
NeoBundle 'chrisbra/Recover.vim'
NeoBundle 'AndrewRadev/inline_edit.vim'
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'AndrewRadev/sideways.vim'

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'gregsexton/gitv'
NeoBundle 'mattn/emmet-vim'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'godlygeek/tabular'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'thinca/vim-unite-history'
"NeoBundle 'nkzawa/js-inspector.vim'
"NeoBundleLazy 'heavenshell/vim-jsdoc' , {'autoload': {'filetypes': ['javascript']}}
NeoBundle 'heavenshell/vim-jsdoc'

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

" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()
if exists('*singleton#enable')
    call singleton#enable()
endif

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

set ts=4 sw=4 sts=4 et
set nu

if !has('gui_running')
    set t_Co=256
endif
set background=dark
"colorscheme solarized
"colorscheme wombat
"colorscheme landscape
colorscheme jellybeans
set cursorline

syntax on

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
    \ 'separator': {'left': '⮀', 'right': '⮂'},
    \ 'subseparator': {'left': '⮁', 'right': '⮃'}
    \ }

"    \ 'separator': {'left': '〉', 'right': '〈'},
"    \ 'subseparator': {'left': '>', 'right': '<'}

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
let g:syntastic_check_on_open = 1 "ファイルオープン時にはチェックを実施
let g:syntastic_check_on_save = 1 "ファイル保存時にはチェックを実施
let g:syntastic_enable_signsu = 1


" open the last modified line
augroup last_modified_line
    autocmd!
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""
augroup END

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

let g:unite_source_history_yank_enable = 1
nnoremap [unite]    <Nop>
nmap     <Space><Space> [unite]

nnoremap <silent> [unite]c   :<C-u> UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b   :<C-u> Unite buffer<CR>
nnoremap <silent> [unite]/   :<C-u> Unite grep:.<CR>
nnoremap <silent> [unite]y   :<C-u> Unite history/yank<CR>
nnoremap <silent> [unite]r   :<C-u> UniteWithProjectDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]m   :<C-u> Unite bookmark file_mru <CR>


nnoremap [quickhl]    <Nop>
nmap     <Space>h [quickhl]

nmap [quickhl]m <Plug>(quickhl-manual-this)
xmap [quickhl]m <Plug>(quickhl-manual-this)
nmap [quickhl]M <Plug>(quickhl-manual-reset)
xmap [quickhl]M <Plug>(quickhl-manual-reset)

nmap [quickhl]j <Plug>(quickhl-cword-toggle)
nmap [quickhl]] <Plug>(quickhl-tag-toggle)
map [quickhl] <Plug>(operator-quickhl-manual-this-motion)

"let g:quickhl_manual_colors = [
"        \ "gui=bold ctermfg=16  ctermbg=153 guifg=#ffffff guibg=#0a7383",
"        \ "gui=bold ctermfg=7   ctermbg=1   guibg=#a07040 guifg=#ffffff",
"        \ "gui=bold ctermfg=7   ctermbg=2   guibg=#4070a0 guifg=#ffffff",
"        \ "gui=bold ctermfg=7   ctermbg=3   guibg=#40a070 guifg=#ffffff",
"        \ ]
"
"


map e <Plug>(easymotion-prefix)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

call submode#enter_with('winmove', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winmove', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winmove', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('winmove', 'n', '', '<C-w>-', '<C-w>-')
"call submode#leave_with('winmove', 'n', '', '<Esc>') " default: <Esc>
let g:submode_timeoutlen = 2000 " default: 1000
call submode#map('winmove', 'n', '', '>', '<C-w>>')
call submode#map('winmove', 'n', '', '<', '<C-w><')
call submode#map('winmove', 'n', '', '+', '<C-w>+')
call submode#map('winmove', 'n', '', '-', '<C-w>-')

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
hi CursorLineNr ctermfg=236 ctermbg=103 guifg=#30302c guibg=#8198bf
augroup default_cursorl_line_nu
    autocmd!
    autocmd InsertLeave * hi CursorLineNr ctermfg=236 ctermbg=103 guifg=#30302c guibg=#8198bf
augroup END

"insert mode's line number solarize=#859900 wombat=#95e454
"autocmd InsertEnter * hi CursorLineNr ctermfg=15 ctermbg=2 guifg=#859900
"autocmd InsertEnter * hi CursorLineNr ctermfg=238 ctermbg=119 guifg=#859900
"landscape
"autocmd InsertEnter * hi CursorLineNr ctermfg=231 ctermbg=22
"autocmd InsertEnter * hi LineNr ctermfg=22 ctermbg=231
"jellybeans
augroup insert_mode_cursor_line_nu
    autocmd!
    autocmd InsertEnter * hi CursorLineNr ctermfg=236 ctermbg=107 guifg=#30302c guibg=#99ad6a
augroup END

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

" instead of autochdir
augroup autocd
    autocmd!
    autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
augroup END

" scss -> sass
augroup sass_mode
    autocmd!
    "au BufRead,BufNewFile *.scss set filetype=sass
    au FileType scss setlocal filetype=sass
augroup END
augroup sass_indent
    autocmd!
    au FileType sass setlocal sw=2 sts=2 ts=2 et
augroup END
augroup html_indent
    autocmd!
    au FileType html setlocal sw=2 sts=2 ts=2 et
augroup END
augroup hbs_indent
    autocmd!
    au FileType html.handlebars setlocal sw=2 sts=2 ts=2 et
augroup END

"if &diff
"    augroup enable_diffchar
"        autocmd!
"        autocmd VimEnter * execute "%SDChar"
"    augroup END
"endif
"nnoremap <silent> {} :call <SID>ToggleDiffChar(1, line('$'))<CR>
"nnoremap <silent> [] :call <SID>ToggleDiffChar(line('.'))<CR>
"let g:DiffUnit = "Char"
"let g:DiffColors = 100
"let g:DiffAlgorithm = "Basic"


" unset initial foldlevel
let g:vim_markdown_initial_foldlevel=3
" LaTex math
let g:vim_markdown_math=1
" YAML frontmatter
let g:vim_markdown_frontmatter=1

set hidden
set showcmd
"call jsinspector#keymaps()
let g:jsdoc_allow_input_prompt=1 " show prompt
"let g:vim_json_syntax_conceal = 0
"let g:indentLine_noConcealCursor=""
