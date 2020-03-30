"
"  __  __                 _   ___     _____ __  __ ____   ____ 
" |  \/  |_   _          | \ | \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  _____  |  \| |\ \ / / | || |\/| | |_) | |    
" | |  | | |_| | |_____| | |\  | \ V /  | || |  | |  _ <| |___ 
" |_|  |_|\__, |         |_| \_|  \_/  |___|_|  |_|_| \_\\____|
"         |___/                                                
"

" ========================================
"                 The Path
" ========================================
" On different computers, these settings maybe different.
" So maybe you need to change these settings.
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let g:ruby_host_prog    = '/home/frank/.gem/ruby/2.7.0/bin/neovim-ruby-host'

" ========================================
"              Some Settings
" ========================================
let mapleader=" "
" set clipboard=unnamedplus

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set wrap
set wildmenu
set scrolloff=3

set mouse=a
set encoding=utf-8
let &t_ut=''
set history=500

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

set laststatus=2
set autochdir

set backspace=indent,eol,start
" set foldmethod=indent

set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Tab
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set tw=0
set indentexpr=

" Indent
set autoindent
set cindent

" Cursor Shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Search
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" Terminal
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert

" Backup
if !isdirectory('/home/frank/.config/nvim/.backup') && exists('*mkdir')
  call mkdir('/home/frank/.config/nvim/.backup')
endif
set backup
set swapfile
set undofile
set dir=/home/frank/.config/nvim/.backup
set udir=/home/frank/.config/nvim/.backup
set bdir=/home/frank/.config/nvim/.backup

" ========================================
"             Some Mappings
" ========================================

"     ^
"     i
" < j   l >
"     k
"     v
" Move the cursor
noremap H I
noremap h i
noremap i k
noremap k j
noremap j h
noremap I 5k
noremap K 5j
noremap J 8h
noremap L 8l

noremap W 3w
noremap B 3b

noremap <C-i> 3<C-y>
noremap <C-k> 3<C-e>

"
noremap sI :set nosplitbelow<CR>:split<CR>
noremap sK :set splitbelow<CR>:split<CR>
noremap sJ :set nosplitright<CR>:vsplit<CR>
noremap sL :set splitright<CR>:vsplit<CR>
noremap si <C-w>k
noremap sk <C-W>j
noremap sj <C-W>h
noremap sl <C-W>l
noremap s<up> :res +3<CR>
noremap s<down> :res -3<CR>
noremap s<left> :vertical resize-5<CR>
noremap s<right> :vertical resize+5<CR>
noremap srv <C-w>t<C-w>H
noremap srh <C-w>t<C-w>K

"
noremap ss :tabe<CR>
noremap su :-tabnext<CR>
noremap so :+tabnext<CR>

" Change Buffers
noremap sU :bp<CR>
noremap sO :bn<CR>

" Search
noremap <LEADER>hl :nohlsearch<CR>
noremap = nzz
noremap - Nzz

" Spell Check
noremap <LEADER>sc :set spell!<CR>

" Find a Next '<++>' and Edit it.
noremap <LEADER>f <Esc>/<++><CR>:nohlsearch<CR>"_c4l

" ASCII Art (figlet)
noremap <LEADER>ifig :r !figlet 

" Open MY - NVIMRC
noremap <LEADER>rc :e /home/frank/.config/nvim/init.vim<CR>

" 
noremap tl bvw~w

" 
noremap S <nop>
noremap s <nop>
noremap S :w<CR>
noremap Q :q<CR>
noremap R :source $MYVIMRC<CR>
noremap ; :
noremap : ;

" ========================================
"             About Markdown
" ========================================
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <++>
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,d ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,a `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<CR><++><CR>```<CR><CR><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,w [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,l ---<CR><CR>
autocmd Filetype markdown inoremap <buffer> ,1 # 
autocmd Filetype markdown inoremap <buffer> ,2 ## 
autocmd Filetype markdown inoremap <buffer> ,3 ### 
autocmd Filetype markdown inoremap <buffer> ,4 #### 
autocmd Filetype markdown inoremap <buffer> ,5 ##### 
autocmd Filetype markdown inoremap <buffer> ,6 ###### 

" ========================================
"             Install Plugins
" ========================================
call plug#begin('/home/frank/.config/nvim/plugged')

Plug 'dense-analysis/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for' :['markdown', 'vim-plug'] }

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/vim-peekaboo'

Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'universal-ctags/ctags'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc-clangd
" coc-snippets
" coc-translator
" " coc-explorer

Plug 'honza/vim-snippets'

" NeoVim Styles
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ajmwagar/vim-deus'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mhinz/vim-startify'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'connorholyday/vim-snazzy'
" Plug 'morhetz/gruvbox'

" Auto change the input method
Plug 'vim-scripts/fcitx.vim'

call plug#end()

" ========================================
"              NeoVim Styles
" ========================================
set t_Co=256
set termguicolors

syntax enable
syntax on
set number
set relativenumber
set showcmd
set showmatch
set cmdheight=2
set cc=80
" set cursorline

set list
set listchars=tab:\|\ ,trail:▫

" == gruvbox ==
" let g:gruvbox_invert_indent_guides = '1'
" let g:gruvbox_contrast_light       = 'medium'
" let g:gruvbox_contrast_dark        = 'medium'
" colorscheme gruvbox
" highlight Normal ctermfg=252 ctermbg=None
" highlight Normal guibg=None ctermbg=None

" == vim-deus ==
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark    " Setting dark mode
colorscheme deus
let g:deus_termcolors=256
highlight Normal ctermfg=None ctermbg=None guifg=None guibg=None
" If you use vim in a terminal that supports italics
" set the environment variable TERM_ITALICS to TRUE
" (i.e. export TERM_ITALICS=true) to enable with vim-deus.

" == vim-airline ==
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
" |        Nice Airline Themes          |
" | ----------------------------------- |
" | dracula        | base16_snazzy      |
" | base16_bright  | base16_chalk       |
" | base16_default | base16_grayscale   |
" | base16_ocean   | base16_summerfruit |
" | gruvbox        | deus               |

" ========================================
"         Configure about Plugins
" ========================================

" == ale ==
let g:ale_sign_error                 = '✗'
let g:ale_sign_warning               = '⚡'
let g:airline#extensions#ale#enabled = 1

" == coc.nvim ===
let g:coc_global_extensions = ['coc-clangd', 'coc-snippets', 'coc-translator', 'coc-explorer']

" coc-snippets

" == ctags ==
" set tags=./.tags;,.tags

" == goyo ==
noremap <LEADER>gy :Goyo<CR>
let g:goyo_width  = 95
let g:goyo_height = 95
let g:goyo_linenr = 0

" == markdown-preview.nvim ==
let g:mkdp_auto_start         = 0
let g:mkdp_auto_close         = 0
let g:mkdp_refresh_slow       = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world  = 0
let g:mkdp_open_ip            = ''
let g:mkdp_echo_preview_url   = 0
let g:mkdp_browserfunc        = ''
let g:mkdp_preview_options    = {
    \ 'mkit':                {},
    \ 'katex':               {},
    \ 'uml':                 {},
    \ 'maid':                {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type':    'middle',
    \ 'hide_yaml_meta':      1,
    \ 'sequence_diagrams':   {},
    \ 'flowchart_diagrams':  {}
    \ }
let g:mkdp_markdown_css       = ''
let g:mkdp_highlight_css      = ''
let g:mkdp_port               = ''
let g:mkdp_page_title         = '「${name}」'

" == nerdtree ==
noremap tt :NERDTreeToggle<CR>
let NERDTreeDirArrowExpandable  = '▸'
let NERDTreeDirArrowCollapsible = '▾'
" let NERDTreeMapActivateNode   = "l"
" let NERDTreeMapOpenInTab      = "L"
" let NERDTrddMapOpenSplit      = "O"
" let NERDTreeMapOpenVSplit     = "o"
" let NERDTreeMenuUp            = "i"
" let NERDTreeMenuDown          = "k"

" == nerdtree-git-plugin ==
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
  \ }

" == vim-table-mode
noremap tm :TableModeToggle<CR>

" ========================================
"            Auto Run Programs
" ========================================
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -5
		:term ./%<
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		CocCommand flutter.run
	endif
endfunc

