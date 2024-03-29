" General
"-------------------------------
" Make spacebar the leader key
map <Space> <Leader>

" A saner way to save files.
nnoremap tt :update<cr>

" Reload Vim config
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>

" Enable/disable highlighting quickly
noremap <F3> :set hlsearch! hlsearch?<CR>

" Copy to systemclipboard ctrl + c
vmap <C-c> "+y
" Cut to systemclipboard ctrl + x
vmap <C-x> "+c
" Paste from systemclipboard ctrl + p
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

"-------------------------------
" Navigation
"-------------------------------

" Split layout navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"-------------------------------
" Buffer
"-------------------------------
" This allows buffers to be hidden if you've modified a buffer.
" Vims default behavious does not allow one switch to a different buffer if
" the current buffer has not been saved
"set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<cr>

" Move to the next buffer
nmap <leader>j :bnext<CR>

" Move to the previous buffer
nmap <leader>k :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>


"-------------------------------
" NERDTree
"-------------------------------
map <C-n> :NERDTreeToggle<CR>

"-------------------------------
" FZF
"------------------------------- File Finder
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>

" Buffer Finder
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

" Tag Finder
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>

" Line Finder
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>

"String Finder
nmap <Leader>/ :Find<Space>

" Find Command
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!{.git,node_modules}/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)<Paste>
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!{.git,node_modules}/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Colour picker
let g:vcoolor_map = '<M-f>'

"-------------------------------
" FZF
"-------------------------------
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"-------------------------------
" CoC
"-------------------------------
" Use <Tab> and <S-Tab> to navigate the completion list:
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Use tab to select first item in menu
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"



"-------------------------------
" TwiddleCase
"-------------------------------
" Press ~ to convert the text to UPPER CASE, then to lower case, then to Title Case. 
" Keep pressing ~ until you get the case you want.
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
