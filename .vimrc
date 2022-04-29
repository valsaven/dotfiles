" "Basic"                Базовые настройки
" ===================================================================
set nocompatible      " Stops Vim from behaving in a strongly Vi-compatible way

" Настроки для печати и отображения кириллицы
set encoding=utf-8                      " set charset translation encoding
let g:airline_powerline_fonts = 1
set termencoding=utf-8                  " set terminal encoding
set fileencodings=utf-8,koi8-r,cp1251   " Список предполагаемых кодировок, в порядке предпочтения

" Максимальное количество изменений, которые могут быть отменены
set undolevels=1000

" Backspace работает в привычном режиме
set backspace=indent,eol,start

" Ленивая перерисовка экрана при выполнении скриптов
set lz

" Стратегия сохранения для нормальной работы Webpack HMR
set backupcopy=yes

" При копировании использовать системный буфер
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" Отступы по вложенности
set foldmethod=indent
set foldlevel=99

" "Plugins"                Плагины и дополнения
" ===================================================================
filetype off  " Required

call plug#begin('~/.vim/plugged')

" Plugins list
Plug 'Chiel92/vim-autoformat'                  " Provide easy code formatting in Vim by integrating existing code formatters.
Plug 'ap/vim-buftabline'                       " Forget Vim tabs – now you can have buffer tabs
Plug 'vim-airline/vim-airline'                       " Lean & mean status/tabline for Vim that's light as air
Plug 'easymotion/vim-easymotion'               " Vim motions on speed
Plug 'kien/ctrlp.vim'                          " Fuzzy file, buffer, mru, tag, etc finder
Plug 'kshenoy/vim-signature'                   " Plugin to toggle, display and navigate marks
Plug 'nathanaelkane/vim-indent-guides'         " Indent Guides is a plugin for visually displaying indent levels in Vim
Plug 'scrooloose/nerdcommenter'                " Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdtree'                     " A tree explorer plugin for Vim
Plug 'sjl/gundo.vim'                           " Visualize your Vim undo tree
Plug 'tpope/vim-surround'                      " Surround.vim: quoting/parenthesizing made simple
Plug 'xolox/vim-misc'                          " Miscellaneous auto-load Vim scripts
Plug 'xolox/vim-session'                       " Extended session management for Vim (:mksession on steroids)
Plug 'flowtype/vim-flow'                       " A vim plugin for Flow
Plug 'mattn/emmet-vim'                         " emmet for vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mileszs/ack.vim'                         " Vim plugin for the Perl module / CLI script 'ack'
Plug 'ap/vim-css-color'                        " Highlight colors in css files
Plug 'posva/vim-vue'                           " Syntax Highlight for Vue.js components
Plug 'airblade/vim-gitgutter'                 " A Vim plugin which shows a git diff in the gutter
Plug 'mhinz/vim-signify'                       " Show a diff using Vim its sign column.
Plug 'tpope/vim-fugitive'                      " fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'ryanoasis/vim-devicons'                  " Adds file type glyphs/icons
Plug 'cakebaker/scss-syntax.vim'
Plug 'w0rp/ale'                                " Asynchronous Lint Engine 
Plug 'vim-syntastic/syntastic'                 " Syntax checking hacks for vim
Plug 'neovimhaskell/haskell-vim'               " Custom Haskell Vimscripts
Plug 'tpope/vim-eunuch'                        " eunuch.vim: helpers for UNIX
Plug 'lambdalisue/fern.vim'                    " Fern (furn) is a general purpose asynchronous tree viewer written in pure Vim script.

" Color Themes
Plug 'joshdick/onedark.vim'            " A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme

call plug#end()

" Показать скрытые файлы в NERD Tree
let NERDTreeShowHidden=1

" Скрипт для закрытия NERD Tree при закрытии последнего файла
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction

autocmd WinEnter * call NERDTreeQuit()

" View the current buffer in NERDTree
map <leader>r :NERDTreeFind<cr>

" Default JavaScript libraries
"let g:used_javascript_libs = 'vue'
" Disable checking for prepocessors
let g:vue_disable_pre_processors=1

autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.sass.scss.css


" "View"                Вид
" ===================================================================
" Установка шрифта
"set guifont=Consolas:h12:cRUSSIAN:qDRAFT
set guifont=Fira\ Code:h12

" Автоматическая подсветка синтаксиса
syntax enable

filetype plugin indent on

" Terminator pre-settings
set t_Co=256
set background=dark

" Set color scheme
colorscheme onedark

" Enables HTML/CSS syntax highlighting in your JavaScript file.
let g:javascript_enable_domhtmlcss = 1

" Отображение номеров строк
set number
set numberwidth=4

" Показываем табы в начале строки точками
set listchars=tab:··
set list

" Отображения позиции курсора (всё время)
set ruler

" Подсветка текущей позиции курсора
set cursorline

" Отображение выполняемой команды
set showcmd

" Показывать совпадающую скобку
set showmatch

" Показывать пробелы
"set listchars=eol:¬,nbsp:☠,tab:>·,trail:~,extends:>,precedes:<,space:.
set listchars=eol:¬,nbsp:☠,tab:>-,trail:~,extends:>,precedes:<
set list

" Отключить подсветку активной строки
set cul!

" Подсвечивать всё, что больше 100 символов
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

" Отключение автосохранения и автозагрузки сессий
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" "Indent"                Отступы и табуляция
" ===================================================================
set autoindent      " Наследовать отступы предыдущей строки
set tabstop=2       " Количество пробелов, которыми символ табуляции отображается в тексте
set shiftwidth=2    " Размер табуляции по умолчанию
set smarttab        " Нажатие Tab в начале строки приведет к добавлению отступа
set expandtab       " Преобразовывать таб в пробелы
set smartindent     " Включить 'умные' отступы

" Подсветка отступов плагином по \ig
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" "Search"                Поиск текста
" ===================================================================
" Подсвечивать поиск
set hls

" Подсветка слов при поиске
set nohlsearch

" Использовать поиск по мере набора
set incsearch

" Использовать регистронезависимый поиск
set ignorecase

" "Menu"                Горячие клавиши и меню
" ===================================================================
" Go to File... (Ctrl+P)
map <c-p> :FZF<CR>

" Ctrl + L - Refresh screen
imap <C-L> <Esc>:redraw!<CR>
map <C-L> <Esc>:redraw!<CR>

" F2 - Сохранение изменений
imap <F2> <Esc>:w<CR>
map <F2> <Esc>:w<CR>

" F3 - Включение и отключение NERD Tree
map <F3> :NERDTreeToggle<CR>

" F4 - Переключение вкладок справа-налево
imap <F4> <Esc> :bprev <CR>i
map <F4> :bprev <CR>

" F5 - Переключение вкладок слева-направо
imap <F5> <Esc> :bnext <CR>i
map <F5> :bnext <CR>

" F6 - Переключение вкладок справа-налево
imap <F6> <Esc> :lprev <CR>i
map <F6> :lprev <CR>

" F7 - Переключение вкладок слева-направо
imap <F7> <Esc> :lnext <CR>i
map <F7> :lnext <CR>

" F8 - Переключение вложенностей
inoremap <F8> <C-O>za
nnoremap <F8> za
onoremap <F8> <C-C>za
vnoremap <F8> zf

" Включение расширенного режима дополнения
set wildmenu

" F10 - Пользовательское меню
set wcm=<Tab>
menu Exit.quit     :quit<CR>
menu Exit.quit!    :quit!<CR>
menu Exit.save     :exit<CR>
map <F10> :emenu Exit.<Tab>

" F12 - Fix syntax problems
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

