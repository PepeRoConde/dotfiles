" ============================================================================
"  PLUGINS
" ============================================================================
call plug#begin()

" Xerais
Plug 'lervag/vimtex'
Plug 'christoomey/vim-tmux-navigator'
Plug 'iamcco/markdown-preview.nvim'

" IDE
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'lifepillar/vim-mucomplete'
Plug 'wfxr/minimap.vim'
Plug 'romgrk/winteract.vim'
Plug 'jpalardy/vim-slime', { 'for': ['python', 'julia'] }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Estética
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()

" ============================================================================
"  ATALLOS DE TECLADO
" ============================================================================
let maplocalleader = '\'             " Tecla líder local

nnoremap <C-e> :bn<CR>
nnoremap <C-q> :bp<CR>
nnoremap <C-m> <Cmd>MarkdownPreview<CR>
nnoremap <C-t> <Cmd>NERDTreeToggle<CR>
nnoremap <C-u> <Cmd>UndotreeToggle<CR>
nnoremap <C-x> <Cmd>MinimapToggle<CR>
nnoremap + :silent Goyo 80%x80% \| redraw!<CR>
nnoremap - :silent Goyo 50%x80% \| redraw!<CR>
nnoremap _ :Goyo \| q<CR>
nnoremap <leader>w :InteractiveWindow<CR>
nnoremap <leader>l :Limelight<CR>
nnoremap Z :Files<CR>
nnoremap z :RG<CR>
vnoremap <C-c> :w !pbcopy<CR><CR>
nnoremap <silent> <C-a> :silent! if &laststatus == 0 \| set laststatus=2 showmode cursorline \| else \| set laststatus=0 noshowmode nocursorline \| endif \| silent! AirlineToggle<CR>

xnoremap p "_dP 
"Pegar sen sobreescribir o portapapeis

" ============================================================================
" CONFIGURACIÓN DE PLUGINS
" ============================================================================

let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 0

let g:mucomplete#enable_auto_at_startup = 1

call vimtex#init()
let g:vimtex_quickfix_mode=0
let g:tex_fast = "bMpr"
let g:vimtex_enabled = 0

let g:NERDTreeShowHidden=1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeFileLines = 1

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:limelight_conceal_guifg = '#4c566a'

let g:minimap_range_color = 'TabLine'
let g:minimap_cursor_color = 'TabLineSel'

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

" ============================================================================
"  CORES E APARIENCIA
" ============================================================================
"
if exists('+termguicolors') && ($TERM == "xterm-256color" || $TERM == "tmux-256color")
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1

colorscheme nord
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

" ============================================================================
"  CONFIGURACIÓN BÁSICA
" ============================================================================
set nocompatible                      " Modo moderno de Vim (desactiva compatibilidade con vi)
set encoding=utf-8                   " Usa codificación UTF-8
set term=xterm-256color              " Terminal con 256 cores
set number                           " Amosar números de liña
set relativenumber                   " Amosar números relativos (útil para navegación)
set cursorline                       " Realzar a liña actual
set laststatus=2                     " Amosar sempre a barra de estado
set conceallevel=0                   " Amosar texto oculto (útil con plugins como Limelight)
set completeopt+=menuone,noselect,popup,preview " Completado de código máis elegante
set backspace=indent,eol,start       " Mellorar comportamento da tecla Backspace
set ttimeoutlen=0                    " Resposta máis rápida nas combinacións de teclas
syntax enable                        " Activar resaltado de sintaxe
filetype plugin indent on            " Activar detección de tipo de ficheiro
