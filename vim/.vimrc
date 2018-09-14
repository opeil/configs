"
" Vundle
"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Requred
Plugin 'VundleVim/Vundle.vim'

" Optional plugins
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'terryma/vim-multiple-cursors'


call vundle#end()
filetype plugin indent on

"
" Snippets
"
"let g:UltiSnipsExpandTrigger="<tab>" " SuperTab should take care of this
"let g:UltiSnipsExpandTrigger="k"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
let g:UltiSnipsSnippetsDir='~/.vim/mysnips/UltiSnips'
let g:UltiSnipsSnippetDirectories=['mysnips/UltiSnips']
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsListSnippets="<c-l>"
"let g:UltiSnipsUsePythonVersion = 3

"
" Omnicomplete
"
"set omnifunc=syntaxcomplete#Complete

set sw=4
set expandtab
set ignorecase
set ruler
set backspace=indent,eol,start

set nohlsearch
set pastetoggle=<F12>
"
"
" Highlight unwanted spaces
"
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

if version > 710
  source extras.vim
endif

" No smartindent by default. Turn it on for specific file types.
au BufNewFile,BufRead * if &ft == '' | set nosi noai | endif

autocmd FileType make set noexpandtab shiftwidth=8

"autocmd FileType python set autoindent smartindent et sts=2
"autocmd FileType python set autoindent smartindent et sts=4 sw=4 inoremap # X<c-h>#
"\ cinwords=class,def,elif,else,except,finally,for,if,try,while,with,raise
"autocmd FileType python inoremap # X#
autocmd FileType tex set nosmartindent nocindent noautoindent indentexpr=

augroup python
    set autoindent smartindent et sts=4 sw=4
    set cinwords=class,def,elif,else,except,finally,for,if,try,while,with,raise

    " To get rid of stupid indent removals for comment lines
    inoremap # X<c-h>#
augroup END

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=100

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

augroup END

augroup fortran
  au!
  autocmd FileType fortran set sts=3 sw=3 expandtab smartindent
  au BufNewFile *.f9? 0r ~/.vim/skel.f90

  let s:extfname = expand("%:e")
  if s:extfname ==? "f90" || s:extfname ==# "F" || s:extfname ==? "f95"
  let fortran_free_source=1
  unlet! fortran_fixed_source
  else
  let fortran_fixed_source=1
  unlet! fortran_free_source
  endif
augroup END

autocmd BufNewFile,BufRead *.g4 setf antlr

"if has("multi_byte")
"  if &termencoding == ""
"    let &termencoding = &encoding
"  endif
"  set encoding=utf-8
"  setglobal fileencoding=utf-8
"  "setglobal bomb
"  set fileencodings=ucs-bom,utf-8,latin1
"endif

if &term =~ '^screen'
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

"colorscheme desert
let g:tex_conceal='a'
let g:tex_comment_nospell=1
syntax enable

nnoremap <F12> :set invpaste paste?<CR>
set pastetoggle=<F12>
"set showmode

""
"" Indent-guides
""
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
"
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=lightgrey   ctermbg=lightgrey
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=white       ctermbg=white


