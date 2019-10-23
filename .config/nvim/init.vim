let mapleader = ","

call plug#begin('~/.vim/plugged')
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'

" Navigation and search
" vim-rooter sets the working directory appropriately,
" then fzf search is fuzzy file search
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
"Plug 'universal-ctags/ctags'
"Plug 'ludovicchabant/vim-gutentags'

" Completion
"Plug 'ncm2/ncm2'
"Plug 'ncm2/ncm2-racer'

" Language
Plug 'w0rp/ale'
Plug 'hashivim/vim-terraform'

" JS / React
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Runtime
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Align'

" Themes and colors
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
call plug#end()

set shm=atI
set ts=4 sw=4 et  " four space indent
"set nobackup noswapfile
set mouse=a
set number
set relativenumber            " show line numbers relative to the current line
set undofile                  " make my undos persistent
set laststatus=2                " always have a status line
set t_BE=   " needed to prevent bracketed paste in terminal on vim exit
"sane regexes, like perl and python
nnoremap / /\v
vnoremap / /\v


set ignorecase  " ignore case when searching
set smartcase   " unless I mix case
set gdefault    " replace everything on a line by default
set incsearch   " search incrementally
set hlsearch    " highlight search matches
set showmatch   " jump to matching brackets

nnoremap <leader><space> :noh<cr>

" plugin vim-airline configuration
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_enable_branch=0
let g:airline_enable_syntastic=0
let g:airline_section_b="%f"
let g:airline_section_c=''
let g:airline_section_x=''
let g:airline_section_y="%Y"

" airline + ale linter
let g:airline#extensions#ale#enabled = 1

" vim-rooter for brazil workspace
let g:rooter_patterns = ['packageInfo', '.git/']

" jj for escape
inoremap jj <ESC>
inoremap JJ <ESC>

" Navigation

" <c-p> uses fzf
map <c-p> :Files<CR>


"NerdTree config
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
""nerdtree is ,n
map <leader>n :NERDTreeToggle<CR>

" j and k move vim lines, not file lines
no j gj
no k gk

"change windows with <C-movement>
noremap <C-h> <c-w>h
noremap <C-j> <c-w>j
noremap <C-k> <c-w>k
noremap <C-l> <c-w>l

" toggle between buffers
" noremap <leader><leader> <c-^>
" noremap <c-j> :cnext<cr>
" noremap <c-k> :cprev<cr>

" toggle between all number modes (none, nu, rnu, and rnu+nu)
nmap <silent> <F3> :exe 'set nu!' &nu ? 'rnu!' : ''<CR>

" Autocommands
" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Completion
" Tab to move forward. Shift-Tab to move backwards. Don't let <Enter> turn into a '\n' in the buffer.
"inoremap <expr> <Tab> (pumvisible() ? (empty(v:completed_item) ? "\<C-n>" : "\<C-y>"): "\<Tab>")
"inoremap <expr> <CR> (pumvisible() ? (empty(v:completed_item) ? "\<CR><CR>" : "\<C-y>"): "\<CR>")
"inoremap <expr> <S-Tab> (pumvisible() ? (empty(v:completed_item) ? "\<C-p>" : "\<C-y>"): "\<S-Tab>")
"autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Copy and paste
" <leader>p pastes clipboard into buffer
" <leader>c copies entire buffer into clipboard (TODO detect selected and only copy that)
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

" ,W strips trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

set splitright
set splitbelow

"Autochangedir
autocmd BufEnter * silent! lcd %:p:h

if has("gui_running")
  set go-=m
  set go-=T
  set go-=r
  set go-=L
  set noeb vb t_vb=
  set showtabline=1
  set lines=45
  set columns=85
  set bg=light
  if has("win32")
    set guifont=Consolas:h11
  elseif has("macunix")
    set guifont=Anonymous\ Pro:h13
  endif
  colorscheme solarized
else
  set bg=dark
  colorscheme solarized
endif

if has("win32")
  au BufWritePost _vimrc source ~/vimfiles/vimrc
else
  au BufWritePost .vimrc source ~/.vimrc
endif

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " See also http://snk.tuxfamily.org/lov/vim-256color-bce.html
  set t_ut=
endif

au BufNewFile,BufRead * setlocal formatoptions-=cro
au BufNewFile,BufRead *.md setlocal ft=markdown
au FileType vim setlocal sw=2 ts=2
au FileType haskell,cabal setlocal sw=2 ts=2
au FileType go setlocal ts=4 sw=4 noet
au FileType html,xml setlocal ts=2 sw=2 ts=2 et
au FileType javascript,jsx setlocal ts=2 sw=2 ts=2 et
au FileType python setlocal nosmartindent
