set nocompatible              " be iMproved
filetype off                  " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'fishman/ctags'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'scrooloose/nerdtree'
Plugin 'danro/rename.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-rails'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'benmills/vimux'
Plugin 'jgdavey/vim-turbux'
Plugin 'vim-ruby/vim-ruby'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'honza/vim-snippets'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'elixir-lang/vim-elixir'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
set list " highlight whitespace chars, tabs, hidden spaces
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set nrformats=
set t_Co=256
set laststatus=2
set statusline=%<%F\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %P
set spelllang=en_us
set wildmode=longest,list " set up bash-style tab-completion
set grepprg=ack
set scrolloff=9999 " set cursor in middle of the screen when searching
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " MacOSX/Linux
set splitbelow " http://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
set splitright
set formatoptions-=or " disable automatic comment prefix
set scrolljump=5
set nocursorline
set nocursorcolumn
set lazyredraw
syntax sync minlines=256 " http://stackoverflow.com/a/7187629/126688
syntax enable
syntax on
colorscheme distinguished

filetype plugin indent on
runtime macros/matchit.vim

let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>n :NERDTreeFind<CR>
nmap <leader>m :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Toggle spell checking on and off with `,s`
" [s, ]s to navigate misspellings, "z=" to display lists of suggestions, "1z=" to accept first suggestion
nmap <silent> <leader>s :set spell!<CR>
" automatically enable spelling for markdown files
" http://robots.thoughtbot.com/vim-spell-checking
"autocmd BufRead,BufNewFile *.md,*.markdown setlocal spell
set complete+=kspell

" Automatically enable soft wrap for text file types
" https://gist.github.com/nelstrom/372671
" if has("autocmd")
"   " Set File type to 'text' for files ending in .txt
"   autocmd BufNewFile,BufRead *.txt setfiletype text
"   " Enable soft-wrapping for text files
"   autocmd FileType text,markdown,html,erb setlocal wrap linebreak nolist
" endif

" make < > shifts keep selection like TextMate
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" recognize .md files as markdown files
" au BufRead,BufNewFile *.md set filetype=markdown

nmap <F8> :TagbarToggle<CR>

" use ~/.vimbuffer file to copy and paste between vim instances
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
map <C-v><C-v> :r ~/.vimbuffer<CR>

" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" CtrlP plugin mappings https://github.com/kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
nmap <leader>p :CtrlP<cr>
nmap <leader>b :CtrlPBuffer<cr>
" Re-use the nerdtree window
let g:ctrlp_dont_split = 'nerdtree'

" Ctrlp-funky function matching, ctrl-p plugin
" https://github.com/tacahiroy/ctrlp-funky
nmap <leader>f :CtrlPFunky<CR>
set wildignore+=*/lib/ext/*

map! jk <ESC>:w<ESC>

" coffeescript
" autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

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

nnoremap <leader><leader> <c-^>

" don't open man page
nnoremap K <Nop>

nmap <leader>a :Ack<space>
map <silent> <leader>g :Gblame<cr>

" for cscope
if filereadable("cscope.out")
  cs add cscope.out
  " else add database pointed to by environment
 elseif $CSCOPE_DB != ""
   cs add $CSCOPE_DB
endif
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>

" ctags
nnoremap <silent> ct :!ctags -R .<CR>

let g:zipPlugin_ext = '*.zip,*.jar,*.xpi,*.ja,*.war,*.ear,*.celzip,*.oxt,*.kmz,*.wsz,*.xap,*.docx,*.docm,*.dotx,*.dotm,*.potx,*.potm,*.ppsx,*.ppsm,*.pptx,*.pptm,*.ppam,*.sldx,*.thmx,*.crtx,*.vdw,*.glox,*.gcsx,*.gqsx'

" http://blog.joncairns.com/2014/10/evaluate-ruby-or-any-command-and-insert-into-vim-buffers/
function! InsertCommand(command)
  redir => output
  silent execute a:command
  redir END
  call feedkeys('i'.substitute(output, '^[\n]*\(.\{-}\)[\n]*$', '\1', 'gm'))
endfunction
command -nargs=+ Iruby call InsertCommand("ruby " . <q-args>)
command -nargs=+ I call InsertCommand(<q-args>)

" toggle paste auto indent
set pastetoggle=<F2>

" allow misspelling of command
cabbrev Qa qa
cabbrev QA qa

" mapping for copy to clipboard
vmap <leader>y "*y<CR>

" http://vim.wikia.com/wiki/VimTip906
" Show the status of paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" redraw the screen!
nmap <leader>r :redraw!<CR>

" copy file path to clipboard! http://stackoverflow.com/a/954336/126688
noremap <silent> <F4> :let @+=expand("%:p")<CR>

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

let g:syntastic_javascript_checkers = ['eslint']

" https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif
