set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

" tpope
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'


" for repl 
Plug 'jpalardy/vim-slime' 

" grep
Plug 'jremmen/vim-ripgrep'

" navigation, buffers
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'

" language file support
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'wlangstroth/vim-racket', { 'for' : 'racket' }
"Plug 'lervag/vimtex'

" looks
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'

" less distraction while writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" for writing
Plug 'vimwiki/vimwiki'

" IDE
"Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
"Plug 'dense-analysis/ale'

call plug#end()

filetype plugin indent on

"general stuff
syntax on
set number
set relativenumber
set hlsearch
set smartcase
set encoding=utf-8
set splitbelow
set splitright
set scrolloff=8
set noswapfile
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set cmdheight=2

" Keep undo history across sessions, by storing in file.
"silent !mkdir /tmp/.vim/backups > /dev/null 2>&1
set undodir=/tmp/.vim/backups
set undofile

set updatetime=300
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"""Bindings

" easier window movement
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" theme
set termguicolors
set background=dark
colorscheme gruvbox

"<<< bindings >>>
imap jj <Esc>
let mapleader="\<Space>"
let maplocalleader="\\"

" copy to clipboard

nnoremap <leader>yy "+yy
nnoremap <leader>y$ "+y$

" noh switch off
nnoremap <C-n> :nohl<CR><C-l>

" quicker save
nnoremap <Leader>k :w<CR>

" enable hotkeys for russian layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" fzf bindings
nnoremap <leader>fd :Files ~/Documents/<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fo :Files ~/Dropbox/<CR>

" bufexp bindings

nnoremap <leader>b :BufExplorer<CR>

" fast compilation of .rmd documents

autocmd FileType rmarkdown nnoremap <F5> :RMarkdown beamer latex_engine="xelatex"<CR>
autocmd FileType rmarkdown nnoremap <F6> :RMarkdown html<CR>

""" Other stuff

" ripgrep
let g:rg_binary = 'rg'
let g:rg_command = g:rg_binary . ' --type-not html --vimgrep'

" <<< filetype specifics>>>

let g:pandoc#formatting#mode = "s"
let g:pandoc#keyboard#display_motions = 0
let g:pandoc#modules#disabled = ["spell", "folding"]
let g:pandoc#syntax#codeblocks#embeds#langs = ["js=javascript", "ruby", "python", "lisp", "c", "bash=sh"]

" tmux and slime
let g:slime_target = "tmux"

"""SNIPPETS
" ultisnips
let g:UltiSnipsExpandTrigger="<c-h>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["~/.config/nvim/mysnippets"]

" vimwiki stuff
let g:vimwiki_list = [{'path': '~/Documents/my_wiki/work.wiki', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/Documents/my_wiki/study.wiki', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/Documents/my_wiki/personal.wiki', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/Documents/my_wiki/to_do.wiki', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/Documents/my_wiki/linux.wiki', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/Documents/my_wiki/linux_maintain.wiki', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/Documents/my_wiki/centos.wiki', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/Documents/my_wiki/A+.wiki', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/Documents/my_wiki/Thesis.wiki', 'syntax' : 'markdown', 'ext': '.md'}]

" to avoid conflicts between pandoc markdown and wiki markdown
au FileType vimwiki set syntax=pandoc

" nerdtree
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" coc config; not using ale?
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json',
  \ 'coc-pyright'
  \ ]

" formatting on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" move later
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab
