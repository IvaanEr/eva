" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'haishanh/night-owl.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'itchyny/lightline.vim'
" Plug 'skbolton/embark'
Plug 'embark-theme/vim', {'as': 'embark'}
" Plug 'embark-theme/vim', { 'branch': 'theme-cleanup', 'as': 'embark'}
Plug 'morhetz/gruvbox'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-fugitive'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plug 'justinmk/vim-sneak'
Plug 'ervandew/supertab'
Plug 'machakann/vim-highlightedyank'
Plug 'liuchengxu/vista.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'neomake/neomake'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'ianks/vim-tsx'
Plug 'mxw/vim-jsx'
" Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
"Initialize plugin system
call plug#end()

if (has("termguicolors"))
  set termguicolors
endif

syntax on
filetype plugin indent on

colorscheme embark


" Indentation & Tabs
set autoindent

set smartindent

set tabstop=2

set shiftwidth=2

set expandtab

set smarttab

" Display & format

set number

set textwidth=80

set wrapmargin=2

set showmatch

" Search

set hlsearch

set incsearch

set ignorecase

set smartcase

" Browse & Scroll

set scrolloff=5

set laststatus=2

set nobackup

set noswapfile

set undofile

set visualbell

set errorbells
set splitbelow
set splitright
set showtabline=2
let @+=42
set clipboard=unnamedplus
" Lightline


let mapleader=" "
let g:sneak#label = 1
" Supertab
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'
let g:vista_default_executive = 'coc'
let g:vista#renderer#icons = {
\   "function": "ﬦ",
\   "module": " ",
\   "variable": "\ufb18 ",
\   "constant": ""
\  }
let g:vista_sidebar_width = 45
let g:vista_disable_statusline = 1
let g:TESTING_STATUS = 'passing'
" n ~ normal
" nore ~ norecursive
" map ~ map
" nnoremap ; :
" nnoremap : ;
nnoremap <leader>p :Files<CR>

if executable('rg')
  set grepprg=rg\ --vimgrep\ --hidden\ -g\ !.git
endif


" Quickfix
nnoremap <silent> <UP> :cope<CR>
nnoremap <silent> <DOWN> :cclose<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprev<CR>
nnoremap <silent> <RIGHT> :cnext<CR>
nnoremap <silent> <LEFT> :cprev<CR>

" Make many of the jump commands also center on search term
nnoremap n nzz
nnoremap N Nzz
nnoremap <silent> <leader>, :nohlsearch<CR>

" Language Server
nmap <silent> <leader>ld <Plug>(coc-definition)zz
nnoremap <silent> <leader>lD :call CocAction('jumpDefinition', 'vsplit')<CR>zz
noremap <silent> <leader>lh :call CocAction('doHover')<CR>
nnoremap <leader>lo :CocList outline<CR>
nnoremap <leader>lO :Vista<CR>
noremap <leader>lp :CocList diagnostics<CR>
noremap <leader>l? :CocInfo<CR>
noremap <leader>lr :CocRestart<CR>
" Open vimrc
noremap <leader>vr :vsp ~/.vimrc<CR>
noremap <leader>\ :NERDTreeToggle<CR>
noremap <leader><bar> :NERDTreeFind<CR>

" VIM-TEST
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

let test#strategy = {
      \  'nearest': 'neomake',
      \  'file': 'neomake',
      \  'suite': 'neomake' }

" Lightbar
function! TestingStatus() abort
  if g:TESTING_STATUS == 'passing'
    return " "
  elseif g:TESTING_STATUS == 'running'
    return ""
  elseif g:TESTING_STATUS == 'failing'
    return ""
  endif
endfunction
function! FileNameWithIcon() abort
  return winwidth(0) > 70  ?  WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : ''
endfunction
function! FileNameWithParent(f) abort
  if expand('%:t') ==# ''
    return expand('%:p:h:t')
  else
    return expand('%:p:h:t') . "/" . expand("%:t")
  endif
endfunction
function! Git_branch() abort
  if fugitive#head() !=# ''
    return  fugitive#head() . "  "
  else
    return "\uf468"
  endif
endfunction
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if get(info, 'error', 0)
    return ""
  endif
  if get(info, 'warning', 0)
    return info['warning'] . "\ufad5"
  endif
  return "\ufae0"
  " return ""U+00BB

endfunction
let g:lightline = {}
let g:lightline.active = {
      \ 'left': [ ['mode', 'readonly'], ['filename_with_icon', 'modified']],
      \ 'right': [['lineinfo'], ['testing_status', 'status_diagnostic'] ]
      \ }
let g:lightline.separator = { 'left': " ", 'right': " " }
let g:lightline.tabline_separator = { 'left': " ", 'right': "" }
let g:lightline.tabline_subseparator = { 'left': "/", 'right': "/" }
let g:lightline.subseparator = { 'left': '\\', 'right': '\\' }
let g:lightline.tabline = {
            \ 'left': [ [ 'vim_logo'], [ 'tabs' ] ],
            \ 'right': [ [ 'git_branch' ]]
            \ }
let g:lightline.tab = {
        \ 'active': ['filename_with_parent'],
        \ 'inactive': ['filename']
        \ }
let g:lightline.tab_component = {}
let g:lightline.tab_component_function = {
            \ 'artify_filename': 'lightline_tab_filename',
            \ 'filename': 'lightline#tab#filename',
            \ 'modified': 'lightline#tab#modified',
            \ 'readonly': 'lightline#tab#readonly',
            \ 'tabnum': 'lightline#tab#tabnum',
            \ 'filename_with_parent': 'FileNameWithParent'
            \ }
let g:lightline.component = {
        \ 'filename_with_icon': '%{FileNameWithIcon()}',
        \ 'vim_logo': "\ue7c5 ",
        \ 'git_branch': '%{Git_branch()}',
        \ 'filename_with_parent': '%t',
        \ 'status_diagnostic': '%{StatusDiagnostic()}',
        \ 'testing_status': '%{TestingStatus()}'
        \ }
let g:lightline.colorscheme = 'embark'

let g:TESTING_STATUS = 'passing'
" Show message that tests have started
function! MyOnNeomakeJobStarted() abort
  let g:TESTING_STATUS = 'running'
endfunction
" Show message when all tests are passing
function! MyOnNeomakeJobFinished() abort
  let context = g:neomake_hook_context
  if context.jobinfo.exit_code == 0
    let g:TESTING_STATUS = 'passing'
  endif
  if context.jobinfo.exit_code == 1
    let g:TESTING_STATUS = 'failing'
  endif
endfunction
augroup my_neomake_hooks
  au!
  autocmd User NeomakeJobFinished call MyOnNeomakeJobFinished()
  autocmd User NeomakeJobStarted call MyOnNeomakeJobStarted()
augroup END
"""""""""""""""""""""
" vim-test extensions
"""""""""""""""""""""
let g:test#preserve_screen = 0
let g:neomake_open_list = 1

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']


"Linter
let g:ale_linters = {
\    'javascript': ['eslint'],
\    'javascript.jsx': ['eslint'],
\    'elixir': ['credo']
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
" Letting coc.vim do the completion instead of all
let g:ale_completion_enabled = 0
" use projects prettier and eslint settings
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_eslint_use_local_config = 1
let g:ale_elixir_credo_strict = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = ""
let g:ale_virtualtext_cursor = 1

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType typescript.tsx setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css
