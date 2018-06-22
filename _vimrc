"plugin pathogen
"After adding this, you can take any plugin, unzip/untar/svn-checkout/git-clone
"it to its own private directory in .vim/bundle, and it will be added to the
"runtime path.  This makes it easy to remove or update each plugin individually.
"filetype off
"call pathogen#runtime_append_all_bundles()
"pathogen won't be used on VIM 8.0

filetype plugin indent on

"all tabs to expand to four spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"common setting
set encoding=utf-8
set scrolloff=3
set mouse=a
set cindent
set visualbell
set cursorline
set ruler
set backspace=indent,eol,start
set number
set relativenumber
set dir=$HOME/.vimtmp
set diffopt+=vertical
set clipboard+=unnamed
syntax on
set title titlestring=%-0.110F%m%=\ \ buffer=%n\ %Y\ %q\ \ \ line=%l\ of\ %L titlelen=120

"Completion mode setting
set wildmenu
set wildmode=full

"Create file which contains undo information so you can undo previous actions even
"after you close and reopen a file.
set undofile
set undodir=$HOME/.vimtmp
"set undodir=$VIMRUNTIME/../tmp

"leader key = ',' but not '\'
let mapleader=","
let maplocalleader=","

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

nnoremap <M-o> <tab>
vnoremap <M-o> <tab>
nnoremap <tab> %
vnoremap <tab> %

"about wrap
set wrap
set linebreak
set showbreak=∑
set textwidth=120
set formatoptions=qrn1j
set colorcolumn=80

"invisible characters
nmap <leader>li :set list!<CR>
set listchars=tab:»-,eol:∫,extends:≥,precedes:≤,trail:.
"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59

"shotcut
"trim trailing spaces
nnoremap <leader>rs :%s/\s\+$//<cr>:let @/=''<CR>
"split window
nnoremap <leader>ww <C-w>v<C-w>l
"move in windows
nnoremap <leader>wn <C-W><C-W>
nnoremap <Leader>wl <C-W>l
nnoremap <Leader>wh <C-W>h
nnoremap <Leader>wk <C-W>k
nnoremap <Leader>wj <C-W>j
"substitute current word to someting in normal mode
nmap <leader>zz :%s/<C-R>=expand("<cword>")<CR>/
"substitute yanking word to someting in normal mode
nmap <leader>zx :%s/<C-R>*/
"substitut selected word to someting in visual mode
vmap <leader>zz y:%s/<C-R>"/
"edit vimrc file
nmap <leader>vs :source! $MYVIMRC
nmap <leader>ve :e $MYVIMRC<CR>
"move cursor in insert mode
noremap! <M-j> <Down>
noremap! <M-k> <Up>
noremap! <M-h> <left>
noremap! <M-l> <Right>
"move screen right or left
nnoremap <M-l> 5zl
nnoremap <M-h> 5zh

set fileencodings=utf-8,chinese,latin-1
"just for gui
if has("gui_running")
   set guioptions+=b
   source $VIMRUNTIME/delmenu.vim
   source $VIMRUNTIME/menu.vim
   "language messages zh_CN.utf-8
   language messages en_US.utf-8
   "colorscheme Lettuce
   "colorscheme Colorer
   "colorscheme solarized
   "random color
   let g:favorite_color_schemes = ['lettuce',
                       \ 'colorer',
                       \ 'dracula',
                       \ 'solarized',
                       \ 'distinguished',
                       \ 'jellybeans',
                       \ 'vividchalk',
                       \ 'koehler',
                       \ 'base16-railscasts',
                       \ 'desert']
   "if has("gui_gtk2")
   "    :set guifont=Luxi\ Mono\ 12
   "elseif has("x11")
   "    " Also for GTK 1
   "    :set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
   if has("gui_win32")
       "set fileencoding=chinese
       "set guifont=monaco:h9:b
       set guifont=DejaVu_Sans_Mono:h12
       "set guifont=consolas:h12
       "set guifont=Consolas:h12
       "set guifont=Courier_New:h12:b
       "set gfw=幼圆:h12:cGB2312
       "set gfw=YaHei:h15
       "set gfw=KaiTi:h18
       "set gfw=FangSong:h14
       set gfw=YouYuan:h13
       "set gfw=WenQuanYi_Zen_Hei_Mono_Medium:h14
   else
       "set guifont=DejaVu\ Sans\ Mono\ 12
       set guifont=monaco\ 16
       set gfw=YouYuan\ 18
       set fileencoding=utf-8
   endif
else
   let g:favorite_color_schemes = [ 'evening', 'industry', 'torte', 'base16-ateliercave' ]
endif

" copy file/short path/long path/ to clipboard
" Convert slashes to backslashes for Windows.
if has('win32')
 nmap <leader>yf :let @*=substitute(expand("%"), ".*[\\/]", "", "g")<CR>
 nmap <leader>ys :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
 nmap <leader>yl :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

 " This will copy the path in 8.3 short format, for DOS and Windows 9x
 nmap <leader>y8 :let @*=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
 nmap <leader>yf :let @*=substitute(expand("%"), ".*/", "", "g")<CR>
 nmap <leader>ys :let @*=expand("%")<CR>
 nmap <leader>yl :let @*=expand("%:p")<CR>
endif

" Remove trailing whitespace when writing a buffer, but not for diff files.
" From: Vigil
function RemoveTrailingWhitespace()
   if &ft != "diff"
       let b:curcol = col(".")
       let b:curline = line(".")
       silent! %s/\s\+$//
       "silent! %s/\(\s*\n\)\+\%$//
       call cursor(b:curline, b:curcol)
   endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()

" Remove Read-Only attribute after save a file with 'w!'
function! g:ChmodOnWrite()
 if v:cmdbang
   if has('win32')
       silent !attrib -R %
   else
       silent !chmod u+w %
   endif
 endif
endfunction

autocmd BufWritePost * call g:ChmodOnWrite()

" Toggle Menu and Toolbar
" @see http://liyanrui.is-programmer.com/articles/1791/gvim-menu-and-toolbar-toggle.html
set guioptions-=m
set guioptions-=T
map <silent> <F12> :if &guioptions =~# 'T' <Bar>
       \set guioptions-=T <Bar>
       \set guioptions-=m <bar>
   \else <Bar>
       \set guioptions+=T <Bar>
       \set guioptions+=m <Bar>
   \endif<CR>

map <F11> <C-E>:sleep 3500m<CR>j<F11>
"*/# search selected text in visual mode
vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"send output of previous global command to a new window
nmap <F2>  :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>

" F3 NERDTree Toggle
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>

nnoremap <silent> <F4> :cw<CR>
map <F7> :setlocal spell! spelllang=en_us spell?<CR>
imap <F7> <C-o>:setlocal spell! spelllang=en_us spell?<CR>
"map <F5> :ls<CR>:e #

" F8 Tlist Toggle
"nnoremap <silent> <F8> :TlistToggle<CR>
"let Tlist_Show_One_File = 1
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Use_Right_Window = 1

" F8 Tagbar Toggle
nmap <F8> :TagbarToggle<CR>

"indent guide options
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"fswitch mapping
nmap <silent> <Leader>ch :FSHere<cr>

"YouCompleteMe
"nnoremap <leader>jd :YcmCompleter GoTo<CR>
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"let g:ycm_global_ycm_extra_conf = 'c:\Users\e323819\.ycm_extra_conf.py'
"Do not ask when starting vim
"let g:ycm_confirm_extra_conf = 0
"let g:syntastic_always_populate_loc_list = 1

let g:neocomplcache_enable_at_startup = 1

"if executable('ag')
  "let g:ackprg = 'ag --vimgrep'
"endif
"
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>ll :call ToggleLocationList()<CR>

au BufNewFile,BufRead *.tsf set filetype=vb
au BufNewFile,BufRead makefile.g set filetype=make

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  "let g:ctrlp_user_command = 'ag %s -l -g ""'
endif


" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Alignment rule for C/C++
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['d'] = {
\ 'pattern': ' \ze\S\+\s*[;=]',
\ 'left_margin': 0, 'right_margin': 0
\ }

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

