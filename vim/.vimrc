"  ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"  ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"  ██║   ██║██║██╔████╔██║██████╔╝██║     
"  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"██╗╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'jalvesaq/Nvim-R'
Plugin 'lervag/vimtex'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'chrisbra/csv.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'https://github.com/ssp3nc3r/stan-syntax-vim.git'
Plugin 'godlygeek/tabular'
Plugin 'itchyny/calendar.vim'
Plugin 'tpope/vim-obsession'
Plugin 'wesQ3/vim-windowswap.git'
Plugin 'jalvesaq/vimcmdline.git'
"Plugin 'dahu/vim-fanfingtastic.git' 
Plugin 'tpope/vim-repeat'
Plugin 'iamcco/markdown-preview.nvim.git'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'dylanaraps/fff.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""
" STYLE 
""""""""""""""""""""""""""""""""""""
" colors
set termguicolors

colorscheme seoul256
set background=dark

"colorscheme solarized8
"set background=light

"colorscheme deus
"set background=dark

"show line number
set nu
set relativenumber
set numberwidth=5

"highlight cursons only in insert
set cursorline 
autocmd InsertEnter * set nocursorline 
autocmd InsertLeave * set cursorline 

" ENTER to continue
set shortmess=a
"set cmdheight=2
"when buffer changes, ask to save
set hidden 
"
"""""""""""""""""""""""""""""""""""""
" C0MMANDS
""""""""""""""""""""""""""""""""""""
" ; is :
map ; :
noremap ;; ;

"Save wih ++
noremap == :update<CR>
"
" Save with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

noremap K r<CR>
command Bd bp\|bd \#

"move to end of line above when press left
set whichwrap+=<,>,h,l,[,]

"" Remove line from terminal emulator
augroup TerminalStuff
	au! 
	autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
"autocmd TermOpen * set nonumber relativenumber

"This cause crazy shit to happen
"and check it uses zsh
"set shell=zsh\ -i

"++++++++++++++++++
" HARD MODE (soft)
"++++++++++++++++++
nnoremap <PageUp> <NOP> 
nnoremap <PageDown> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"""""""""""""""""""""""""""""""""""""
" BUFFERS
""""""""""""""""""""""""""""""""""""
nnoremap <silent> ` :ToggleBufExplorer<CR> 

"Move between windows with ctrl arrow
nmap <silent> <C-Up> :wincmd k <CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

" circular windows navigation
nnoremap <Tab>   <c-W>w
nnoremap <S-Tab> <c-W>W

imap <silent>  <C-Up> <Esc> :wincmd k <CR>
imap <silent>  <C-Down> <Esc> :wincmd j<CR>
imap <silent>  <C-Left> <Esc> :wincmd h<CR>
imap <silent>  <C-Right> <Esc> :wincmd l<CR>

"esc terminal with esc
tnoremap <Esc> <C-\><C-n>


"""""""""""""""""""""""""""""""""""""
" Tab allignment
"""""""""""""""""""""""""""""""""""""
nmap <Leader>a= :Tabularize /^[^=]*\zs= <CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs= <CR>

nmap <Leader>a& :Tab/&<CR>
vmap <Leader>a& :Tab/&<CR>

nmap <Leader>a> :Tab/%>%<CR>
vmap <Leader>a> :Tab/%>%<CR>

"""""""""""""""""""""""""""""""""""""
" NERD Comment plugin 
"""""""""""""""""""""""""""""""""""""

vmap <C-_> <Leader>ci
nmap <C-_> <Leader>ci
imap <C-_> <Esc> :call NERDComment("n","toggle") <CR>i


"""""""""""""""""""""""""""""""""""""
" GOOGLE CALENDAR
"""""""""""""""""""""""""""""""""""""
let g:calendar_google_calendar = 1
let g:calendar_first_day = 'monday'

"""""""""""""""""""""""""""""""""""""
" NERD tree 
"""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""
" VIMTEX 
"""""""""""""""""""""""""""""""""""""

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_latexlog = {'default' : 0}
" Enable spell checking when opening .tex files

autocmd Filetype tex call TexStartup() 

"""""""""""""""""""""""""""""""""""""
" OMNICOMPLETE
"""""""""""""""""""""""""""""""""""""

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText','s:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabContextTextOmniPrecedence = ['&completefunc', '&omnifunc']
"let g:SuperTabMappingBackward = "<c-tab>"
"let g:SuperTabMappingTabLiteral = "<s-tab>"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCrMapping = 0
autocmd FileType * if &omnifunc != '' | call SuperTabChain(&omnifunc, "<c-p>") | endif



"""""""""""""""""""""""""""""""""""""
" NVIM R 
"""""""""""""""""""""""""""""""""""""

let R_complete = 2
let R_show_args = 0
let R_show_arg_help = 0
let R_open_example = 0
"let R_in_buffer = 0
nmap , <Plug>RDSendLine
vmap , <Plug>RDSendLine
"nmap <C-CR> <Plug>RDSendLine
"vmap <C-CR> <Plug>RDSendLine
"inoremap <C-CR> <Esc>:call SendLineToR("down")<CR>i

let R_assign=0
nmap <leader>a <leader>kb
autocmd FileType r,rnw,rd,rmd inoremap >> %>%

"""""""""""""""""""""""""""""""""""""
" CMD line - similar to NVIM but for julia (less) 
"""""""""""""""""""""""""""""""""""""
let cmdline_map_start          = '<LocalLeader>s'
let cmdline_map_send           = '<Space>'
let cmdline_map_send_and_stay  = '<LocalLeader><Space>'
let cmdline_map_source_fun     = '<LocalLeader>f'
let cmdline_map_send_paragraph = ','
let cmdline_map_send_block     = '<LocalLeader>b'
let cmdline_map_quit           = '<LocalLeader>q'
let cmdline_app           = {}
let cmdline_app['sh']     = 'zsh'

"""""""""""""""""""""""""""""""""""""
" SLIME OPTIONS (SEND CODE WITH TMUX)
"""""""""""""""""""""""""""""""""""""
"Force slime to use tmux instead of screen
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": 'default', "target_pane": "%1"}
let g:slime_dont_ask_default = 1
let g:slime_no_mappings = 1
"With julia ftype
"autocmd BufEnter *jl nmap ,, <Plug> SlimeParagraphSend

"""""""""""""""""""""""""""""""""""""
" LIGHTLINE SETUP (BECOMES LOOOOONG) 
"""""""""""""""""""""""""""""""""""""
"\ 'colorscheme': 'solarised',
let g:lightline = {
			\ 'colorscheme': 'seoul256',
			\ 'active': {
			\   'right': [ [ 'lineinfo' ],
			\              [ 'percent' ],
			\              [ 'filetype'] ],
			\ }
			\ }
let g:lightline.separator = {
			\   'left': '', 'right': ''
			\}
let g:lightline.subseparator = {
			\   'left': '', 'right': '' 
			\}
let g:lightline.tabline = {
			\   'left': [ ['tabs'] ],
			\   'right': [ [''] ]
			\ }
"""""""""""""""""""""""""""""""""""""
" Call custom functions 
"""""""""""""""""""""""""""""""""""""
map <Leader>+ :call Surround()<CR>


"""""""""""""""""""""""""""""""""""""
" USEFUL FUNCTIONS, not referred to specific packages
"""""""""""""""""""""""""""""""""""""

noremap <silent> <Leader>W :call ToggleWrap()<CR>
function ToggleWrap()
	if &wrap
		echo "Wrap OFF"
		setlocal nowrap
		set virtualedit=all
		silent! nunmap <buffer> <Up>
		silent! nunmap <buffer> <Down>
		silent! nunmap <buffer> <Home>
		silent! nunmap <buffer> <End>
		silent! iunmap <buffer> <Up>
		silent! iunmap <buffer> <Down>
		silent! iunmap <buffer> <Home>
		silent! iunmap <buffer> <End>
	else
		echo "Wrap ON"
		setlocal wrap linebreak nolist
		set virtualedit=
		setlocal display+=lastline
		noremap  <buffer> <silent> <Up>   gk
		noremap  <buffer> <silent> <Down> gj
		noremap  <buffer> <silent> k   gk
		noremap  <buffer> <silent> j gj
		noremap  <buffer> <silent> <Home> g<Home>
		noremap  <buffer> <silent> <End>  g<End>
		inoremap <buffer> <silent> <Up>   <C-o>gk
		inoremap <buffer> <silent> <Down> <C-o>gj
		inoremap <buffer> <silent> <Home> <C-o>g<Home>
		inoremap <buffer> <silent> <End>  <C-o>g<End>
	endif
endfunction

function SetSpellOptions()
	"setlocal spell spelllang=en,it
	setlocal spell spelllang=en
	hi clear SpellBad                                                
	hi SpellBad cterm=underline,bold gui=underline,bold
	hi clear SpellRare                                               
	hi SpellRare cterm=underline,bold gui=underline,bold
	hi clear SpellCap                                                
	hi SpellCap cterm=underline,bold gui=underline,bold
	hi clear SpellLocal
	hi SpellLocal cterm=underline,bold gui=underline,bold
endfunction

function SwitchColor()
	set background=dark
endfunction

function TexStartup()
	"silent! call ToggleWrap()
	"silent! call ToggleWrap()
	silent! call SetSpellOptions()
endfunction

"+++++++++++++++++++++++
" Surround line with ++
"+++++++++++++++++++++++

function Surround()
	"Use NERDcomment to find out filetype char
	normal! 0i
	call NERDComment("n","toggle")
	normal! vy
	normal! a 
	let linel=strwidth(getline('.'))  
	normal! o
	normal! p
	execute "normal!$" . linel . "a" . "+"
	normal! YkP
endfunction

