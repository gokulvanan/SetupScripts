" eclim setup
set nocompatible

" pathongen
execute pathogen#infect()
syntax on

" ctags
set tags=tags;/
  
" line numbers
set number
":highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
":autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" highlight unwanted(trailing) whitespace
" + have this highlighting not appear whilst you are typing in insert mode
" + have the highlighting of whitespace apply when you open new buffers
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
 
" leader key
let mapleader = ','
 
" searching
set ignorecase smartcase incsearch hlsearch
 
" don't display welcome
set shortmess+=I
 
" Sets how many lines of history VIM has to remember
set history=700
 
" Set to auto read when a file is changed from the outside
set autoread
 
"Always show current position
set ruler
 
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
 
" Turn backup off
" set nobackup
" set nowb
" set noswapfile
 
" Use spaces instead of tabs
set expandtab
 
" Be smart when using tabs ;)
set smarttab
 
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
 
" Remap VIM 0 to first non-blank character
map 0 ^
 
set smartindent
set cpoptions+=$
set virtualedit=all
" Nerd tree mapping
nnoremap tree :NERDTreeToggle<cr>

" Tab navigation mapping
nnoremap <c-l> :tabn<cr>
nnoremap <c-h> :tabp<cr>
nnoremap <c-n> :tabe<cr>

"added for eclim
nnoremap <c-i> :JavaImport<cr>
nnoremap <c-d> :JavaDocSearch -x declarations <cr>
nnoremap <cr> :JavaSearchContext <cr>
"added for using super tab in eclim context
let g:SuperTabDefaultCompletionType = 'context'
"open search result hit in new tab rather than split windows
let g:EclimJavaSearchSingleResult = 'tabnew'
"update status line as per project status
set statusline=%<%f\ %M\ %h%r%=%-10.(%l,%c%V\ %{eclim#project#util#ProjectStatusLine()}%)\ %P


