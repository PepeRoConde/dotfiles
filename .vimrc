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
Plug 'lambdalisue/vim-fern'
Plug 'brandon1024/fern-renderer-nf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'lifepillar/vim-mucomplete'
Plug 'wfxr/minimap.vim'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/conflict-marker.vim'
Plug 'romgrk/winteract.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jpalardy/vim-slime', { 'for': ['python', 'julia'] }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Estética
Plug 'arcticicestudio/nord-vim'
"Plug 'iammerrick/nova-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'zefei/vim-wintabs'
"Plug 'zefei/vim-wintabs-powerline'

Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'lambdalisue/vim-glyph-palette'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()

" ============================================================================
"  ATALLOS DE TECLADO
" ============================================================================
let maplocalleader = ' '             " Tecla líder local

nnoremap <C-e> :bn<CR>
nnoremap <C-q> :bp<CR>
nnoremap <C-m> <Cmd>MarkdownPreview<CR>
nnoremap <C-t> <Cmd>NERDTreeToggle<CR>
nnoremap <C-f> <Cmd>Fern . -drawer<CR>
nnoremap <C-d> <Cmd>Vista finder<CR>
nnoremap ñ <Cmd>Vista!!<CR>
nnoremap <C-u> <Cmd>UndotreeToggle<CR>
nnoremap <C-x> <Cmd>MinimapToggle<CR>
"nnoremap <C-x> <Cmd>Vista!!<CR>
nnoremap + :silent Goyo 80%x80% \| redraw!<CR>
nnoremap - :silent Goyo 50%x80% \| redraw!<CR>
nnoremap _ :Goyo \| q<CR>
nnoremap <C-w> :InteractiveWindow<CR>
"nnoremap <leader>l :Limelight<CR>
nnoremap Z :Files<CR>
nnoremap z :RG<CR>
vnoremap <C-c> :w !pbcopy<CR><CR>
"nnoremap <silent> <C-a> :silent! if &laststatus == 0 \| set laststatus=2 showmode cursorline \| else \| set laststatus=0 noshowmode nocursorline \| endif \| silent! AirlineToggle<CR>
nnoremap <silent> <C-a> :silent! if &laststatus == 0 \| set laststatus=2 showmode  \| else \| set laststatus=0 noshowmode \| endif \| silent! AirlineToggle<CR>

xnoremap p "_dP 
"Pegar sen sobreescribir o portapapeis

" ============================================================================
" CONFIGURACIÓN DE PLUGINS
" ============================================================================

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b'] ,['y', 'z']]
let g:airline_theme='base16_nord'


"<<coc
"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

">>coc
let g:conflict_marker_highlight_group = ''

highlight ConflictMarkerBegin guibg=#ff0000
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81


let g:mucomplete#enable_auto_at_startup = 1

"let g:tmux_navigator_no_mappings = 0

call vimtex#init()
let g:vimtex_quickfix_mode=0
let g:tex_fast = "bMpr"
let g:vimtex_enabled = 0

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType fall-list call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END


let g:trisquel = [
\ '                                                             ',
\ '                                                             ',
\ '                                                             ',
\ '                                                             ',
\ '                                                             ',
\ '                                           ====*+====        ',
\ '                                       ==*************==     ',
\ '                                     ==***==      ==+####=   ',
\ '          -==========               =###=            ==###== ',
\ '      ==***************===          =##=       =#=    =+%%%= ',
\ '   ==*******###############=        =#=         =%=    =%%%%=',
\ '  =#####=-        ==#########=      =%%=        =#=    =%%%%=',
\ ' =####=              ==%%%%%%%*=     =%%=      =%=-   =%%%%%=',
\ '=###+=    ==#%%%%%==   ==%%%%%%%=      =%%%%%%%==    =%%%%%= ',
\ '=%%%=    =%==   -=*%=    =%%%%%%%+=        ==      =*%%%%%=- ',
\ '=%%%=   =+=        =%=    =%%%%%%%%*=          ==+%%%%%%%=   ',
\ '=%%%==             =%=    =%%%%%%%%%%%%%%%%%%%%%%%%%%%%==    ',
\ ' =%%%%=           ==%=   =*%%%%%%%%%%%%%%%%%%%******#=       ',
\ '  =%%%%%===    ===%%=    =%%%%%%%%%%*******######===         ',
\ '    ==%%%%%%%%%%%==     =%%*******##*==========              ',
\ '         =====         =*#######=                            ',
\ '                       =######=                              ',
\ '                      =######=     ==#####===                ',
\ '                      =#####=    =##==   ==+##=              ',
\ '                     =*#####=   =#=         -+%%=            ',
\ '                     -+#####=   =%=          =%%%=           ',
\ '                      =%%%%%=   =%=          -*%%=           ',
\ '                      =%%%%%==   ==%=====    =#%%=           ',
\ '                       =%%%%%%=      ===     =%%%=           ',
\ '                        =%%%%%%=-          =*%%%=            ',
\ '                          =+%%%%%%=======#%%%%%=             ',
\ '                            -=%%%%%%%%%%%%%%==               ',
\ '                                =====#====                   ',
\ ]

let g:startify_custom_header = 'startify#center(g:trisquel)'

augroup startify_custom
  autocmd!
  autocmd FileType startify :IndentLinesDisable
  autocmd FileType startify :AirlineToggle
  autocmd FileType startify setlocal laststatus=0
augroup END


"autocmd FileType startify setlocal nocursorline

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

let g:fern#renderer = 'brandon1024/fern-renderer-nf.vim'
function! s:init_fern() abort
  " Just clear Fern's conflicting mappings, don't add new ones
  silent! nunmap <buffer> <C-h>
  silent! nunmap <buffer> <C-j>
  silent! nunmap <buffer> <C-k>
  silent! nunmap <buffer> <C-l>
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
"let g:fern#renderer = 'nerdfont'

" ============================================================================
"  CORES E APARIENCIA
" ============================================================================
"
if exists('+termguicolors') && ($TERM == "xterm-256color" || $TERM == "tmux-256color")
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

"let g:nord_italic = 1
"let g:nord_italic_comments = 1
"let g:nord_underline = 1
"let g:nord_uniform_status_lines = 1
"let g:nord_uniform_diff_background = 1
"let g:nord_cursor_line_number_background = 1

colorscheme nord
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

:set fillchars+=vert:\ 
let &fillchars ..= ',eob: '

" ============================================================================
"  CONFIGURACIÓN BÁSICA
" ============================================================================
set nocompatible                      " Modo moderno de Vim (desactiva compatibilidade con vi)
set encoding=utf-8                   " Usa codificación UTF-8
set term=xterm-256color              " Terminal con 256 cores
set number                           " Amosar números de liña
set relativenumber                   " Amosar números relativos (útil para navegación)
"set cursorline                       " Realzar a liña actual
set laststatus=2                     " Amosar sempre a barra de estado
set conceallevel=0                   " Amosar texto oculto (útil con plugins como Limelight)
set completeopt+=menuone,noselect,popup,preview " Completado de código máis elegante
set backspace=indent,eol,start       " Mellorar comportamento da tecla Backspace
set ttimeoutlen=0                    " Resposta máis rápida nas combinacións de teclas
syntax enable                        " Activar resaltado de sintaxe
filetype plugin indent on            " Activar detección de tipo de ficheiro

