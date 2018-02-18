set nocompatible
set shellslash 
"==>General Settings
set history=500

"Filetype Plugins
filetype plugin on
filetype indent on

"Set autoread when changed from outside
set ar

"Change leader to ,
let mapleader = ","
let g:mapleader = ","

let maplocalleader = "\\"

"Navigation j/k
set so=7

"Configure backspace so it is backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Turn on WiLdMeNu on
set wildmenu
"Ignore compiled files etc
set wildignore=*.p,*~,*.pyc,*.o

"Ignore case when searching, be smart about it
set ignorecase
set smartcase

"Highlight restults
set hlsearch

"Make ruler visible + cmd
set ruler
set cmdheight=2

"===>UI Stuff
"Enable syntax highlight
syntax enable
colorscheme xoria256 

"Set utf8 as standard encoding
set encoding=utf-8

"Use unix standrad filetype
set ffs=unix,dos,mac

"We don't need file backups (use git, or backup before editing)
set nobackup
set nowb
set noswapfile

"Inable switching incomplete buffers
set hidden
set bh=""

"Use spaces instead of tabs, be smart about tabs
set expandtab
set smarttab

"Natural splitting
set splitbelow
set splitright

"AutoCD in dir
set acd

"1 Tab == 4 spaces
set shiftwidth=4
set tabstop=4

"Auto+smart indent also wrap + when inserting line break indent to indentation
set ai
set si
set wrap
set bri

" Visual of break column
"set cc=160

""
"Mappings
"Map edit my vimrc and source"
noremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
"Flexible moving in splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"delete Line
noremap - dd

inoremap <C-d> <Esc>ddi
"Make word uppercase
inoremap <C-u> <Esc>g~wi
"Fast Saving
nnoremap <leader>w :w!<CR>
nnoremap <F3> :set hlsearch!<CR>
set pastetoggle=<F2>

"==>CTRLP Buffer
" nnoremap ; :CtrlPBuffer<CR>

"Map F8 to :TagBar
" nnoremap <F8> :TagbarToggle<CR>
" Map F4 to NERDTree
" nnoremap <F4> :NERDTreeToggle<CR>
"Write file if you forgot to open as sudo
cnoremap w!! w !sudo tee > /dev/null %

""
"==> PLUGIN
""
"vim-plug settings
"call plug#begin('~/.vim/plugged')
"    Plug 'vim-airline/vim-airline' "//ViM Airline
"    Plug 'vim-airline/vim-airline-themes' "Airline theme repo
"    "Plug 'vim-latex/vim-latex'
"    Plug 'lervag/vimtex'
"    Plug 'kien/ctrlp.vim'
"    Plug 'scrooloose/syntastic'
"    Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
"    Plug 'PotatoesMaster/i3-vim-syntax'
"    Plug 'scrooloose/nerdtree'
"    Plug 'sirver/ultisnips'
"    Plug 'honza/vim-snippets'
"    Plug 'godlygeek/tabular'
"    Plug 'flazz/vim-colorschemes'
"    Plug 'raimondi/delimitMate'
"    Plug 'tpope/vim-surround'
"    Plug 'mbbill/undotree'
"	Plug 'ervandew/supertab'
"    Plug 'haya14busa/incsearch.vim'
"    Plug 'tyru/caw.vim'
"    Plug 'majutsushi/tagbar'
"    Plug 'vim-scripts/indentpython.vim',{'for':'python'}
"    Plug 'tmux-plugins/vim-tmux'
"    Plug 'Shougo/vimproc.vim',{'do':'make'}
"    Plug 'mattn/emmet-vim'
"    Plug 'vimperator/vimperator.vim'
"    "Plug 'vheon/JediHTTP'
"    Plug 'nathanaelkane/vim-indent-guides'
"    "Plug 'ervandew/supertab'
"    "Plug 'm2mdas/phpcomplete-extended'
"call plug#end()
"
""
"==> VIM Airline
"""
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
"let g:airline_theme='molokai'
"set laststatus=2
"
"ViM-Latex
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'
"let g:Tex_BibtexFlavor = 'biber'
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_FormatDependency_pdf='pdf'
"let g:Tex_MultipleCompileFormats='pdf,'
"let g:Tex_CompileRule_pdf='pdflatex --synctex=-1 -src-specials -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_ViewRule_pdf='zathura'
"map <Leader>lb :<C-U>exec '!biber ../'.Tex_GetMainFileName(':p:t:r')<CR>

"Enable spelling for latex
autocmd FileType tex setlocal spell spelllang=en,de

"Syntastic Mappings
"nnoremap ]l :lnext<CR>
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_List = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['flake8']
""let g:syntastic_python_checker
"Omnicompletion
"set omnifunc=syntaxcomplete#Complete
"YouCompleteMe
"let g:ycm_python_binary_path = '/usr/bin/python'
"let g:ycm_auto_trigger = 1 
" Vim Indent Guides
"let g:indent_guides_start_level = 2
"Ultisnips ( we don't use tab cz of YCM )
"let   g:UltiSnipsExpandTrigger               <tab>
"let   g:UltiSnipsListSnippets                <C-tab>
"let   g:UltiSnipsJumpForwardTrigger          <c-j>
"let   g:UltiSnipsJumpBackwardTrigger         <c-k>
"let   g:UltiSnipsExpandTrigger               <tab>
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"




" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
"
" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
""Abbrevations
iabbrev @@ cng_it@posteo.net
iabbrev cc Creative Common

au BufNewFile,BufRead *.py 
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set fileformat=unix
