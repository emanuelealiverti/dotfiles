"  ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"  ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"  ██║   ██║██║██╔████╔██║██████╔╝██║     
"  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"██╗╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

call plug#begin('~/.local/share/nvim/plugged')

" let Vundle manage Vundle, required
Plug 'itchyny/lightline.vim'
Plug 'jalvesaq/Nvim-R', {'branch': 'faster_omnicompl'}
"Plug 'jalvesaq/R-Vim-runtime'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'morhetz/gruvbox'
Plug 'chrisbra/csv.vim'
Plug 'ssp3nc3r/stan-syntax-vim'
Plug 'godlygeek/tabular'
Plug 'jalvesaq/vimcmdline'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'AndrewRadev/linediff.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call plug#end()

" ========================
"""""""""""""""""""""""""""""""""""""
" STYLE 
""""""""""""""""""""""""""""""""""""
" colors
set termguicolors
"set t_Co=256

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark="soft"
"let g:gruvbox_contrast_dark='hard'
"set background=light
"let g:gruvbox_contrast_light='light'
let g:gruvbox_italic=1

set t_ZH=3m
set t_ZR=23m
"
"show line number
set nu
set relativenumber
set numberwidth=5

"highlight cursons only in insert
"set cursorline 
"autocmd InsertEnter * set nocursorline 
"autocmd InsertLeave * set cursorline 
"
" ENTER to continue
set shortmess=a
"set cmdheight=2
"when buffer changes, ask to save
set hidden 
"
"++++++++++
" C0MMANDS
"++++++++++

"Save wih ==  
noremap == :update<CR>
" Save with sudo

" set directory to file location
nnoremap <leader>cd :cd %:p:h<CR>

" close buffer, preserved layout
command BD bp\|bd \#
nnoremap <silent> <Leader>] :bn <CR>
nnoremap <silent> <Leader>[ :bp <CR>

"move to end of line above when press left
set whichwrap+=<,>,h,l,[,]

"" Remove line from terminal emulator
augroup TerminalStuff
	au! 
	autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
"autocmd TermOpen * set nonumber relativenumber

"++++++++++++++++++++
" Wildmenu navigation
"++++++++++++++++++++
"cnoremap <C-l> <Down>
"cnoremap <expr> <C-L>  "\<Down>" 
"cnoremap <expr> <Down>  pumvisible() ? "\<Right>" : "\<Down>"
"cnoremap <expr> <Left>  pumvisible() ? "\<Up>"    : "\<Left>"
"cnoremap <expr> <Right> pumvisible() ? "\<Down>"  : "\<Right>"

"This cause crazy shit to happen
"and check it uses zsh
"set shell=zsh\ -i
"++++++++++++++++++
" HARD MODE (soft)
"++++++++++++++++++
nnoremap <PageUp> :echoe "Use C-Y"<CR> 
nnoremap <PageDown>  :echoe "Use C-E"<CR>
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
nnoremap j gj
nnoremap k gk
inoremap jk <esc>

"++++++++
" BUFFERS
"++++++++
"nnoremap <silent> ` :ToggleBufExplorer<CR> 
nnoremap <silent> _ :ToggleBufExplorer<CR> 
" diable within terminals (R)
autocmd WinEnter * if &buftype == 'terminal' | call TermB() | endif
"autocmd CmdWinEnter * nnoremap <buffer> <silent> _ <CR> 

"Move between windows with ctrl arrow
nmap <silent> <C-k> :wincmd k <CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" circular windows navigation
nnoremap <Tab>   <c-W>w
nnoremap <S-Tab> <c-W>W

"nnoremap <silent> <Leader>} :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <Leader>{ :exe "resize " . (winheight(0) * 2/3)<CR>

imap <silent>  <C-Up> <Esc>    : wincmd k <CR>
imap <silent>  <C-Down> <Esc>  : wincmd j<CR>
imap <silent>  <C-Left> <Esc>  : wincmd h<CR>
imap <silent>  <C-Right> <Esc> : wincmd l<CR>

"esc terminal with esc
tnoremap <Esc> <C-\><C-n>


"+++++++++++++++
" Tab allignment
"+++++++++++++++

nmap <Leader>a= :Tabularize /^[^=]*\zs= <CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs= <CR>

nmap <Leader>a& :Tab/&<CR>
vmap <Leader>a& :Tab/&<CR>

nmap <Leader>a> :Tab/%>%<CR>
vmap <Leader>a> :Tab/%>%<CR>

"+++++++++++++++++++++
" NERD Comment plugin 
"+++++++++++++++++++++

vmap <C-_> <Leader>ci
nmap <C-_> <Leader>ci
imap <C-_> <Esc> :call NERDComment("n","toggle") <CR>i



"""""""""""""""""""""""""""""""""""""
" NERD tree and FFF 
"""""""""""""""""""""""""""""""""""""
noremap <silent> <C-n> :call ToggleNetrw()<CR>
"noremap <silent> <C-m> :FZF  <CR>
let g:netrw_banner = 0
let g:netrw_winsize = 15
let g:netrw_browse_split = 1
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

""""""""""""""""""
" Markdown preview
""""""""""""""""""

"let g:mkdp_browser = 'surf'

"""""""""""""""""""""""""""""""""""""
" VIMTEX 
"""""""""""""""""""""""""""""""""""""

let g:vimtex_view_method = 'zathura'
" $PATH must contain the path for nvr! e.g. /anconda3/bin
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_latexlog = {'default' : 0}
" try to always set filetype latex
let g:tex_flavor = 'latex'
"let g:tex_fast = "bMpr"
" default entries for toc
let g:vimtex_toc_config = {'layer_status': { 'content': 1, 'label': 0, 'todo': 1,'include': 0 },'show_help' : 0}
let g:vimtex_complete_ignore_case=1 
"let g:vimtex_complete_bib = { 'simple': 0 }
" Enable spell checking when opening .tex files
autocmd Filetype tex call TexStartup() 
let g:vimtex_matchparen_enabled=0
"let g:vimtex_indent_enabled = 0

"""""""""""""""""""""""""""""""""""""
" OMNICOMPLETE
"""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText','s:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabContextTextOmniPrecedence = ['&completefunc', '&omnifunc']
"let g:SuperTabLongestEnhanced = 1
"let g:SuperTabCrMapping = 0
"autocmd FileType !tex if &omnifunc != '' | call SuperTabChain(&omnifunc, "<c-p>") | endif


"""""""""""""""""""""""""""""""""""""
" NVIM R 
"""""""""""""""""""""""""""""""""""""
set completeopt-=preview
"let R_complete = 2
"let R_show_args = 0
"let completeopt=['']
let R_show_arg_help = 0
let R_open_example = 0
"let R_args = ['--no-save', '--quiet','--no-environ','--no-site-file']
nmap <space> <Plug>RDSendLine
vmap <space> <Plug>RDSendSelection

let R_assign=0
nmap <leader>a <leader>kb
autocmd FileType r,rnw,rd,rmd inoremap >> %>%
"autocmd FileType rmd call RmdStart()

""++++++++++++++++++++++++++++++++++++++++++++++++++
" CMD line - similar to NVIM but for julia (less) 
""++++++++++++++++++++++++++++++++++++++++++++++++++

let cmdline_map_start          = '<LocalLeader>rf'
let cmdline_map_send           = '<Space>'
let cmdline_map_send_and_stay  = '<LocalLeader><Space>'
let cmdline_map_source_fun     = '<LocalLeader>f'
let cmdline_map_send_paragraph = ','
let cmdline_map_send_block     = '<LocalLeader>b'
let cmdline_map_quit           = '<LocalLeader>q'
let cmdline_app           = {}
let cmdline_app['prolog']     = 'telegram-cli -NW -l 0'
let cmdline_app['python'] = 'python3.8'
let cmdline_app['sh'] = 'zsh'
let cmdline_app['julia'] = 'julia'
au FileType prolog execute 'setlocal complete+=k/home/meme/.vim/dic/tg'

"
"++++++++++++++++
" LIGHTLINE SETUP
"++++++++++++++++
let g:lightline = {
			\ 'colorscheme': 'gruvbox',
			\ 'active': {
			\   'right': [ [ 'lineinfo', 'filetype' ] ]
			\ },
			\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
			\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
			\ 'enable': { 'tabline': 0 },
			\ }

"""""""""""""""""""""""""""""""""""""
" Call custom functions 
"""""""""""""""""""""""""""""""""""""
map <Leader>+ :call Surround()<CR>
map <Leader>= :call Surround(1)<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" USEFUL FUNCTIONS, not referred to specific packages
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable buff key in terminals
function TermB()
	nnoremap <buffer> <silent> <Leader>] <CR>
	nnoremap <buffer> <silent> <Leader>[ <CR> 
	nnoremap <buffer> <silent> _ <CR> 
endfunction

""""""""""""
" Spell conf
""""""""""""
function SetSpellOptions()
	setlocal spell spelllang=en,it
	"setlocal spell spelllang=en
	"setlocal spell spelllang=it
	"ctrl-L change word in insert
	inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
	hi clear SpellBad                                                
	hi SpellBad cterm=underline,bold gui=underline,bold
	hi clear SpellRare                                               
	hi SpellRare cterm=underline,bold gui=underline,bold
	hi clear SpellCap                                                
	hi SpellCap cterm=underline,bold gui=underline,bold
	hi clear SpellLocal
	hi SpellLocal cterm=underline,bold gui=underline,bold
endfunction

function TexStartup()
	"silent! call ToggleWrap()
	"silent! call ToggleWrap()
	silent! call SetSpellOptions()
endfunction

""""""""""""""""""""""""""""""""""""""""
" Surround lines with custom characters 
""""""""""""""""""""""""""""""""""""""""
function Surround(...)
"Use NERDcomment to find out filetype char
	let arg1 = get(a:, 0, 0)
	normal! 0i
	call NERDComment("n","toggle")
	normal! ^vy
	normal! a 
	let linel=strwidth(getline('.'))-1 
	normal! o
	normal! Dp
	if arg1
		execute "normal!$" . linel . "p" 
	else
		execute "normal!$" . linel . "a" . "+"
	endif
	normal! YkP
	normal! =3j
	" Add this to close the box "
	"normal! ^yl$pja 
	"normal! p
	"normal! j$p
	"
endfunction

"++++++++++++++++++++++++++++++++++++
" Tooggle vexplore (emulate nerdtree)
"++++++++++++++++++++++++++++++++++++
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
"++++++++++++++
" Google search
"++++++++++++++
function! GoogleSearch()
     let searchterm = getreg("g")
     silent! exec "silent! !firefox \"http://google.com/search?q=" . searchterm . "\" &"
endfunction
