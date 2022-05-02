" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
"

call plug#begin('~/.local/share/nvim/plugged')
"call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot' 						    " Syntax for 120 languages
"Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
"Plug 'lotabout/skim.vim'                          " Fuzzy file searcher
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy file searcher
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}		" Conquer of Completion
Plug 'Raimondi/delimitMate' 								" Closes brackets
Plug 'scrooloose/nerdcommenter' 						" Comment blocks for any language
Plug 'tpope/vim-surround' 									" Surround text with brackets easily
Plug 'alvan/vim-closetag'                   " Autoclose HTML tags
Plug 'tpope/vim-repeat' 										" Repeat plugin map with '.'
Plug 'Raimondi/delimitMate' 								" Closes brackets
Plug 'scrooloose/nerdcommenter' 						" Comment blocks for any language
Plug 'preservim/nerdtree'                   " File browser
Plug 'vimwiki/vimwiki'                      " notes / wiki
Plug 'rhysd/vim-crystal'                    " crystal lang
Plug 'elixir-editors/vim-elixir'            " vim elixir
Plug 'elorest/vim-slang'                    " slang syntax
Plug 'KabbAmine/vCoolor.vim'                " color picker/selector directly froim vim (Requirs Zenity package)
Plug 'lilydjwg/colorizer'                   " preview colours in source code while editing
Plug 'mhinz/vim-mix-format'                 " Elixir code formatter
Plug 'tpope/vim-rails'                      " Rails power tools
Plug 'alvan/vim-closetag'                   " Close html tags

" Themes
Plug 'ap/vim-buftabline'                    " Minimal buffer status bar
Plug 'mg979/vim-xtabline'                   " Full control and customization on tabs/buffers
Plug 'skielbasa/vim-material-monokai'       " Theme
Plug 'dylanaraps/wal.vim'                   " Use pywal colours as theme
Plug 'ryanoasis/vim-devicons'               " Modern icons in nvim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'liuchengxu/space-vim-dark'           " Theme
"Plug 'ayu-theme/ayu-vim'                   " Theme


" Initialize plugin system
call plug#end()
