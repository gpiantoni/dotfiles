set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'mechatroner/rainbow_csv'

" install in arch
" pacman -Sy vim-jedi vim-syntastic vim-syntastic vim-tagbar vim-airline vim-airline-themes vim-gitgutter vim-coverage-highlight powerline-fonts vim-supertab
" 
" Plugin 'airblade/vim-gitgutter'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'scrooloose/syntastic'
" Plugin 'ervandew/supertab'
" Plugin 'majutsushi/tagbar'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

" Put your non-Plugin stuff after this line
syntax on
" always show the statusbar (for airline to work)
set laststatus=2
autocmd VimEnter * AirlineToggleWhitespace

" Set encoding
set encoding=utf-8

" use system-wide clipboard
set clipboard=unnamedplus

" SHORTCUTS
noremap <space> :
let mapleader=","
nnoremap <CR> o<Esc>

" type twice - to print n-dash
inoremap <buffer> --<space> –<space>
inoremap <buffer> -- —

" use uppercase W as w, when typing fast
command W w

" select and char/word count
vnoremap <leader>m g<C-g>:<C-U>echo v:statusmsg<CR>

" edit vim
nnoremap <leader>ev :tabe $MYVIMRC<cr>
" source vim
nnoremap <leader>sv :source $MYVIMRC<cr>

" navigate using softline with arrows
noremap <silent> <Up> gk
noremap <silent> <Down> gj

" swapfiles in ~ and not local
set directory=~/.vim/swapfiles//

" Line numbers
set number
set relativenumber

set colorcolumn=

" make tab appear as two spaces
set tabstop=2
" insert one tab at the time
set shiftwidth=4
autocmd BufRead,BufNewFile *.json set shiftwidth=2
autocmd BufRead,BufNewFile *.yml set shiftwidth=2
" use spaces, not tabs
set expandtab

" h l continues on the previous and next line
set whichwrap+=h,l

" colorscheme
colorscheme default

" folding
set foldmethod=indent
set foldlevel=1
set nofoldenable

" smart-case 
set ignorecase
set smartcase

" tab in command line
set wildmenu
set wildmode=longest,full

" MARKDOWN
" no spell check for words with underscore (i.e. references)
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.md syntax match String /\w\+_\w\+/ contains=@NoSpell

" LATEX CLS FILES
" latex cls files should have tex syntax
autocmd BufRead,BufNewFile *.cls setfiletype=tex

" PYTHON
" line at 80
autocmd FileType python setlocal colorcolumn=80


" AIRLINE
let g:airline_powerline_fonts = 1

" SYNTASTIC
" jump to errors
noremap <silent> [e :lprev<CR>
noremap <silent> ]e :lnext<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" keep location list small
let g:syntastic_loc_list_height = 5
let g:syntastic_python_checkers = ['flake8']

" disable several syntastic flake8 errors
" E302: too long lines
" E501: 2 spaces before function def

" syntastic: rst
let g:syntastic_rst_checkers = ['sphinx']

" syntastic: Python
" E123: indent
" E731: do not assign a lambda expression, use a def
" W503: line break before binary operator
let g:syntastic_python_flake8_post_args='--ignore=E302,E501,E123,E731,W503'

" TAGBAR:
nmap <F8> :TagbarToggle<CR>

" TAGBAR: hide the help part at the top
let g:tagbar_compact = 1

" TAGBAR: show it automatically for supported files
autocmd VimEnter * nested :call tagbar#autoopen(1)

" GITGUTTER: faster updates of the signs
set updatetime=250
nmap [g <Plug>(GitGutterPrevHunk)
nmap ]g <Plug>(GitGutterNextHunk)
nmap <Leader>g <Plug>(GitGutterStageHunk)
nmap <Leader>u <Plug>(GitGutterUndoHunk)
" You can jump between hunks with [g and ]g. You can stage and undo hunks with <leader>hs and <leader>hu

" VIM-JEDI, hide top-window with doc
let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#smart_auto_mappings = 0

" FUNCTIONS
" remove trailing whitespaces
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" TO CLEANUP XML: %s/></>\r</g
" THEN: gg=G
