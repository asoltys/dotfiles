set shell=/bin/bash\ -i
call pathogen#infect()
call pathogen#helptags()

let mapleader = ","
let g:ctrlp_map = '<c-f>'
map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>
map ,cd :cd %:p:h<CR>
map ,f :let g:fuzzy_roots=[getcwd()]<CR>:ruby @finder=nil<CR>
nmap <silent> <leader>s :set nolist!<CR>
nnoremap <C-q> :bn <bar> bw #<CR>
nnoremap <C-s> :w!<CR>
inoremap <C-s> <Esc>:w!<CR>
noremap <C-e><C-v> :e ~/.vimrc<CR>
nnoremap <C-l> :so ~/.vimrc<CR>
noremap <C-y> <C-r>
noremap <C-n> :bnext<CR>
noremap <C-p> :bprev<CR>
noremap <C-g> :Ack<space>
noremap <C-f> :CtrlP<CR>
noremap <C-b> :CtrlPBuffer<CR>
nnoremap Q :CtrlPMRU<CR>
nnoremap <C-x> :BufOnly<CR>
noremap <C-z> :NERDTreeToggle<CR>
inoremap <C-z> <Esc>dbxi
inoremap <lt>/ </<C-X><C-O>
inoremap <lt>, </<C-X><C-O><Esc>v<<
vnoremap <C-c> "+y
vnoremap <C-b> :s/^/# <CR>
vnoremap <C-d> :s/^# //<CR>
nnoremap <C-m> <C-v>
noremap <C-v> "+p
inoremap <C-v> <Esc>"+pa
nnoremap <C-h> :vert bel help<Space>
nnoremap ' `
nnoremap ` '
inoremap <M-o> <Esc>o
inoremap <C-j> <Down>
inoremap <C-k> <Up>
nnoremap <C-CR> i<CR><Esc>
inoremap <C-CR> <CR><CR><Up><Tab>
" nnoremap <C-a> ggvG$
nnoremap <C-e> <C-q>
nnoremap <S-Left> <C-W>h
nnoremap <S-Right> <C-W>l
nnoremap <S-Up> <C-W>k
nnoremap <S-Down> <C-W>j
nnoremap <M-z> :NERDTree %:p:h<CR>
nnoremap K Jx
inoremap jj <Esc>
noremap qp mqGo<Esc>"qp
noremap qd G"qdd`q
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O
nnoremap H <C-W>h
nnoremap L <C-W>l
nnoremap > >>
nnoremap < <<

" GENERAL SETTINGS

set nocp
set ruler
set listchars=tab:>-,trail:·,eol:$
set shortmess=atI
set cmdheight=2
set visualbell
set statusline+=\ %{getline('.')[col('.')-1]},\ %b,\ 0x%B
set number
set hidden
set history=1000
set wrap

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar

set wildignore+=*.o,*.obj,.git,node_modules

syntax on
filetype plugin on
au BufNewFile,BufRead *.ru set filetype=ruby
au BufNewFile,BufRead *.json set filetype=php
autocmd FileType cf set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ruby set omnifunc=rubycomplete#CompleteTags

" THEME

set t_Co=256
set background=light
set guifont=DejaVu\ Sans\ Mono\ 12
if has('gui_running')
  colorscheme base16-default-dark
else
  colorscheme ir_black
endif

if filereadable(expand("~/.vimrc_background"))
let base16colorspace=256
  source ~/.vimrc_background
endif

" BACKUPS

set nobackup
set nowritebackup
set noswapfile
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

" INDENTING

" set smartindent
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set bs=2
set backspace=indent,eol,start
filetype indent on

" SEARCHING

set gp=grep\ -nr
set ignorecase
set smartcase
set title
set scrolloff=3
set incsearch
set nohlsearch

" GENERAL AUTOCOMPLETION

" set omnifunc=xmlcomplete#CompleteTags
" set completeopt=longest,menuone
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <C-p> pumvisible() ? '<C-p>' : '<C-p><C-r>=pumvisible() ? "\<lt>Up>" : ""<CR>'

" RAGTAG

let g:ragtag_global_maps = 1

" NERDTREE

let g:NERDTreeChDirMode=2

" SESSION MANAGER

let g:session_autoload=1
let g:session_autosave=1

" SINGLE CHARACTER INSERTION

function! RepeatChar(char, count)
 return repeat(a:char, a:count)
endfunction

nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" GIST
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_clip_command = 'xclip -selection clipboard'

" HIGHLIGHT TEXT PAST 80 COLUMNS

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" REMOVE TRAILING WHITESPACE
" autocmd BufWritePre * :%s/\s\+$//e
"

" MINI BUF EXPLORER
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplMapWindowNavArrows = 1

au WinLeave * set nocursorline 
au WinEnter * set cursorline 
set cursorline 

command! -bar -nargs=0 SudoW :silent exe "write !sudo tee % >/dev/null" | silent edit!
let g:ruby_debugger_debug_mode = 1

function! HtmlEscape()
  silent s/À/\&Agrave;/eg
  silent s/Á/\&Aacute;/eg
  silent s/Â/\&Acirc;/eg
  silent s/Ã/\&Atilde;/eg
  silent s/Ä/\&Auml;/eg
  silent s/Å/\&Aring;/eg
  silent s/Æ/\&AElig;/eg
  silent s/Ç/\&Ccedil;/eg
  silent s/È/\&Egrave;/eg
  silent s/É/\&Eacute;/eg
  silent s/Ê/\&Ecirc;/eg
  silent s/Ë/\&Euml;/eg
  silent s/Ì/\&Igrave;/eg
  silent s/Í/\&Iacute;/eg
  silent s/Î/\&Icirc;/eg
  silent s/Ï/\&Iuml;/eg
  silent s/Ð/\&ETH;/eg
  silent s/Ñ/\&Ntilde;/eg
  silent s/Ò/\&Ograve;/eg
  silent s/Ó/\&Oacute;/eg
  silent s/Ô/\&Ocirc;/eg
  silent s/Õ/\&Otilde;/eg
  silent s/Ö/\&Ouml;/eg
  silent s/Ø/\&Oslash;/eg
  silent s/Ù/\&Ugrave;/eg
  silent s/Ú/\&Uacute;/eg
  silent s/Û/\&Ucirc;/eg
  silent s/Ü/\&Uuml;/eg
  silent s/Ý/\&Yacute;/eg
  silent s/Þ/\&THORN;/eg
  silent s/ß/\&szlig;/eg
  silent s/à/\&agrave;/eg
  silent s/á/\&aacute;/eg
  silent s/â/\&acirc;/eg
  silent s/ã/\&atilde;/eg
  silent s/ä/\&auml;/eg
  silent s/å/\&aring;/eg
  silent s/æ/\&aelig;/eg
  silent s/ç/\&ccedil;/eg
  silent s/è/\&egrave;/eg
  silent s/é/\&eacute;/eg
  silent s/ê/\&ecirc;/eg
  silent s/ë/\&euml;/eg
  silent s/ì/\&igrave;/eg
  silent s/í/\&iacute;/eg
  silent s/î/\&icirc;/eg
  silent s/ï/\&iuml;/eg
  silent s/ð/\&eth;/eg
  silent s/ñ/\&ntilde;/eg
  silent s/ò/\&ograve;/eg
  silent s/ó/\&oacute;/eg
  silent s/ô/\&ocirc;/eg
  silent s/õ/\&otilde;/eg
  silent s/ö/\&ouml;/eg
  silent s/ø/\&oslash;/eg
  silent s/ù/\&ugrave;/eg
  silent s/ú/\&uacute;/eg
  silent s/û/\&ucirc;/eg
  silent s/ü/\&uuml;/eg
  silent s/ý/\&yacute;/eg
  silent s/þ/\&thorn;/eg
  silent s/ÿ/\&yuml;/eg
endfunction

function! HtmlEscapeNum()
  silent s/?/\&#160;/eg
  silent s/¡/\&#161;/eg
  silent s/¢/\&#162;/eg
  silent s/£/\&#163;/eg
  silent s/¤/\&#164;/eg
  silent s/¥/\&#165;/eg
  silent s/¦/\&#166;/eg
  silent s/§/\&#167;/eg
  silent s/¨/\&#168;/eg
  silent s/©/\&#169;/eg
  silent s/ª/\&#170;/eg
  silent s/«/\&#171;/eg
  silent s/¬/\&#172;/eg
  silent s/?/\&#173;/eg
  silent s/®/\&#174;/eg
  silent s/¯/\&#175;/eg
  silent s/°/\&#176;/eg
  silent s/±/\&#177;/eg
  silent s/²/\&#178;/eg
  silent s/³/\&#179;/eg
  silent s/´/\&#180;/eg
  silent s/µ/\&#181;/eg
  silent s/¶/\&#182;/eg
  silent s/·/\&#183;/eg
  silent s/¸/\&#184;/eg
  silent s/¹/\&#185;/eg
  silent s/º/\&#186;/eg
  silent s/»/\&#187;/eg
  silent s/¼/\&#188;/eg
  silent s/½/\&#189;/eg
  silent s/¾/\&#190;/eg
  silent s/¿/\&#191;/eg
  silent s/À/\&#192;/eg
  silent s/Á/\&#193;/eg
  silent s/Â/\&#194;/eg
  silent s/Ã/\&#195;/eg
  silent s/Ä/\&#196;/eg
  silent s/Å/\&#197;/eg
  silent s/Æ/\&#198;/eg
  silent s/Ç/\&#199;/eg
  silent s/È/\&#200;/eg
  silent s/É/\&#201;/eg
  silent s/Ê/\&#202;/eg
  silent s/Ë/\&#203;/eg
  silent s/Ì/\&#204;/eg
  silent s/Í/\&#205;/eg
  silent s/Î/\&#206;/eg
  silent s/Ï/\&#207;/eg
  silent s/Ð/\&#208;/eg
  silent s/Ñ/\&#209;/eg
  silent s/Ò/\&#210;/eg
  silent s/Ó/\&#211;/eg
  silent s/Ô/\&#212;/eg
  silent s/Õ/\&#213;/eg
  silent s/Ö/\&#214;/eg
  silent s/×/\&#215;/eg
  silent s/Ø/\&#216;/eg
  silent s/Ù/\&#217;/eg
  silent s/Ú/\&#218;/eg
  silent s/Û/\&#219;/eg
  silent s/Ü/\&#220;/eg
  silent s/Ý/\&#221;/eg
  silent s/Þ/\&#222;/eg
  silent s/ß/\&#223;/eg
  silent s/à/\&#224;/eg
  silent s/á/\&#225;/eg
  silent s/â/\&#226;/eg
  silent s/ã/\&#227;/eg
  silent s/ä/\&#228;/eg
  silent s/å/\&#229;/eg
  silent s/æ/\&#230;/eg
  silent s/ç/\&#231;/eg
  silent s/è/\&#232;/eg
  silent s/é/\&#233;/eg
  silent s/ê/\&#234;/eg
  silent s/ë/\&#235;/eg
  silent s/ì/\&#236;/eg
  silent s/í/\&#237;/eg
  silent s/î/\&#238;/eg
  silent s/ï/\&#239;/eg
  silent s/ð/\&#240;/eg
  silent s/ñ/\&#241;/eg
  silent s/ò/\&#242;/eg
  silent s/ó/\&#243;/eg
  silent s/ô/\&#244;/eg
  silent s/õ/\&#245;/eg
  silent s/ö/\&#246;/eg
  silent s/÷/\&#247;/eg
  silent s/ø/\&#248;/eg
  silent s/ù/\&#249;/eg
  silent s/ú/\&#250;/eg
  silent s/û/\&#251;/eg
  silent s/ü/\&#252;/eg
  silent s/ý/\&#253;/eg
endfunction

function! NbspReplace()
  silent s/\(\d\) /\1\&nbsp;/eg
  silent s/ \(\d\)/\&nbsp;\1/eg
  silent s/ :/\&nbsp;:/eg
endfunction

vmap <silent> <c-h> :call HtmlEscape()<CR>
vmap <silent> <c-n> :call NbspReplace()<CR>

let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

function! QFDo(bang, command) 
  let qflist={} 
  if a:bang 
     let tlist=map(getloclist(0), 'get(v:val, ''bufnr'')') 
  else 
     let tlist=map(getqflist(), 'get(v:val, ''bufnr'')') 
  endif 
  if empty(tlist) 
    echomsg "Empty Quickfixlist. Aborting" 
    return 
  endif 
  for nr in tlist 
  let item=fnameescape(bufname(nr)) 
  if !get(qflist, item,0) 
     let qflist[item]=1 
  endif 
  endfor 
  :exe 'argl ' .join(keys(qflist)) 
  :exe 'argdo ' . a:command 
endfunc 

command! -nargs=1 -bang Qfdo :call QFDo(<bang>0,<q-args>) 


" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

" Start the find and replace command across the entire file
vmap <C-r> <Esc>:%s/<c-r>=GetVisual()<cr>/
