"  ____  _                 _    __     ___           
" / ___|(_)_ __ ___  _ __ | | __\ \   / (_)_ __ ___  
" \___ \| | '_ ` _ \| '_ \| |/ _ \ \ / /| | '_ ` _ \ 
"  ___) | | | | | | | |_) | |  __/\ V / | | | | | | |
" |____/|_|_| |_| |_| .__/|_|\___| \_/  |_|_| |_| |_|
"                   |_|                              

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
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

let mapleader="\<space>"
" set clipboard=unnamedplus

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
execute "nohlsearch"
set hlsearch
set incsearch
set ignorecase
set smartcase

" Backup
set backup
set swapfile
set undofile
set backupdir=$HOME/.config/nvim/cache/backup
set directory=$HOME/.config/nvim/cache/swap
set undodir=$HOME/.config/nvim/cache/undo

" =============================================
"               Some Mappings
" =============================================

" Best basic.
noremap s <Nop>
noremap D <Nop>
noremap <Leader>fs :w<CR>
noremap <Leader>fq :q<CR>
noremap ; :
noremap : ;

noremap U <C-r>

"     ^
"     k
" < h   l >
"     j
"     v
" Move the cursor.
noremap H 8h
noremap J 5j
noremap K 5k
noremap L 8l
noremap W 3w
noremap B 3b

inoremap <M-h> <left>
inoremap <M-j> <down>
inoremap <M-k> <up>
inoremap <M-l> <right>

noremap <C-h> 0
noremap <C-l> g_

noremap <C-k> 3<C-y>
noremap <C-j> 3<C-e>

" Indent.
noremap < <<
noremap > >>
vnoremap < <gv
vnoremap > >gv

" Window management.
noremap <Leader>wK :set nosplitbelow<CR>:split<CR>
noremap <Leader>wJ :set splitbelow<CR>:split<CR>
noremap <Leader>wH :set nosplitright<CR>:vsplit<CR>
noremap <Leader>wL :set splitright<CR>:vsplit<CR>
noremap <Leader>wk <C-w>k
noremap <Leader>wj <C-W>j
noremap <Leader>wh <C-W>h
noremap <Leader>wl <C-W>l
noremap <Leader>w<Up> :res +3<CR>
noremap <Leader>w<Down> :res -3<CR>
noremap <Leader>w<Left> :vertical resize-5<CR>
noremap <Leader>w<Right> :vertical resize+5<CR>
noremap <Leader>wrv <C-w>t<C-w>H
noremap <Leader>wrh <C-w>t<C-w>K

" Tabs.
noremap <Leader>wn :tabedit<CR>
noremap <Leader>wu :-tabnext<CR>
noremap <Leader>wi :+tabnext<CR>
noremap <Leader>wmu :-tabmove<CR>
noremap <Leader>wmi :+tabmove<CR>

" Buffers.
noremap <Leader>wU :bprevious<CR>
noremap <Leader>wI :bnext<CR>

" Search.
noremap <Leader><CR> :nohlsearch<CR>
noremap n nzz
noremap N Nzz

" Copy selected text to system clipboard.
vnoremap Y "+y

" Spell Check.
noremap <Leader>ts :set spell!<CR>

" Find a Next '<++>' and Edit it.
noremap <Leader><Leader> <Esc>/<++><CR>:nohlsearch<CR>"_c4l

" =============================================
"               Install Plugins
" =============================================
call plug#begin('$HOME/.config/nvim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
"-Plug 'tpope/vim-surround'

"-Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"-Plug 'mbbill/undotree'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'kristijanhusak/defx-git'
" Plug 'kristijanhusak/defx-icons'

"-Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align'
" Plug 'junegunn/vim-emoji'

Plug 'airblade/vim-gitgutter'
"-Plug 'tpope/vim-fugitive'
"-Plug 'easymotion/vim-easymotion'
" Plug 'universal-ctags/ctags'

" Coding
Plug 'dense-analysis/ale'
"-Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Terminal
Plug 'voldikss/vim-floaterm'
" Plug 'wincent/terminus'

" Markdown
Plug 'dhruvasagar/vim-table-mode'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'mzlogin/vim-markdown-toc'

" Auto change the input method
Plug 'vim-scripts/fcitx.vim'

" NeoVim Styles
Plug 'joshdick/onedark.vim'
Plug 'mhinz/vim-startify'
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'RRethy/vim-illuminate'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'psliwka/vim-smoothie'

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
set cmdheight=3
set cc=80
set cursorline
set showcmd    " show the command
set showmatch
set noshowmode
set laststatus=2    " always show the statusline
set showtabline=2   " always show the tabline
set signcolumn=yes  " always show the sidebar

set list
set listchars=tab:\|\ ,trail:▫
" Some signs.
" | ¦ ┆ ┊ ▫ ▫ ┊ ┆ ¦ |

" ===
" === onedark.vim
" ===
colorscheme onedark
" Use 'seb' to toggle the background opacity.
noremap <Leader>tsb :call StylesBackgroundOpacityToggle()<CR>
let g:StylesBOpacity = 0
function! StylesBackgroundOpacityToggle()
    if g:StylesBOpacity == 0
        execute "highlight Normal ctermfg=None ctermbg=None guifg=None guibg=None"
        set nocursorline
        set cc=0
        let g:StylesBOpacity = 1
    else
        execute "colorscheme onedark"
        set cursorline
        set cc=80
        let g:StylesBOpacity = 0
    endif
endfunction

" ===
" === vim-airline
" ===
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'
" " Nice Airline Themes
" " dracula base16_snazzy base16_bright  base16_chalk base16_default
" " base16_grayscale base16_ocean base16_summerfruit gruvbox deus

" ===
" === rainbow
" ===
let g:rainbow_active = 0   " 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,\|%\|+\|-\|*\|\/\|==\|!=\|=\|>\|<_',
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
noremap <Leader>tsr :RainbowToggle<CR>

" ===
" === vim-startify
" ===
let g:startify_padding_left = 25
let s:startify_header = [
            \ ' ____  _                 _    __     ___           ',
            \ '/ ___|(_)_ __ ___  _ __ | | __\ \   / (_)_ __ ___  ',
            \ '\___ \| | ''_ ` _ \| ''_ \| |/ _ \ \ / /| | ''_ ` _ \ ',
            \ ' ___) | | | | | | | |_) | |  __/\ V / | | | | | | |',
            \ '|____/|_|_| |_| |_| .__/|_|\___| \_/  |_|_| |_| |_|',
            \ '                  |_|                              ',
            \ '                                                   ',
            \ '            [ Author:GitHub@logicskky ]            ',
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

" For onedark.vim.
highlight StartifyBracket guifg=#ABB2BF
highlight StartifyFile    guifg=#E06C75
highlight StartifyFooter  guifg=#E5C07B
highlight StartifyHeader  guifg=#E5C07B
highlight StartifyNumber  guifg=#E5C07B
highlight StartifyPath    guifg=#61AFEF
highlight StartifySection guifg=#C678DD
highlight StartifySelect  guifg=#C678DD
highlight StartifySlash   guifg=#61AFEF
highlight StartifySpecial guifg=#5C6370
highlight StartifyVar     guifg=#98C379

" For vim-deus.
"-highlight StartifyBracket guifg=#83A598
"-highlight StartifyFile    guifg=#FB4934
"-highlight StartifyFooter  guifg=#FE8019
"-highlight StartifyHeader  guifg=#FE8019
"-highlight StartifyNumber  guifg=#fabd2f
"-highlight StartifyPath    guifg=#83A598
"-highlight StartifySection guifg=#FE8019
"-highlight StartifySelect  guifg=#FE8019
"-highlight StartifySlash   guifg=#83A598
"-highlight StartifySpecial guifg=#2C323B
"-highlight StartifyVar     guifg=#8EC07C

" ===
" === indentLine
" ===
let g:indentLine_fileType = ['c', 'cpp', 'lua', 'py', 'vim', 'sh', 'json', 'yaml', 'yml']
let g:indentLine_color_gui = '#000000'
" Use 'sei' to toggle the indentLine.
noremap <Leader>tsi :IndentLinesToggle<CR>

" ===
" === vim-illuminate
" ===
highlight illuminatedWord cterm=underline gui=underline
let g:Illuminate_ftblacklist = ['defx']
let g:Illuminate_delay = 250
" Use 'seu' to toggle the underline of the word.
noremap <Leader>tsu :IlluminationToggle<CR>

" =============================================
"         Terminal Settings and Styles
" =============================================
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
" dracula colorscheme for terminal
"-let g:terminal_color_0  = '#000000'
"-let g:terminal_color_1  = '#FF5555'
"-let g:terminal_color_2  = '#50FA7B'
"-let g:terminal_color_3  = '#F1FA8C'
"-let g:terminal_color_4  = '#BD93F9'
"-let g:terminal_color_5  = '#FF79C6'
"-let g:terminal_color_6  = '#8BE9FD'
"-let g:terminal_color_7  = '#BFBFBF'
"-let g:terminal_color_8  = '#4D4D4D'
"-let g:terminal_color_9  = '#FF6E67'
"-let g:terminal_color_10 = '#5AF78E'
"-let g:terminal_color_11 = '#F4F99D'
"-let g:terminal_color_12 = '#CAA9FA'
"-let g:terminal_color_13 = '#FF92D0'
"-let g:terminal_color_14 = '#9AEDFE'

" =============================================
"           Configure about Plugins
" =============================================

" ===
" === ale
" ===
"-let g:ale_sign_error                 = '✗'
"-let g:ale_sign_warning               = '⚡'
let g:airline#extensions#ale#enabled = 1

" ===
" === coc.nvim
" ===
let g:coc_global_extensions = [
            \ 'coc-clangd',
            \ 'coc-python',
            \ 'coc-vimlsp',
            \ 'coc-json',
            \ 'coc-translator',
            \ 'coc-yank'
            \ ]

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
"-nmap <silent> [g <Plug>(coc-diagnostic-prev)
"-nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use 'D' to show documentation in preview window.
nnoremap <silent> D :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
"-autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <Leader>rn <Plug>(coc-rename)

" Formatting selected code.
"-vmap <Leader>f  <Plug>(coc-format-selected)
"-nmap <Leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"-vmap <Leader>a  <Plug>(coc-codeaction-selected)
"-nmap <Leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
"-nmap <Leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"-nmap <Leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"-vmap if <Plug>(coc-funcobj-i)
"-vmap af <Plug>(coc-funcobj-a)
"-omap if <Plug>(coc-funcobj-i)
"-omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
"-nmap <silent> <TAB> <Plug>(coc-range-select)
"-vmap <silent> <TAB> <Plug>(coc-range-select)

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
"-nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"-nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"-nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"-nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"-nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"-nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"-nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"-nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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

" == coc-yank ==
noremap <Leader>ty  :<C-u>CocList -A --normal yank<CR>

" ===
" === ctags
" ===
" set tags=./.tags;,.tags

" ===
" === defx.nvim
" ===
noremap <silent> <Leader>td :Defx -split=vertical -winwidth=30 -direction=topleft<CR>
call defx#custom#column('icon', {
            \ 'directory_icon': '▸',
            \ 'opened_icon': '▾',
            \ 'root_icon': ' ',
            \ })
call defx#custom#column('filename', {
            \ 'min_width': 40,
            \ 'max_width': 40,
            \ })
call defx#custom#column('mark', {
            \ 'readonly_icon': '✗',
            \ 'selected_icon': '✓',
            \ })

autocmd FileType defx set cursorline
autocmd FileType defx call s:Defx_mappings()
function! s:Defx_mappings() abort
    nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
    nnoremap <silent><buffer><expr> c defx#do_action('copy')
    nnoremap <silent><buffer><expr> m defx#do_action('move')
    nnoremap <silent><buffer><expr> p defx#do_action('paste')
    nnoremap <silent><buffer><expr> l defx#do_action('open')
    nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> o defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d defx#do_action('remove')
    nnoremap <silent><buffer><expr> r defx#do_action('rename')
    nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
    nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction

" ===
" === goyo
" ===
noremap <silent><Leader>tg :Goyo<CR>:highlight! NonText ctermfg=gray guifg=grey10<CR>
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
let g:mkdp_browser            = 'firefox'
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
" let g:rnvimr_ex_enable = 1
" Customize the initial layout
" let g:rnvimr_layout = { 'relative': 'editor',
"             \ 'width': float2nr(round(0.75 * &columns)),
"             \ 'height': float2nr(round(0.75 * &lines)),
"             \ 'col': float2nr(round(0.125 * &columns)),
"             \ 'row': float2nr(round(0.125 * &lines)),
"             \ 'style': 'minimal' }
" noremap tr :RnvimrToggle<CR>

" ===
" === vim-easy-align
" ===
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ===
" === vim-floaterm
" ===
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
noremap <Leader>tr :FloatermNew ranger<CR>
noremap <Leader>tl :FloatermNew lazygit<CR>

" ===
" === vim-gitgutter
" ===
" let g:gitgutter_sign_added = '│'
" let g:gitgutter_sign_modified = '│'
" let g:gitgutter_sign_removed = '│'
" let g:gitgutter_sign_removed_first_line = '│'
" let g:gitgutter_sign_modified_removed = '│'

let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'

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
noremap <Leader>fr :call CompileRunGcc()<CR>
function! CompileRunGcc()
    execute "w"
    if &filetype == 'c'
        set splitbelow
        execute "!g++ % -o %<"
        :split
        :res -5
        :terminal ./%<
    elseif &filetype == 'cpp'
        set splitbelow
        execute "!g++ -std=c++11 % -Wall -o %<"
        :split
        :res -5
        :terminal ./%<
    elseif &filetype == 'python'
        set splitbelow
        :split
        :terminal python3 %
    elseif &filetype == 'go'
        set splitbelow
        :split
        :terminal go run %
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

