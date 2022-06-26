
" tauNVIM - VimScript Config
"    de MON, para todxs!
"
"         v.0.3
"          <3
"          ASSIM COMO VISTO NOS 'Planos Fututos'. Todo o tauNeoVIM, sera em
"          Lua
filetype plugin indent on 
set nu!
set ruler
syntax on
set cursorline
set mouse=a
set smartindent
set autoindent
set hlsearch
set incsearch ignorecase smartcase
set wildmenu
set t_Co=256
set termguicolors
set laststatus=2 showcmd showmode
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
set hidden
set textwidth=0
set encoding=UTF-8
set updatetime=100
set noshowmode

" Keymaps
map q :q<CR> " Sair do NeoVIM
map w :w<CR> " Salvar o arquivo atual
map <C-w> :wq!<CR> " Forcar salvamento e saida
map <C-q> :q!<CR> " Forcar saida
map <C-z> :undo<CR> " Desfazer
map <C-y> :redo<CR> " Refazer
map <C-n> :NERDTreeToggle<CR>
map <C-A-g> G " Fim do arquivo
map <C-g> :
map <C-A-f> :%s/
map <C-A-m> :MarkdownPreview<CR>
" Definindo 'chave mestra'
let mapleader = " "
" Terminal Flutuante <3
noremap  <leader>t  :FloatermToggle<CR>
"map  <C-t>  :FloatermToggle<CR>i " Config For ANDROID
noremap! <leader>t  <Esc>:FloatermToggle<CR>
tnoremap <leader>t  <C-\><C-n>:FloatermToggle<CR>
" Config para Tamanho

"let g:floaterm_width = 100
"let g:floaterm_winblend = 0

"Config para 'Rodar o Codigo'

"Rodar meu script 'CCompiler'
noremap  <leader>c  :FloatermToggle<CR>compiler<CR>

" Rodar Python com script 'PyExec'
noremap  <leader>p  :FloatermToggle<CR>PyExec<CR>


" Plugins Essenciais
call plug#begin("~/.config/nvim/plugins")
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
Plug 'chrisbra/Colorizer'
"Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mhartington/formatter.nvim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'voldikss/vim-floaterm'
Plug 'ap/vim-css-color'
Plug 'sainnhe/everforest'
Plug 'ellisonleao/glow.nvim'
Plug 'romgrk/barbar.nvim'

" Plugins de Cosméticos
Plug 'bluz71/vim-moonfly-colors'
Plug 'startup-nvim/startup.nvim'
Plug 'Everblush/everblush.nvim', { 'as': 'everblush' }
Plug 'ayu-theme/ayu-vim'
Plug 'getomni/neovim', { 'branch': 'main' }
Plug 'simmxns/purpledepth'
Plug 'VDuchauffour/neodark.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'yunlingz/equinusocio-material.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'Yggdroot/indentLine'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'mountain-theme/vim'

call plug#end()

" Snippets
"let g:UltiSnipsExpandTrigger="<tab>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'


" Essentials Plugins Config
" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:moonflyCursorColor = 1

" MD(MarkDown) Relacioned
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
let g:mkdp_auto_close = 0


" Lua
lua require('basic')
" - Custom Settings -
luafile $HOME/.config/nvim/lua/lsp_config.lua
set completeopt=menuone,noinsert,noselect
set shortmess+=c

"ale
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '

let g:coc_global_extensions = [
    \  'coc-snippets',
    \  'coc-emmet',
    \  'coc-html',
    \  'coc-css',
    \  'coc-json', 
    \  'coc-phpls',
    \  'coc-yaml',
    \  'coc-sh',
    \  'coc-prettier',
    \  'coc-markdownlint',
    \  'coc-eslint',
    \  'coc-jedi',
    \  'coc-python',
    \   ]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.

" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"colorscheme tokyonight
colorscheme moonfly
"colorscheme everblush
"colorscheme ayu
"colorscheme omni
"colorscheme purpledepth
"colorscheme neodark
"colorscheme github_dark_default
"colorscheme equinusocio_material
"colorscheme mountain

" Catppuccin
let g:catppuccin_flavour = "frappe" " latte, frappe, macchiato, mocha
"colorscheme catppuccin

" EverForest
"colorscheme everforest

"Material Config
"let g:equinusocio_material_bracket_improved = 1
" use a different style
" valid values: 'default' (default), 'darker', 'pure'
"let g:equinusocio_material_style = 'darker'
set background=dark
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
set fillchars+=vert:│
"tokyonight config
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

"Indent Line Config
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '┊', '┆', '¦']

" Config Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
let g:airline_right_sep = ' '
let g:airline_left_sep = ' '
let bufferline = get(g:, 'bufferline', {})
let bufferline.no_name_title = "Nova Aba"
let g:airline_symbols.linenr = '並 '
let g:airline_section_z = airline#section#create(['windowswap', '%3p%%', 'linenr', ':%3v'])
let g:glow_border = "rounded"
endif
