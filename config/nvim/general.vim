"---------------------------
" Colour Scheme
"---------------------------

set termguicolors     " enable true colors support 
" let ayucolor="dark"   " for dark version of theme
"colorscheme space-vim-dark
colorscheme material-monokai

" space-vim-dark {{{
"colorscheme space-vim-dark

" Transparent background
"hi Normal     ctermbg=NONE guibg=NONE
"hi LineNr     ctermbg=NONE guibg=NONE
"hi SignColumn ctermbg=NONE guibg=NONE

" Grey comments
"hi Comment guifg=#5C6370 ctermfg=59

"   Range:   233 (darkest) ~ 238 (lightest)
"   Default: 235
"let g:space_vim_dark_background = 233
" }}}

"---------------------------
" General
"---------------------------

" More natural split opening.
" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" Tabs and spaces {{{
set expandtab " On pressing tab, insert 2 spaces
set tabstop=2 " show existing tab with 2 spaces width
set softtabstop=2
set shiftwidth=2 " when indenting with '>', use 2 spaces width
"}}}

" Wrapping {{{
" Wrap Existing Text at n Characters
" Select the lines of text you want to re-format:
" Reformat it with: gq
" Learn more:
" :h gq
set textwidth=80
" Automatic word wrapping
set formatoptions+=t
" Display a warning line where the colum equals max wrap characters
set colorcolumn=+1
"}}}

set incsearch       " Jump to match when searching
"set lazyredraw      " Speeds up scrolling
set scrolloff=5     " Display 5 lines above/below the cursor when scrolling with a mouse.
set linebreak       " Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set number relativenumber  " Shows numbers column on the left relative to current line
filetype indent on  " Load filetype-specific indent files
"set autoindent      " Indent when creating newline
set showcmd         " Show command in bottom bar
set cursorline      " Highlight current line
set noshowmode      " Removes insert mode title
set nohlsearch      " Turn off highlighting

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

" Ignore node_modules and images from search results
set wildignore+=**/node_modules/**,**/dist/**,**_site/**,*.swp,*.png,*.jpg,*.gif,*.webp,*.jpeg,*.map

" Turn off auto-insert of comments
augroup auto_comment
  au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" Turn on undo files, put them in a common location
set undofile
