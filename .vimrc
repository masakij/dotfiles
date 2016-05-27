set encoding=utf-8
scriptencoding utf-8
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

"----------------------------------------------------
" dein.vim
"----------------------------------------------------

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" プラグインが実際にインストールされるディレクトリ
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  " Required:
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  " Required:
  call dein#begin(expand(s:dein_dir))


  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  "let g:rc_dir    = expand('~/.vim/rc')
  "let s:toml      = g:rc_dir . '/dein.toml'
  "let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  "call dein#load_toml(s:toml,      {'lazy': 0})
  "call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Let dein manage dein
  " Required:
  call dein#add('Shougo/dein.vim')

  " Add or remove your plugins here:
  if has('clientserver')
    call dein#add('thinca/vim-singleton')
  endif

  if !has('kaoriya')
    call dein#add('Shougo/vimproc', {'build' : 'make'})
  endif
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add("Shougo/neocomplete")
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/vimfiler')
  call dein#add('Shougo/vimshell')
  call dein#add('Shougo/unite-outline')
  call dein#add('kana/vim-submode')
  call dein#add('groenewege/vim-less', {
              \ 'on_ft':  ['less'],
              \ 'lazy': 1
  \})
  call dein#add('kchmck/vim-coffee-script', {
              \ 'on_ft': ['coffee'],
              \ 'lazy': 1
  \})
  call dein#add('elzr/vim-json')
  "NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('scrooloose/syntastic')
  call dein#add('moll/vim-node')
  call dein#add('othree/html5.vim')
  call dein#add('hail2u/vim-css3-syntax')

  call dein#add('ap/vim-css-color')
  call dein#add('mustache/vim-mustache-handlebars')
  call dein#add('chase/vim-ansible-yaml')
  call dein#add('nginx.vim')

  call dein#add('itchyny/lightline.vim')
  call dein#add('itchyny/thumbnail.vim')
  call dein#add('vim-scripts/diffchar.vim')
  call dein#add('chrisbra/BufTimer')
  call dein#add('chrisbra/Recover.vim')
  call dein#add('AndrewRadev/inline_edit.vim')
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('AndrewRadev/sideways.vim')

  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('gregsexton/gitv')
  call dein#add('mattn/emmet-vim')
  call dein#add('t9md/vim-quickhl')
  call dein#add('godlygeek/tabular')
  call dein#add('rcmdnk/vim-markdown')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('rhysd/clever-f.vim')
  call dein#add('thinca/vim-unite-history')
  "call dein#add('nkzawa/js-inspector.vim')
  "NeoBundleLazy 'heavenshell/vim-jsdoc' , {'autoload': {'filetypes': ['javascript']}}
  call dein#add('heavenshell/vim-jsdoc')

  "call dein#add('altercation/vim-colors-solarized')
  "call dein#add('vim-scripts/Wombat')
  "call dein#add('itchyny/landscape.vim')
  call dein#add('nanotech/jellybeans.vim')
  call dein#add('mopp/autodirmake.vim')
  call dein#add('Konfekt/FastFold')

  if has('conceal')
    call dein#add('Yggdroot/indentLine')
    "NeoBundleLazy 'Yggdroot/indentLine', { 'autoload' : {
    "    \   'commands' : ['IndentLinesReset', 'IndentLinesToggle'],
    "    \ }}
    "set list listchars=tab:\|\
    "let g:indentLine_color_term=111
    "let g:indentLine_char='|'
  endif

  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  "
  " You can specify revision/branch/tag.
  "call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " vim-scripts repos
  "Bundle 'RunView'
  "Bundle 'Changed'

  " 設定終了
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------




augroup VimCSS3Syntax
    autocmd!

    autocmd FileType css setlocal iskeyword+=-
augroup END


if exists('*singleton#enable')
    call singleton#enable()
endif

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
nnoremap <silent> [unite]/   :<C-u> Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]g   :<C-u> UniteWithProjectDir grep -buffer-name=search-buffer<CR>
nnoremap <silent> [unite].   :<C-u> Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
nnoremap <silent> [unite]n   :<C-u> UniteResume search-buffer<CR>
nnoremap <silent> [unite]y   :<C-u> Unite history/yank<CR>
nnoremap <silent> [unite]r   :<C-u> UniteWithProjectDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]m   :<C-u> Unite bookmark file_mru <CR>

" unite grepにjvgrepを使う
if executable('jvgrep')
    let g:unite_source_grep_command = 'jvgrep'
    let g:unite_source_grep_default_opts = '-r --exclude "\.git|\.svn|.hg|node_modules"'
    let g:unite_source_grep_recursive_opt = '-R'
endif

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
set backup
set modeline
set modelines=5
"call jsinspector#keymaps()
let g:jsdoc_allow_input_prompt=1 " show prompt
"let g:vim_json_syntax_conceal = 0
"let g:indentLine_noConcealCursor=""
