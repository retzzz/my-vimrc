call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'scrooloose/nerdTree'
Plug 'FuDesign2008/randomTheme.vim'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-surround'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/LeaderF'
Plug 'ludovicchabant/vim-gutentags'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'skywind3000/asyncrun.vim'
"Plug 'brookhong/cscope.vim'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'dimasg/vim-mark'
Plug 'andymass/vim-matchup'
Plug 'kshenoy/vim-signature'
Plug 'terryma/vim-expand-region'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'pseewald/vim-anyfold'
Plug 'will133/vim-dirdiff'

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
endif

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

if has('nvim')
    let s:cachedir = expand(stdpath('cache'))
else
    let s:cachedir = expand('~/.cache')
endif

"only for vim
if !has('nvim')
    filetype plugin indent on
    syntax on
    set encoding=utf-8
    set backspace=indent,eol,start
    set dir=$HOME/.vimtmp
    "Completion mode setting
    set wildmenu
    set wildmode=full

    set undodir=$HOME/.vimtmp
    set incsearch
    set hlsearch

    " Toggle Menu and Toolbar
    " @see http://liyanrui.is-programmer.com/articles/1791/gvim-menu-and-toolbar-toggle.html
    set guioptions+=b
    set guioptions-=m
    set guioptions-=T
    map <silent> <C-F12> :if &guioptions =~# 'T' <Bar>
           \set guioptions-=T <Bar>
           \set guioptions-=m <bar>
       \else <Bar>
           \set guioptions+=T <Bar>
           \set guioptions+=m <Bar>
       \endif<CR>
endif

"all tabs to expand to four spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"common setting
set scrolloff=2
set mouse=a
set cindent
set visualbell
set cursorline
set ruler
set number
set relativenumber
set diffopt+=vertical
set clipboard+=unnamed
set title titlestring=%-0.110F%m%=\ \ buffer=%n\ %Y\ %q\ \ \ line=%l\ of\ %L titlelen=120


"Create file which contains undo information so you can undo previous actions even
"after you close and reopen a file.
set undofile

"leader key = ',' but not '\'
let mapleader=","
let maplocalleader=","

set ignorecase
set smartcase
set gdefault
set showmatch
nnoremap <leader><space> :noh<cr>

nnoremap <M-o> <tab>
vnoremap <M-o> <tab>
nnoremap <tab> %
vnoremap <tab> %

"about wrap
set wrap
set linebreak
set showbreak=☇
"∑
set textwidth=120
set formatoptions=qrn1j
set colorcolumn=80

"invisible characters
nnoremap <leader>li :set list!<CR>
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
"substitute current word to something in normal mode
nnoremap <leader>zz :%s/<C-R>=expand("<cword>")<CR>/
"substitute yanking word to something in normal mode
nnoremap <leader>zx :%s/<C-R>*/
"substitut selected word to something in visual mode
vnoremap <leader>zz y:%s/<C-R>"/
"edit vimrc file
nnoremap <leader>vs :source! $MYVIMRC
nnoremap <leader>ve :e $MYVIMRC<CR>
"move cursor in insert mode
noremap! <M-j> <Down>
noremap! <M-k> <Up>
noremap! <M-h> <left>
noremap! <M-l> <Right>
"move screen right or left
nnoremap <M-l> 5zl
nnoremap <M-h> 5zh

set fileencodings=utf-8,chinese,latin-1

let g:favorite_color_schemes = ['lettuce',
	       \ 'github',
	       \ 'colorer',
	       \ 'solarized',
	       \ 'distinguished',
	       \ 'jellybeans',
	       \ 'vividchalk',
	       \ 'koehler',
	       \ 'base16-railscasts',
	       \ 'desert',
	       \ 'desertEx',
	       \ '0x7A69_dark',
	       \ 'xoria256']

if has("win32")
    "幼圆
    set gfw=YouYuan:h15
    let g:favorite_gui_fonts = ['Monaco:h14', 'DejaVu\ Sans\ Mono:h14']
else
    set gfw=YouYuan\ 16
    let g:favorite_gui_fonts = ['DejaVu\ Sans\ Mono\ 14', 'Monaco\ 14']
endif

" copy file/short path/long path/ to clipboard
" Convert slashes to backslashes for Windows.
if has('win32')
    nnoremap <leader>yf :let @*=substitute(expand("%"), ".*[\\/]", "", "g")<CR>
    nnoremap <leader>ys :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
    nnoremap <leader>yl :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

    " This will copy the path in 8.3 short format, for DOS and Windows 9x
    nnoremap <leader>y8 :let @*=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
    nnoremap <leader>yf :let @*=substitute(expand("%"), ".*/", "", "g")<CR>
    nnoremap <leader>ys :let @*=expand("%")<CR>
    nnoremap <leader>yl :let @*=expand("%:p")<CR>
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

augroup WriteHelp
    autocmd!
    autocmd BufWritePre * call RemoveTrailingWhitespace()
    autocmd BufWritePost * call g:ChmodOnWrite()
augroup END

augroup WorkingFileType
    autocmd!
    autocmd BufNewFile,BufRead *.tsf set filetype=vb
    autocmd BufNewFile,BufRead *.tpr set filetype=xml
    autocmd BufNewFile,BufRead makefile.g set filetype=make
augroup END

nnoremap <F11> <C-E>:sleep 3500m<CR>j<F11>
"*/# search selected text in visual mode
vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"send output of previous global command to a new window
nnoremap <F2>  :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>

nnoremap <silent> <F4> :cw<CR>
nnoremap <F7> :setlocal spell! spelllang=en_us spell?<CR>
inoremap <F7> <C-o>:setlocal spell! spelllang=en_us spell?<CR>

"plugin configure

"deoplete
let g:python3_host_prog='c:\python38\python.exe'
let g:deoplete#enable_at_startup = 1

" F3 NERDTree Toggle
nnoremap <F3> :NERDTreeToggle<CR>
inoremap <F3> <ESC>:NERDTreeToggle<CR>

" gutentags configuration
set tags=./.tags;,.tags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.git', '.root', '.svn', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = s:cachedir.'\tags'

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" LeaderF configuration
let g:Lf_ShortcutF = '<c-p>'
" let g:Lf_ShortcutB = '<m-n>'
noremap <leader>fm :LeaderfMru<cr>
noremap <leader>ff :LeaderfFunction<cr>
noremap <leader>fb :LeaderfBuffer<cr>
noremap <leader>ft :LeaderfTag<cr>
noremap <leader>fl :LeaderfLine<cr>
"noremap <leader>fr <Plug>(LeaderfRgPrompt)
"noremap <leader>fra <Plug>(LeaderfRgVisualLiteralBoundary)
noremap <leader>fr :<C-U>Leaderf rg -e<Space>
noremap <leader>fra :<C-U><C-R>=leaderf#Rg#startCmdline(0, 0, 0, 0)<CR>
noremap <leader>frb :<C-U><C-R>=leaderf#Rg#startCmdline(0, 0, 0, 1)<CR>
noremap <leader>frc :<C-U><C-R>=leaderf#Rg#startCmdline(0, 0, 1, 1)<CR>
noremap <leader>frd :<C-U><C-R>=leaderf#Rg#startCmdline(0, 1, 1, 1)<CR>
vnoremap <silent> <leader>fra :<C-U><C-R>=leaderf#Rg#startCmdline(2, 0, 0, 0)<CR>
vnoremap <silent> <leader>frb :<C-U><C-R>=leaderf#Rg#startCmdline(2, 0, 0, 1)<CR>
vnoremap <silent> <leader>frc :<C-U><C-R>=leaderf#Rg#startCmdline(2, 0, 1, 0)<CR>
vnoremap <silent> <leader>frd :<C-U><C-R>=leaderf#Rg#startCmdline(2, 0, 1, 1)<CR>

let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = s:cachedir
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Line':1}

"ALE configuration
let g:ale_linters={'cpp':['clang'],'c':['clang']}
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

nnoremap <Leader>at :ALEToggle<CR>
nnoremap <Leader>ad :ALEDetail<CR>

"let g:ale_sign_error = "χ"
"let g:ale_sign_warning = "!!"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=LightRed
hi! SpellCap gui=undercurl guisp=Orange
hi! SpellRare gui=undercurl guisp=LightMagenta

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"matchup
nmap <silent> <Leader>% <plug>(matchup-hi-surround)
