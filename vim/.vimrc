set nocompatible               " Be iMproved

"    Required:
set runtimepath+=~/.vim/bundle/Plug.vim/

" Required:
call plug#begin('~/.local/share/nvim/plugged')

" Let Plug manage Plug
" My Bundles here:
" Refer to |:Plug-examples|.  Note: You don't set Plug setting in .gvimrc!

Plug 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }
Plug 'arcticicestudio/nord-vim'
" Plug 'scrooloose/syntastic'
" Plug 'ervandew/ag'
" Plug 'Lokaltog/vim-easymotion'
" Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'Shougo/denite.nvim'
Plug 'chemzqm/denite-extra'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-vinegar'
Plug 'leafgarland/typescript-vim'
Plug 'wellle/targets.vim'
Plug 'godoctor/godoctor.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-dispatch'
" Plug 'tpope/vim-fireplace'
" Plug 'tpope/vim-classpath'
" Plug 'tpope/vim-leiningen'
" Plug 'tpope/vim-repeat'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'bling/vim-bufferline'
" Plug 'vim-scripts/argtextobj.vim'
" Plug 'sjl/tslime.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go'
Plug 'w0rp/ale'
" Plug 'amdt/vim-niji'
" Plug 'guns/vim-clojure-static'
" Plug 'klen/python-mode'
" Plug 'alfredodeza/pytest.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'do': 'make'}
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" Required:
filetype plugin indent on

let g:deoplete#enable_at_startup = 1
" If there are uninstalled bundles found on
"startup,
" this will conveniently prompt you to install
"them.
" line numbering. Turn it off with "set nonu"
set nu

" Set syntax on
syntax on


let mapleader=" "
" Indent automatically depending on filetype
filetype indent on
filetype plugin indent on
set autoindent

" Case insensitive search
set ic

" Higlhight search
set hls

" Wrap text instead of being on one line
set lbr

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
set mouse=a
set clipboard=unnamedplus

let @2='0$j'
let @i='?public$byiwjjOif(pa == null)o{throw new NullPointerException("pa cannot be null");}'
let @t='?public$byiwO/**@throws NullPointerException if pa is nulla*/'
let @n='@i?publicj@t'

set lazyredraw
set laststatus=2

set hlsearch
set incsearch

filetype indent on

set expandtab       " tabs are converted to spaces
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent

set splitright

syntax enable

set t_Co=256
set background=dark
colorscheme nord

nnoremap <Leader>v :vsplit
nnoremap <Leader>e :e
nnoremap <Leader>sc :nohl<CR>

nnoremap <Leader>wd :bd<CR>
nnoremap <Leader>e :e
nnoremap <Leader>sc :nohl<CR>
nnoremap <M-;> :Denite file/old<CR>

nnoremap <C-e> $
nnoremap <C-a> ^

set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbarset completeopt-=preview

let g:EasyMotion_keys = 'abcdefghiklmnopqrstuvwxyj'

" let g:ctrlp_map = '<C-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_by_filename = 1
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_root_markers = ['.ctrlp']
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

set autowrite
set autoread

exec "set listchars=trail:\u2022"

let g:airline_powerline_fonts = 1
let g:airline_exclude_filetypes = [] " see source for current list
let g:airline#extensions#bufferline#enabled = 1
let g:airline_theme='solarized'

let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

set wildmenu
set wildmode=longest:full,full

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux


let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-B>"
let g:ultisnips_java_brace_style="nl"

" let g:UltiSnipsEditSplit="vertical"

" autocmd filetype lisp,scheme,art,clj setlocal equalprg=scmindent.rkt
" autocmd filetype python setlocal equalprg=autopep8

" " " tslime {{{
" let g:tslime_ensure_trailing_newlines = 1
" let g:tslime_normal_mapping = '<Leader>t'
" let g:tslime_visual_mapping = '<Leader>t'
" let g:tslime_vars_mapping = '<Leader>T'

vnoremap s S

" Clojure stuff
nnoremap <Leader>e :Eval<CR>
vnoremap <Leader>e :Eval<CR>
nnoremap <Leader>E :%Eval<CR>
vnoremap <Leader>E :%Eval<CR>

" Java stuff
nnoremap <Leader>j :call SendToTmux("deploy_new")<CR>

" Go stuff
set rtp+=/usr/local/go/misc/vim
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['java'] }

if has('nvim')
    runtime! python_setup.vim
endif


" upon hitting escape to change modes,
" send successive move-left and move-right
" commands to immediately redraw the cursor

inoremap <special> <Esc> <Esc>hl

" don't blink the cursor
set guicursor+=i:blinkwait0
" Switch from block-cursor to vertical-line-cursor when going into/out of

" insert mode
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Remove trailing spaces
nnoremap <Leader>c mm:%s/\s\+$<CR>'m

" " Pymode stuff
" let g:pymode_folding = 0
" let g:pymode_rope = 0
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
au FileType go nmap ,t :GoDeclsDir<cr>
au Filetype go nmap ,a <Plug>(go-alternate-edit)
au Filetype go nmap ,ah <Plug>(go-alternate-split)
au Filetype go nmap ,av <Plug>(go-alternate-vertical)
" au Filetype go nmap K :call OniCommand('quickinfo.show')

if exists('g:gui_oni')
    set nocompatible              " be iMproved, required
    filetype off                  " required

    set number
    set noswapfile
    set smartcase

    " Turn off statusbar, because it is externalized
    set noshowmode
    set noruler
    set laststatus=0
    set noshowcmd

    " Enable GUI mouse behavior
    set mouse=a
endif


nnoremap <C-p> :<C-u>Denite file_rec<CR>
nnoremap <leader>s :<C-u>Denite buffer<CR>
nnoremap <leader><Space>s :<C-u>DeniteBufferDir buffer<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <leader><Space>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
nnoremap <leader>d :<C-u>DeniteBufferDir file_rec<CR>
nnoremap <leader>; gc
nnoremap <leader>;; gcc
nnoremap <leader>qq :q<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>w- :split<CR>
nnoremap <leader>ws :split<CR>
nnoremap <leader>pf :<C-u>Denite file_rec<CR>
nnoremap <leader>fed :e $HOME/.config/oni/config.tsx<CR>
nnoremap <M-m> <C-w><C-w>
" unmap K

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    unmap <buffer> qb
    unmap <buffer> qf
    unmap <buffer> q
    noremap <buffer> q :bd<CR>
endfunction

let g:SuperTabDefaultCompletionType = "<c-n>"
autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
			\ ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
" Change mappings.
call denite#custom#map(
            \ 'insert',
            \ '<C-j>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<C-k>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<C-n>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<C-p>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)
