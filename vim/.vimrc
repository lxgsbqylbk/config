""""""""""""
"Vundle
""""""""""""

"set nocompatible              " be iMproved, required
"filetype off                  " required
"
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"    " alternatively, pass a path where Vundle should install plugins
"    "call vundle#begin('~/some/path/here')
"
"    " let Vundle manage Vundle, required
"    Plugin 'VundleVim/Vundle.vim'
"
"    " The following are examples of different formats supported.
"    " Keep Plugin commands between vundle#begin/end.
"    " plugin on GitHub repo
"    "Plugin 'tpope/vim-fugitive'
"    " plugin from http://vim-scripts.org/vim/scripts.html
"    "Plugin 'L9'
"    " Git plugin not hosted on GitHub
"    "Plugin 'git://git.wincent.com/command-t.git'
"    " git repos on your local machine (i.e. when working on your own plugin)
"    "Plugin 'file:///home/gmarik/path/to/plugin'
"    " The sparkup vim script is in a subdirectory of this repo called vim.
"    " Pass the path to set the runtimepath properly.
"    "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"    " Install L9 and avoid a Naming conflict if you've already installed a
"    " different version somewhere else.
"    "Plugin 'ascenator/L9', {'name': 'newL9'}
"
"    " All of your Plugins must be added before the following line
"    call vundle#end()            " required
"    filetype plugin indent on    " required
"    " To ignore plugin indent changes, instead use:
"    "filetype plugin on
"    "
"    " Brief help
"    " :PluginList       - lists configured plugins
"    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
"    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"    "
"    " see :h vundle for more details or wiki for FAQ
"    " Put your non-Plugin stuff after this line
"    Bundle 'Valloric/YouCompleteMe'
""Vundle ends

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$" || v:lang =~ "utf-8$"
    set encoding=utf-8
    set fileencodings=utf-8,chinese,GB2312,GBK,GB18030,utf-8,latin1
    set fileencoding=utf-8
    set termencoding=utf-8
endif
runtime! debian.vim
" Configuration file for vim
" set runtimepath=~/.vim,/etc/vim,/usr/share/vim/vimfiles,/usr/share/vim/addons,/usr/share/vim/vim70,/usr/share/vim/vimfiles,/usr/share/vim/addons/after,~/.vim/after

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible        " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing

" Now we set some defaults for the editor 
" set autoindent        " always set autoindenting on
" set linebreak         " Don't wrap words by default
set textwidth=0         " Don't wrap lines by default 
set nobackup            " Don't keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more than
                        " 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=m
  set t_Sb=m
endif

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

if has("autocmd")
 " Enabled file type detection
 " Use the default filetype settings. If you also want to load indent files
 " to automatically do language-dependent indenting add 'indent' as well.
 filetype plugin on

endif " has ("autocmd")
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
  "     " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" Some Debian-specific things
augroup filetype
  au BufRead reportbug.*                set ft=mail
  au BufRead reportbug-*                set ft=mail
augroup END

" Set paper size from /etc/papersize if available (Debian-specific)
try
  if filereadable('/etc/papersize')
    let s:papersize = matchstr(system('/bin/cat /etc/papersize'), '\p*')
    if strlen(s:papersize)
      let &printoptions = "paper:" . s:papersize
    endif
    unlet! s:papersize
  endif
catch /E145/
endtry

" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set incsearch           " Incremental search
"set autowrite          " Automatically save before commands like :next and :make

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

" Colors {{{
set background=dark
hi StatusLine   term=bold,reverse cterm=bold,reverse
hi StatusLineNC term=reverse      cterm=reverse
hi User1        term=inverse,bold cterm=inverse,bold ctermfg=Red
hi User2        term=bold         cterm=bold         ctermfg=Yellow
hi User3        term=inverse,bold cterm=inverse,bold ctermfg=Blue
hi User4        term=inverse,bold cterm=inverse,bold ctermfg=LightBlue
hi User5        term=inverse,bold cterm=inverse,bold ctermfg=Red       ctermbg=Green
hi Folded       term=standout     cterm=bold         ctermfg=Blue      ctermbg=Black
hi FoldColumn   term=standout                        ctermfg=DarkBlue  ctermbg=Black 
hi Comment      term=bold                            ctermfg=DarkCyan
" }}}

set hlsearch
syntax on
set nu
set ts=4
set autoindent
set smartindent
set cindent shiftwidth=4
set softtabstop=4
set expandtab

let Tlist_Exit_OnlyWindow = 1

autocmd FileType make set noexpandtab

func SaveFile()
    :w
endfunc

func SetEncodingUTF8()
    :set enc=utf-8
    :set tenc=gbk
endfunc

func SetEncodingGBK()
    :set enc=gbk
endfunc

func SetList()
    :set list
endfunc

map <F9> :call SaveFile() <CR> 
imap <F9> <Esc>:call SaveFile() <CR>
map <F10> :call SetList() <CR> 
imap <F10> <Esc>:call SetList() <CR>
map <F12> :call SetEncodingGBK() <CR>
imap <F12> <ESC>:call SetEncodingGBK() <CR> 
map <F11> :call SetEncodingUTF8() <CR> 
imap <F11> <ESC>:call SetEncodingUTF8() <CR> 

if has("autocmd")
    "autocmd BufRead *.txt set tw=78
    "autocmd BufReadPost *
    if line("'\"") > 0 && line ("'\"") <= line("$") |
        exe "normal g'\"" |
    endif
endif

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
map <silent> <F9> :TlistToggle<cr>

function NewHeader()
  let i = append(line('.'), "/*********************************************************************")
  let i = append(line('$'), " * $Author: ".$USER." $")
  let i = append(line('$'), " *")
  let i = append(line('$'), " * $LastChangedBy: ".$USER." $")
  let i = append(line('$'), " *")
  let i = append(line('$'), " * $Revision: 2577 $")
  let i = append(line('$'), " *")
  let i = append(line('$'), " * $LastChangedDate: 2011-03-09 09:50:55 +0800 (Wed, 09 Mar 2011) $")
  let i = append(line('$'), " *")
  let i = append(line('$'), " * $Id: ".expand("%:t")." 2577 2011-03-09 01:50:55Z ".$USER." $")
  let i = append(line('$'), " *")
  let i = append(line('$'), " * $Brief: ini file parser $")
  let i = append(line('$'), " ********************************************************************/")
  let i = append(line('$'), "")
  let i = append(line('$'), "#ifndef ".toupper(expand("%:p:h:t"))."_".toupper(expand("%:t:r"))."_H_")
  let i = append(line('$'), "#define ".toupper(expand("%:p:h:t"))."_".toupper(expand("%:t:r"))."_H_")
  let i = append(line('$'), "")
  let i = append(line('$'), toupper(expand("%:p:h:t"))."_BEGIN")
  let i = append(line('$'), "")
  let i = append(line('$'), "class ".expand("%:t:r"))
  let i = append(line('$'), "{ ")
  let i = append(line('$'), "    public:")
  let i = append(line('$'), "        ".expand("%:t:r")."();")
  let i = append(line('$'), "        ~".expand("%:t:r")."();")
  let i = append(line('$'), "};")
  let i = append(line('$'), "")
  let i = append(line('$'), toupper(expand("%:p:h:t"))."_END")
  let i = append(line('$'), "")
  let i = append(line('$'), "#endif //".toupper(expand("%:p:h:t"))."_".toupper(expand("%:t:r"))."_H_")
  unlet i
  normal ggddGO
endfunction
autocmd BufNewFile *.h call NewHeader()
run macros/gdb_mappings.vim 
