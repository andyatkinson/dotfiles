set nocompatible              " be iMproved
filetype off                  " required!

set backspace=2 " make backspace work like most other programs
set backspace=indent,eol,start

" fzf - enable fuzzy finder in vim
set rtp+=/usr/local/opt/fzf

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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " MacOSX/Linux
set wildignore+=*/lib/ext/*

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
set re=2

set background=dark
colorscheme PaperColor

filetype plugin indent on

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

" use ~/.vimbuffer file to copy and paste between vim instances
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
map <C-v><C-v> :r ~/.vimbuffer<CR>

" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


map! jk <ESC>:w<ESC>


" faster navigation between split windows
" http://od-eon.com/blogs/kaunghtet/vim-working-multiple-split-windows/
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l


nnoremap <leader><leader> <c-^>

" don't open man page
nnoremap K <Nop>

map <silent> <leader>g :Git blame<cr>

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

" 2021: delete this if it's unused
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

let g:syntastic_javascript_checkers = ['eslint']

" https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

" opens ":Files" search across files
nmap <C-P> :FZF<CR>
nmap <leader>p :FZF<cr>

" Fuzzy finder, search within a file
nnoremap <silent> <Leader>f :Rg<CR>

" Fuzzy finder, search for files within buffers list
nnoremap <silent> <Leader>b :Buffers<CR>
