" "Basic"                Базовые настройки
" ===================================================================
set nocompatible      " Stops Vim from behaving in a strongly Vi-compatible way

" Настроки для печати и отображения кириллицы
set encoding=utf-8                      " set charset translation encoding
set termencoding=utf-8                  " set terminal encoding
set fileencodings=utf-8,koi8-r,cp1251   " Список предполагаемых кодировок, в порядке предпочтения

" Максимальное количество изменений, которые могут быть отменены
set undolevels=1000

" Backspace работает в привычном режиме
set backspace=indent,eol,start

" Ленивая перерисовка экрана при выполнении скриптов
set lz

" Автосохранение и автозагрузка последней сессии
:let g:session_autosave = 'yes'
:let g:session_autoload = 'yes'


" "Plugins"                Плагины и дополнения
" ===================================================================
filetype off  " Required

call plug#begin('~/.vim/plugged')

" Plugins list
Plug 'Chiel92/vim-autoformat'                  " Provide easy code formatting in Vim by integrating existing code formatters.
Plug 'ap/vim-buftabline'                       " Forget Vim tabs – now you can have buffer tabs
Plug 'bling/vim-airline'                       " Lean & mean status/tabline for Vim that's light as air
Plug 'easymotion/vim-easymotion'               " Vim motions on speed
Plug 'kien/ctrlp.vim'                          " Fuzzy file, buffer, mru, tag, etc finder
Plug 'kshenoy/vim-signature'                   " Plugin to toggle, display and navigate marks
Plug 'nathanaelkane/vim-indent-guides'         " Indent Guides is a plugin for visually displaying indent levels in Vim
Plug 'othree/javascript-libraries-syntax.vim'  " Syntax for JavaScript libraries
Plug 'scrooloose/nerdcommenter'                " Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdtree'                     " A tree explorer plugin for Vim
Plug 'sheerun/vim-polyglot'                    " A solid language pack for Vim
Plug 'sjl/gundo.vim'                           " Visualize your Vim undo tree
Plug 'tpope/vim-surround'                      " Surround.vim: quoting/parenthesizing made simple
Plug 'xolox/vim-misc'                          " Miscellaneous auto-load Vim scripts
Plug 'xolox/vim-session'                       " Extended session management for Vim

" Color Themes
Plug 'blueshirts/darcula'              " VIM Darcula Theme
Plug 'juanedi/predawn.vim'             " Predawn theme for Vim

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
let g:used_javascript_libs = 'jquery,lodash,angularjs,angularuirouter'


" "View"                Вид
" ===================================================================
" Установка шрифта
set guifont=Consolas:h12:cRUSSIAN:qDRAFT

" Автоматическая подсветка синтаксиса
syntax enable

" Установка темы
colorscheme predawn

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


" "Indent"                Отступы и табуляция
" ===================================================================
set autoindent      " Наследовать отступы предыдущей строки
set tabstop=4       " Количество пробелов, которыми символ табуляции отображается в тексте
set shiftwidth=4    " Размер табуляции по умолчанию
set smarttab        " Нажатие Tab в начале строки приведет к добавлению отступа
set expandtab       " Преобразовывать таб в пробелы
set smartindent     " Включить 'умные' отступы

" Подсветка отступов плагином по \ig
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1


" "Search"                Поиск текста
" ===================================================================
" Подсвечивать поиск
set hls

" Подсветка слов при поиске
set nohlsearch

" Использовать поиск по мене набора
set incsearch

" Использовать регистронезависимый поиск
set ignorecase


" "Menu"                Горячие клавиши и меню
" ===================================================================
" F2 - Сохранение изменений
imap <F2> <Esc>:w<CR>
map <F2> <Esc>:w<CR>

" F3 - Включение и отключение NERD Tree
map <F3> :NERDTreeToggle<CR>
nnoremap <F7> :GundoToggle<CR>

" F5 - Переключение вкладок справа-налево
imap <F5> <Esc> :bprev <CR>i
map <F5> :bprev <CR>

" F6 - Переключение вкладок слева-направо
imap <F6> <Esc> :bnext <CR>i
map <F6> :bnext <CR>

" F9 - Пользовательское меню
set wildmenu
set wcm=<Tab>
menu Exec.Python  :!python % <CR>
menu Exec.Perl    :!perl % <CR>
menu Exec.Ruby    :!ruby % <CR>
menu Exec.bash      :!/bin/bash<CR>
menu Exec.cmd     :!cmd % <CR>
map <F9> :emenu Exec.<Tab>

" F10 - Пользовательское меню
set wildmenu
set wcm=<Tab>
menu Exit.quit     :quit<CR>
menu Exit.quit!    :quit!<CR>
menu Exit.save     :exit<CR>
map <F10> :emenu Exit.<Tab>
