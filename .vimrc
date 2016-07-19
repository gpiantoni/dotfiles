set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/syntastic'

Plugin 'majutsushi/tagbar'

Plugin 'tpope/vim-fugitive'

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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

" Set encoding
set encoding=utf-8

" SHORTCUTS
noremap <space> :
let mapleader=","
nnoremap <CR> o<Esc>

" edit vim
nnoremap <leader>ev :tabe MYVIMRC<cr>
" source vim
nnoremap <leader>sv :source $MYVIMRC<cr>


" Line numbers
set number
set relativenumber

set colorcolumn=

" h l continues on the previous and next line
set whichwrap+=h,l

" colorscheme
colorscheme evening

" MARKDOWN
" nice word wrap
autocmd BufRead,BufNewFile *.md set linebreak

" spell check for markdown
autocmd BufRead,BufNewFile *.md setlocal spell
" no spell check for words with underscore (i.e. references)
autocmd BufRead,BufNewFile *.md syntax match String /\w\+_\w\+/ contains=@NoSpell

" PYTHON
" line at 80
autocmd FileType python setlocal colorcolumn=80

" Default options for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" keep location list small
let g:syntastic_loc_list_height = 5

" disable several syntastic flake8 errors
" (disables "too long lines", "2 spaces before function def")
let g:syntastic_python_flake8_post_args='--ignore=E302,E501'

" TAGBAR:
nmap <F8> :TagbarToggle<CR>

" TAGBAR: for md, show headings
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'sort': 0,
    \ 'kinds' : [
        \ 'h:Title',
        \ 'i:Sections',
    \ ],
\ }

" TAGBAR: hide the help part at the top
let g:tagbar_compact = 1

" TAGBAR: show it automatically for supported files
autocmd VimEnter * nested :call tagbar#autoopen(1)

" vim-jedi, hide top-window with doc
let g:jedi#show_call_signatures = 2
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
