
" Replace buffer edit with qq, quit with q
map <leader>qq :e ~/buffer<cr>
map <leader>q :q<cr>
" Fast edits and source
nnoremap <leader>ev :sp $MYVIMRC<CR>"   edit vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>"   source vimrc
nnoremap <leader>eb :sp ~/.bash_profile<CR>"   edit bash_profile
" Save session and quit, open it with vim -S (overwrites Session.vim)
nnoremap <leader>s :mksession!<CR> :xa<CR>

set visualbell
set number "show line numbers
" set cursorline "show line under cursor position
set showcmd "show latest command in bottom right, useful for <leader> mappings
set mouse=a     "enables use of mouse, also allows Visual Block selection while holding, but disables moving cursor with scrolling :(
" set mouse=nicr

colorscheme desert

" Set backup options
set backup
set writebackup
" set nowb, set noswapfile, set nobackup
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

map <leader>tr :tabr<cr>
map <leader>tl :tabl<cr>
map <C-h> :tabp<cr>
map <C-l> :tabn<cr>

inoremap jk <esc>
nnoremap FM :set foldmethod=marker<cr>

" Ack.vim
noremap <leader>a :Ack <cword><cr>

" Comment string for ini? (not working)
" autocmd Filetype ini setlocal commentstring=#\ %s

" Need to fix tab max length
"set guitablabel=%-0.12t%M

" command! W w !sudo tee % > /dev/null

" Change foldmethod autocmd in filetype for python 
" :nunmap <buffer> F
au FileType python map <buffer> FI :set foldmethod=indent<cr>

" ALE config
" Check Python files with flake8 and pyling
let g:ale_linters = {'python': ['flake8', 'pylint'],}
" Fix Python files with autopep8 and yapf
let g:ale_fixers = {'python': ['autopep8', 'yapf'],}
