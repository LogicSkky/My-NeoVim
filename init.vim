"  __  __                 _   ___     _____ __  __ ____   ____ 
" |  \/  |_   _          | \ | \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  _____  |  \| |\ \ / / | || |\/| | |_) | |    
" | |  | | |_| | |_____| | |\  | \ V /  | || |  | |  _ <| |___ 
" |_|  |_|\__, |         |_| \_|  \_/  |___|_|  |_|_| \_\\____|
"         |___/                                                

" =============================================
"                  The Path
" =============================================
" On different computers, these settings maybe different.
" So maybe you need to change these settings before you use this configuration.
" Special
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let g:ruby_host_prog    = '/home/frank/.gem/ruby/2.7.0/bin/neovim-ruby-host'
" Special

" =============================================
"                Some Settings
" =============================================
let mapleader=" "
" set clipboard=unnamedplus

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set nowrap
set wildmenu
set scrolloff=3
set mouse=a
set encoding=UTF-8
set history=500
let &t_ut=''
set autochdir
set backspace=indent,eol,start
" set foldmethod=indent

autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline

autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \ execute "normal! g`\"" |
            \ endif

" For coc.nvim
set hidden
" set nobackup
" set nowritebackup
set updatetime=300
set shortmess+=c

" Tab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set tw=0
set indentexpr=
set smarttab

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

" Backup
set backup
set swapfile
set undofile
set dir=/home/frank/.config/nvim/.backup
set udir=/home/frank/.config/nvim/.backup
set bdir=/home/frank/.config/nvim/.backup
if !isdirectory('/home/frank/.config/nvim/.backup') && exists('*mkdir')
  call mkdir('/home/frank/.config/nvim/.backup')
endif

" =============================================
"               Some Mappings
" =============================================

" 
noremap S <Nop>
noremap s <Nop>
noremap U <Nop>
noremap D <Nop>
noremap S :w<CR>
noremap Q :q<CR>
noremap R :source $MYVIMRC<CR>
noremap ; :
noremap : ;

noremap H I
noremap h i

noremap U <C-r>
noremap <C-u> <C-i>

"     ^
"     i
" < j   l >
"     k
"     v
" Move the cursor.
noremap i k
noremap k j
noremap j h
noremap I 5k
noremap K 5j
noremap J 8h
noremap L 8l
noremap W 3w
noremap B 3b

noremap <C-j> 0
noremap <C-l> $

noremap <C-i> 3<C-y>
noremap <C-k> 3<C-e>

" Indent.
noremap < <<
noremap > >>
vnoremap < <gv
vnoremap > >gv

" Window management.
noremap sI :set nosplitbelow<CR>:split<CR>
noremap sK :set splitbelow<CR>:split<CR>
noremap sJ :set nosplitright<CR>:vsplit<CR>
noremap sL :set splitright<CR>:vsplit<CR>
noremap si <C-w>k
noremap sk <C-W>j
noremap sj <C-W>h
noremap sl <C-W>l
noremap s<Up> :res +3<CR>
noremap s<Down> :res -3<CR>
noremap s<Left> :vertical resize-5<CR>
noremap s<Right> :vertical resize+5<CR>
noremap srv <C-w>t<C-w>H
noremap srh <C-w>t<C-w>K

" Tabs.
noremap ss :tabedit<CR>
noremap su :-tabnext<CR>
noremap so :+tabnext<CR>
noremap smu :-tabmove<CR>
noremap smo :+tabmove<CR>

" Buffers.
noremap sU :bprevious<CR>
noremap sO :bnext<CR>

" Search.
noremap <Leader><CR> :nohlsearch<CR>
noremap n nzz
noremap N Nzz

" Copy selected text to system clipboard.
vnoremap Y "+y

" Spell Check.
noremap <Leader>sc :set spell!<CR>

" Find a Next '<++>' and Edit it.
noremap <Leader><Leader> <Esc>/<++><CR>:nohlsearch<CR>"_c4l

" ASCII Art (figlet).
noremap <Leader>tx :r !figlet 

" Open MY - NVIMRC.
noremap <Leader>rc :e ~/.config/nvim/init.vim<CR>

" =============================================
"                About Markdown
" =============================================
autocmd Filetype markdown inoremap <Buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <Buffer> ,g <++>
autocmd Filetype markdown inoremap <Buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <Buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <Buffer> ,d ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <Buffer> ,a `` <++><Esc>F`i
autocmd Filetype markdown inoremap <Buffer> ,c ```<CR><++><CR>```<CR><CR><++><Esc>4kA
autocmd Filetype markdown inoremap <Buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <Buffer> ,w [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <Buffer> ,l ---<CR><CR>
autocmd Filetype markdown inoremap <Buffer> ,1 # 
autocmd Filetype markdown inoremap <Buffer> ,2 ## 
autocmd Filetype markdown inoremap <Buffer> ,3 ### 
autocmd Filetype markdown inoremap <Buffer> ,4 #### 
autocmd Filetype markdown inoremap <Buffer> ,5 ##### 
autocmd Filetype markdown inoremap <Buffer> ,6 ###### 

" =============================================
"         Terminal Settings and Styles
" =============================================
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

" =============================================
"               Install Plugins
" =============================================
call plug#begin('/home/frank/.config/nvim/plugged')

Plug 'terryma/vim-multiple-cursors'

Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
" Plug 'junegunn/vim-emoji'
Plug 'junegunn/vim-peekaboo'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
" Plug 'universal-ctags/ctags'

Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'wincent/terminus'

" Markdown
Plug 'dhruvasagar/vim-table-mode'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'mzlogin/vim-markdown-toc'

" NeoVim Styles
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ajmwagar/vim-deus'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mhinz/vim-startify'
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'RRethy/vim-illuminate'
Plug 'Yggdroot/indentLine'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'connorholyday/vim-snazzy'
" Plug 'morhetz/gruvbox'

" Auto change the input method
Plug 'vim-scripts/fcitx.vim'

call plug#end()

" =============================================
"                NeoVim Styles
" =============================================
set t_Co=256
set termguicolors

syntax enable
syntax on
set number
set relativenumber
set showcmd    " show the command
set showmatch
set showmode
set cmdheight=2
set cc=80
set cursorline
set laststatus=2    " always show the statusline
set signcolumn=yes  " always show the sidebar
set showtabline=2   " always show the tabline

set list
set listchars=tab:\|\ ,trail:▫
" | ¦ ┆ ┊

" ===
" === vim-deus
" ===
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark    " Setting dark mode
colorscheme deus
let g:deus_termcolors=256
highlight! NonText ctermfg=gray guifg=grey10
" Use 'seb' to toggle the background opacity.
let g:StylesBOpacity = 1
noremap seb :call StylesBackgroundOpacityToggle()<CR>
function! StylesBackgroundOpacityToggle()
    if g:StylesBOpacity == 1
        execute "hi Normal ctermfg=None ctermbg=None guifg=None guibg=None"
        execute "hi! NonText ctermfg=gray guifg=grey10"
        let g:StylesBOpacity = 0
    else
        execute "colorscheme deus"
        execute "hi! NonText ctermfg=gray guifg=grey10"
        let g:StylesBOpacity = 1
    endif
endfunction
" If you use vim in a terminal that supports italics
" set the environment variable TERM_ITALICS to TRUE
" (i.e. export TERM_ITALICS=true) to enable with vim-deus.

" ===
" === vim-airline
" ===
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
" |        Nice Airline Themes          |
" | ----------------------------------- |
" | dracula        | base16_snazzy      |
" | base16_bright  | base16_chalk       |
" | base16_default | base16_grayscale   |
" | base16_ocean   | base16_summerfruit |
" | gruvbox        | deus               |

" ===
" === rainbow
" ===
let g:rainbow_active = 0   " 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,\|+\|-\|*\|\/\|==\|!=\|=\|>\|<_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}
" Use 'ser' to toggle the Rainbow.
noremap ser :RainbowToggle<CR>

" ===
" === vim-startify
" ===
autocmd TabNewEntered * Startify
let g:startify_padding_left = 20
let s:startify_header = [
            \ ' _                _    __     ___           ',
            \ '| |    ___   __ _(_) __\ \   / (_)_ __ ___  ',
            \ '| |   / _ \ / _` | |/ __\ \ / /| | ''_ ` _ \ ',
            \ '| |__| (_) | (_| | | (__ \ V / | | | | | | |',
            \ '|_____\___/ \__, |_|\___| \_/  |_|_| |_| |_|',
            \ '            |___/                           ',
            \ '                                            ',
            \ '        [ Author:GitHub@LogicSkky ]         ',
            \ ]
let s:startify_footer = [
            \ '----------------------------------------------------------------------------------',
            \ '                                   Enjoy Coding!                                  ',
            \ ]

function! s:Startify_center(lines) abort
    let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
    let centered_lines = map(copy(a:lines),
                \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

let g:startify_custom_header = s:Startify_center(s:startify_header)
let g:startify_custom_footer = s:Startify_center(s:startify_footer)

highlight StartifyBracket guifg=#928374
highlight StartifyFile    guifg=#C678DD
highlight StartifyFooter  guifg=#FE8019
highlight StartifyHeader  guifg=#FE8019
highlight StartifyNumber  guifg=#fabd2f
highlight StartifyPath    guifg=#83A598
highlight StartifySection guifg=#FE8019
highlight StartifySelect  guifg=#FE8019
highlight StartifySlash   guifg=#83A598
highlight StartifySpecial guifg=#2C323B
highlight StartifyVar     guifg=#8EC07C

" ===
" === indentLine
" ===
let g:indentLine_fileType = ['c', 'cpp', 'py', 'vim', 'sh', 'json', 'yaml', 'yml']
let g:indentLine_color_gui = '#000000'
" Use 'sei' to toggle the indentLine.
noremap sei :IndentLinesToggle<CR>

" ===
" === vim-illuminate
" ===
" Use 'seu' to toggle the underline of the word.
noremap seu :IlluminationToggle<CR>
hi illuminatedWord cterm=underline gui=underline

" =============================================
"           Configure about Plugins
" =============================================

" ===
" === ale
" ===
let g:ale_sign_error                 = '✗'
let g:ale_sign_warning               = '⚡'
let g:airline#extensions#ale#enabled = 1

" ===
" === coc.nvim
" ===
let g:coc_global_extensions = ['coc-clangd', 'coc-snippets', 'coc-translator', 'coc-explorer', 'coc-yank', 'coc-python', 'coc-json', 'coc-vimlsp']

" Use tab for trigger completion with characters ahead and navigate.
inoremap <Silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <Silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <Silent> [g <Plug>(coc-diagnostic-prev)
nmap <Silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <Silent> gd <Plug>(coc-definition)
nmap <Silent> gy <Plug>(coc-type-definition)
nmap <Silent> gi <Plug>(coc-implementation)
nmap <Silent> gr <Plug>(coc-references)

" Use D to show documentation in preview window.
nnoremap <Silent> D :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <Leader>rn <Plug>(coc-rename)

" Formatting selected code.
vmap <Leader>f  <Plug>(coc-format-selected)
nmap <Leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
vmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <Leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <Leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
vmap if <Plug>(coc-funcobj-i)
vmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <Silent> <TAB> <Plug>(coc-range-select)
vmap <Silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <Silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <Silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <Silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <Silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <Silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <Silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <Silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <Silent> <space>p  :<C-u>CocListResume<CR>

" == coc-snippets ==
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" == coc-translator ==
" popup
nmap <Leader>l <Plug>(coc-translator-p)
vmap <Leader>l <Plug>(coc-translator-pv)
" echo
nmap <Leader>e <Plug>(coc-translator-e)
vmap <Leader>e <Plug>(coc-translator-ev)
" replace
nmap <Leader>p <Plug>(coc-translator-r)
vmap <Leader>p <Plug>(coc-translator-rv)

" == coc-explorer ==
noremap te :CocCommand explorer<CR>
" ✹ ✚ ✭ ➜ ═ ✖ ✗ ✔︎ ☒ ? 

" == coc-yank ==
noremap ty  :<C-u>CocList -A --normal yank<cr>

" == coc-vimlsp ==
let g:markdown_fenced_languages = [
            \ 'vim',
            \ 'help'
            \]

" ===
" === ctags
" ===
" set tags=./.tags;,.tags

" ===
" === goyo
" ===
noremap tgy :Goyo<CR>
let g:goyo_width  = 95
let g:goyo_height = 95
let g:goyo_linenr = 0

" ===
" === markdown-preview.nvim
" ===
let g:mkdp_auto_start         = 0
let g:mkdp_auto_close         = 0
let g:mkdp_refresh_slow       = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world  = 0
let g:mkdp_open_ip            = ''
" Special
let g:mkdp_browser = 'google-chrome-stable'
" Special
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

" ===
" === rnvimr
" ===
" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1
" Customize the initial layout
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': float2nr(round(0.75 * &columns)),
            \ 'height': float2nr(round(0.75 * &lines)),
            \ 'col': float2nr(round(0.125 * &columns)),
            \ 'row': float2nr(round(0.125 * &lines)),
            \ 'style': 'minimal' }
noremap tr :RnvimrToggle<CR>

" ===
" === vim-markdown-toc
" ===
noremap to :GenTocGFM<CR>

" ===
" === vim-table-mode
" ===
noremap tm :TableModeToggle<CR>

" =============================================
"              Auto Run Programs
" =============================================
noremap r :call CompileRunGcc()<CR>
function! CompileRunGcc()
    execute "w"
    if &filetype == 'c'
        set splitbelow
        execute "!g++ % -o %<"
        :split
        :res -5
        :term ./%<
    elseif &filetype == 'cpp'
        set splitbelow
        execute "!g++ -std=c++11 % -Wall -o %<"
        :split
        :res -5
        :term ./%<
    elseif &filetype == 'python'
        set splitbelow
        :split
        :term python3 %
    elseif &filetype == 'go'
        set splitbelow
        :split
        :term go run %
    elseif &filetype == 'java'
        execute "!javac %"
        execute "!time java %<"
    elseif &filetype == 'markdown'
        execute "MarkdownPreview"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'html'
        silent! execute "!".g:mkdp_browser." % &"
    elseif &filetype == 'tex'
        silent! execute "VimtexStop"
        silent! execute "VimtexCompile"
    elseif &filetype == 'dart'
        CocCommand flutter.run
    endif
endfunction

