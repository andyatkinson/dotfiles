set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'fishman/ctags'
Bundle 'vim-scripts/tComment'
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'junegunn/goyo.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'danro/rename.vim'
Bundle 'tristen/vim-sparkup'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-bundler'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'tpope/vim-rails'
Bundle 'https://github.com/jpo/vim-railscasts-theme.git'

set number
set hlsearch
set incsearch 
set guifont=Consolas\ 10
set nowrap " don't wrap the text, :set wrap to reverse it
set textwidth=0
set wrapmargin=0
set nofoldenable
set expandtab
set tabstop=2
set softtabstop=2
set ignorecase
set smartcase
set shiftwidth=2
set autoindent
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak
set title

" never ever let Vim write a backup file! http://nvie.com/posts/how-i-boosted-my-vim/
set nobackup
set noswapfile

" highlight whitespace chars, tabs, hidden spaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
syntax enable
set t_Co=256
colorscheme railscasts
set nrformats=
syntax on
filetype plugin indent on

let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast quit
nmap <leader>q :q<cr>

" NERDTree
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" jump back to previous file in same location: http://stackoverflow.com/questions/7832369/go-to-last-file-with-rails-vim
map <Leader>p <C-^> 

set laststatus=2
set statusline=%<%F\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %P

" Toggle spell checking on and off with `,s`
" [s, ]s to navigate misspellings, "z=" to display lists of suggestions, "1z=" to accept first suggestion
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us
" automatically enable spelling for markdown files
" http://robots.thoughtbot.com/vim-spell-checking
autocmd BufRead,BufNewFile *.md,*.markdown setlocal spell
 
" ctags: $ ctags -R . to build the tags file, echo tags >> .gitignore to ignore it, C-], C-o to navigate back and forth
" C-t jump back up the tag list

" Automatically enable soft wrap for text file types
" https://gist.github.com/nelstrom/372671
if has("autocmd")
  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text
  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,erb setlocal wrap linebreak nolist
endif

" skip the annoying message for unsaved buffers, this keeps them in the background hidden, unsaved, type :ls to view buffers
set hidden

"make < > shifts keep selection like TextMate
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" cycle forward and backward through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

"set up bash-style tab-completion
set wildmode=longest,list

" set the grep program
set grepprg=ack

" recognize .md files as markdown files
au BufRead,BufNewFile *.md set filetype=markdown

" for the tagbar plugin, toggle the tagbar right pane area
nmap <F8> :TagbarToggle<CR>

" highlight the current line
set cursorline

" set cursor in middle of the screen when searching
set scrolloff=9999

" trying this out as a easier way to copy and paste
" between instances of vim
" http://stackoverflow.com/a/11052783/126688
" This does not use the system clipboard, it is an alternative way to copy and
" paste between vim instances.

" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" Off-limits: Ctrl-I (jumps forward), Ctrl-P (autocomplete suggestions)
" Ctrl-V (visual line selection), Ctrl-w (toggle panes), Ctrl-D (down half
" page)
map <C-v><C-v> :r ~/.vimbuffer<CR>

" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" CtrlP plugin mappings https://github.com/kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
nmap <leader>p :CtrlP<cr>
nmap <leader>b :CtrlPBuffer<cr>
" Re-use the nerdtree window
let g:ctrlp_dont_split = 'nerdtree'

" split panes, open differently
" http://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
set splitbelow
set splitright

" Ctrlp-funky function matching, ctrl-p plugin
" https://github.com/tacahiroy/ctrlp-funky
nmap ,f :CtrlPFunky<CR>

" jj to exit insert mode, common mapping
" http://stackoverflow.com/questions/1276403/simple-vim-commands-you-wish-youd-known-earlier
map! jj <ESC>
map! jjj <ESC>:w<ESC>

" coffeescript
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" mustache and handlebars vim plugin
" https://github.com/mustache/vim-mustache-handlebars
let g:mustache_abbreviations = 1

" faster navigation between split windows
" http://od-eon.com/blogs/kaunghtet/vim-working-multiple-split-windows/
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" goyo https://github.com/junegunn/goyo.vim
nnoremap <silent> <leader>z :Goyo<cr>

" disable automatic comment prefix
set formatoptions-=or
