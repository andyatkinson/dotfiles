set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'fishman/ctags'
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
Bundle 'int3/vim-extradite'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'reedes/vim-colors-pencil'
Bundle 'benmills/vimux'
Bundle 'jgdavey/vim-turbux'

set number
set hlsearch
set incsearch 
set anti enc=utf-8 gfn=Source\ Code\ Pro:h16,Menlo:h14,Monaco:h14
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
set nobackup " never let Vim write a backup file! http://nvie.com/posts/how-i-boosted-my-vim/
set noswapfile
set hidden

" highlight whitespace chars, tabs, hidden spaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
syntax enable
set t_Co=256
colorscheme desert
set nrformats=
syntax on
filetype plugin indent on

let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>n :NERDTreeFind<CR>
nmap <leader>m :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

set laststatus=2
set statusline=%<%F\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %P

" Toggle spell checking on and off with `,s`
" [s, ]s to navigate misspellings, "z=" to display lists of suggestions, "1z=" to accept first suggestion
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us
" automatically enable spelling for markdown files
" http://robots.thoughtbot.com/vim-spell-checking
autocmd BufRead,BufNewFile *.md,*.markdown setlocal spell

" Automatically enable soft wrap for text file types
" https://gist.github.com/nelstrom/372671
if has("autocmd")
  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text
  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,erb setlocal wrap linebreak nolist
endif

" make < > shifts keep selection like TextMate
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
nmap <leader>f :CtrlPFunky<CR>

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

nnoremap <leader><leader> <c-^>

" don't open man page
nnoremap K <Nop>

nmap <leader>a :Ack<space>
map <silent> <leader>g :Gblame<cr>
