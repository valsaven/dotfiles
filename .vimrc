" Commands to run after first setup:
" :PlugInstall
" :CocInstall coc-tsserver @yaegassy/coc-volar coc-css coc-html coc-json coc-eslint coc-prettier

" ===================================================================
" Basic Settings
" ===================================================================
set nocompatible      " Stops Vim from behaving in a strongly Vi-compatible way
set encoding=utf-8              " Internal encoding
set fileencodings=utf-8,koi8-r,cp1251 " Try these encodings when opening files
set undolevels=1000             " Number of changes that can be undone
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set lazyredraw                  " Don't redraw during macros for performance
set backupcopy=yes              " Overwrite file instead of renaming (keeps file ID same for Vite/HMR)


" Fix for modern terminal clipboard support
if has("clipboard")
  set clipboard=unnamed       " Use system clipboard for all yank/delete/put operations
  if has("unnamedplus")
    set clipboard+=unnamedplus " Use '+' register for X11 clipboard support
  endif
endif

" Folding logic
set foldmethod=indent           " Fold based on indentation
set foldlevel=99                " Open all folds by default

" ===================================================================
" Plugins (vim-plug)
" ===================================================================
call plug#begin('~/.vim/plugged')

" Core & UI
Plug 'joshdick/onedark.vim'        " A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme
Plug 'vim-airline/vim-airline'     " Lean & mean status/tabline for Vim that's light as air
Plug 'ryanoasis/vim-devicons'      " Adds file type glyphs/icons

" Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder installation
Plug 'junegunn/fzf.vim'                             " FZF integration for Vim
Plug 'easymotion/vim-easymotion'                    " Vim motions on speed

" Fern File Tree
Plug 'lambdalisue/fern.vim'                         " General purpose asynchronous tree viewer
Plug 'lambdalisue/fern-renderer-nerdfont.vim'       " Better icons for Fern

" Coding Support (LSP & Language)
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Modern IntelliSense & Language Server Protocol
Plug 'tpope/vim-surround'                           " Quoting/parenthesizing made simple
Plug 'tpope/vim-commentary'                         " Comment stuff out with 'gcc' or 'gc'
Plug 'mattn/emmet-vim'                              " Emmet for fast HTML/CSS coding
Plug 'ap/vim-css-color'                             " Highlight colors in CSS/SCSS files

" Git
Plug 'tpope/vim-fugitive'          " A Git wrapper so awesome, it should be illegal
Plug 'airblade/vim-gitgutter'      " Shows a git diff in the gutter (sign column)

call plug#end()

" ===================================================================
" View & UI
" ===================================================================
syntax enable                 " Enable syntax highlighting
filetype plugin indent on     " Enable detection, plugins and indenting for filetypes

"set guifont=Consolas:h12:cRUSSIAN:qDRAFT   " Set font for GUI (GVim)
set guifont=Fira\ Code:h12    " Set font for GUI (GVim)
set t_Co=256                  " Tell Vim the terminal supports 256 colors
set background=dark           " Tell Vim we are using a dark background
colorscheme onedark           " Load the One Dark color scheme

set number                    " Show line numbers
set numberwidth=4             " Set width of the line number column
set ruler                     " Always show cursor position (line, col)
set cursorline                " Highlight the current line for better visibility
set showcmd                   " Display incomplete commands in the status line
set showmatch                 " Briefly jump to matching brackets when typed
set wildmenu                  " Enhanced command-line completion
set mouse=a                   " Enable mouse support in all modes

set nocursorline " DISABLE highlight the current line

" Whitespace visualization
set listchars=eol:¬,nbsp:☠,tab:>-,trail:~,extends:>,precedes:<
set list

" Highlight lines longer than 100 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

" ===================================================================
" Indentation
" ===================================================================
set autoindent       " Copy indent from current line when starting a new one
set tabstop=2        " Number of spaces that a <Tab> counts for
set shiftwidth=2     " Number of spaces to use for each step of (auto)indent
set smarttab         " Use shiftwidth for <Tab> at start of line
set expandtab        " Convert all typed tabs into spaces
set smartindent      " Automatically insert extra indent in some cases (e.g., after '{')

" ===================================================================
" Search
" ===================================================================
set hls              " Highlight all search matches
set nohlsearch       " Clear highlight after finishing search
set incsearch        " Start searching as soon as characters are typed
set ignorecase       " Ignore case in search patterns
set smartcase        " Override the 'ignorecase' option if the search pattern contains upper case characters.

" ===================================================================
" Keybindings
" ===================================================================
" F2 - Save changes
nnoremap <F2> :w<CR>
inoremap <F2> <Esc>:w<CR>

" F3 - Toggle Fern file tree (revealing current file)
nnoremap <silent> <F3> :Fern . -drawer -toggle -reveal=% -width=35<CR>

" F4 - Previous buffer
nnoremap <F4> :bprevious<CR>
inoremap <F4> <Esc>:bprevious<CR>i

" F5 - Next buffer
nnoremap <F5> :bnext<CR>
inoremap <F5> <Esc>:bnext<CR>i

" F8 - Folding
nnoremap <F8> za
inoremap <F8> <C-O>za
vnoremap <F8> zf

" F10 - Simple menu (Exit/Save)
set wcm=<Tab>
menu Exit.quit :quit<CR>
menu Exit.quit! :quit!<CR>
menu Exit.save :exit<CR>
nnoremap <F10> :emenu Exit.<Tab>

" F12 - Fix syntax problems
nnoremap <F12> :syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" Ctrl+P - Fuzzy find files (via FZF)
nnoremap <C-p> :FZF<CR>

" Ctrl+L - Refresh screen and clear search highlight
nnoremap <C-L> :noh<CR><C-L>
inoremap <C-L> <Esc>:noh<CR><C-L>i

" ===================================================================
" Plugin Specific Config
" ===================================================================

" Airline (buffers as tabs)
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Fern
let g:fern#renderer = "nerdfont"     " Use nerdfont for file icons
let g:fern#default_hidden = 1        " Show hidden files by default

" coc.nvim (LSP for Vue/JS/SCSS) Core Settings
set hidden            " Required for operations on multiple buffers
set nobackup          " Recommended by CoC for better performance
set nowritebackup
set updatetime=300    " Faster diagnostic messages
set signcolumn=yes    " Always show the signcolumn (gutter)

" CoC Tab Completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" CoC Enter to confirm
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" LSP Navigation Mappings
nmap <silent> gd <Plug>(coc-definition)                 " Go to definition
nmap <silent> gy <Plug>(coc-type-definition)            " Go to type definition
nmap <silent> gi <Plug>(coc-implementation)             " Go to implementation
nmap <silent> gr <Plug>(coc-references)                 " Find references
nnoremap <silent> K :call CocActionAsync('doHover')<CR> " Show documentation in preview window

" LSP Diagnostics navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)  " Go to previous error/warning
nmap <silent> ]g <Plug>(coc-diagnostic-next)  " Go to next error/warning

" LSP Code Actions (Rename & Format)
nmap <leader>rn <Plug>(coc-rename)            " Symbol renaming
xmap <leader>f  <Plug>(coc-format-selected)   " Format selected code
nmap <leader>f  <Plug>(coc-format-selected)   " Format current buffer/selection
