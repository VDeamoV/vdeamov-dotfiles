""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Pluglist                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" bug fix in latest neovim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" chatgpt
Plug 'CoderCookE/vim-chatgpt'
let g:api_type = 'azure'
let g:chat_gpt_key = ''
let g:azure_endpoint = ''
let g:azure_deployment = 'devapi4o'
let g:azure_api_version = '2024-02-15-preview'
let g:chat_gpt_model = 'gpt-4o'
let g:chat_gpt_split_direction = 'horizontal'
let g:split_ratio=4
let g:chat_gpt_lang="Chinese"
let g:chat_gpt_session_mode=1
let g:chat_gpt_max_tokens=4096

" System
Plug 'vim-scripts/LargeFile'                            " Fast Load for Large files
Plug 'wellle/targets.vim'                               " text objects
Plug 'ryanoasis/vim-devicons'                           " extensions for icons
Plug 'lambdalisue/nerdfont.vim'

Plug 'unblevable/quick-scope'                           " Advance setting for f t search
Plug 'mbbill/undotree'                                  " history of the undo
Plug 'Shougo/context_filetype.vim'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'terryma/vim-expand-region'                        " Use + / _ to expand or shrink selected region

if has('nvim')
  Plug 'ncm2/float-preview.nvim'                              " showing doc with float windows not preview beside the functions
  let g:float_preview#docked = 0
endif
Plug 'voldikss/vim-floaterm'                                  " floating terminaler you must like it

" Coding
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'                                 " snippets
Plug 'Duan-JM/vdeamov-snippets'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'                             " Brackets Jump 智能补全括号和跳转
                                                        " 补全括号 shift+tab出来
Plug 'andymass/vim-matchup'                             " % g% z%
Plug 'octol/vim-cpp-enhanced-highlight', {'for':['c', 'cpp']}
Plug 'godlygeek/tabular'                                " Use command Tabulize to align text
Plug 'tpope/vim-surround'                               " change surroundings
                                                        " c[ange]s[old parttern] [new partten]
                                                        " ds[partten]
                                                        " ys(iww)[partten] / yss)
Plug 'tpope/vim-repeat'                                 " for use . to repeat for surround
Plug 'liuchengxu/vista.vim', {'for':['c', 'cpp', 'python', 'markdown', 'ts', 'tsx']}         " show params and functions

Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'  " This combination can change default run
Plug 'ntpeters/vim-better-whitespace'


" Writing Blog
" Plug 'plasticboy/vim-markdown', {'for': ['markdown']} # disable for conflict
" with other syntax plugin
Plug 'mzlogin/vim-markdown-toc', {'for': ['markdown']}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" :GenTocGFM/:GenTocRedcarpet
":UpdateToc 更新目录
Plug 'dhruvasagar/vim-table-mode', {'for': ['markdown']}
"<leader>tm to enable
"|| in the insert mode to create a horizontal line
"| match the | up row
"<leader>tdd to delete the row
"<leader>tdc to delete the coloum
"<leader>tt to change the exist text to format table
Plug 'xuhdev/vim-latex-live-preview', {'for': ['tex']}                          " Use when you work with cn
Plug 'lervag/vimtex', {'for': ['tex']}                                          " English is okay, fail with cn

"FileManage
" Plug 'mhinz/vim-startify'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

" Appearance
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'flazz/vim-colorschemes'
Plug 'Yggdroot/indentLine'                                                      " Show indent line
Plug 'kshenoy/vim-signature'                                                    " Visible Mark
Plug 'luochen1990/rainbow'                                                      " multi color for Parentheses
Plug 'sainnhe/edge'
Plug 'wadackel/vim-dogrun'
Plug 'mrjones2014/lighthaus.nvim'
Plug 'lighthaus-theme/vim-lighthaus'

" Github
" Plug 'mattn/gist-vim'                                                           " :Gist -l/-ls :Gist -e (add gist name) -s (add description) -d (delete)
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'                                                          " Rely on fugitive
Plug 'APZelos/blamer.nvim'

" Search
Plug 'nvim-lua/plenary.nvim'
" Plug 'mrjones2014/dash.nvim' , { 'do': 'make install' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'junegunn/vim-slash'                                                       " clean hightline after search
call plug#end()


" ==================
" Plugin Configures
" ==================

" APZelos/blamer.nvim
let g:blamer_enabled = 1           " auto enable
let g:blamer_show_in_visual_modes = 1

" skywind3000/asynctasks.vim
let g:asyncrun_open=6
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
let g:asynctasks_term_pos = 'bottom'
let g:asynctasks_term_rows = 10    " 设置纵向切割时，高度为 10
let g:asynctasks_term_cols = 80    " 设置横向切割时，宽度为 80
nnoremap <leader>r :AsyncTask file-run<cr>
nnoremap <leader>b :AsyncTask file-build<cr>
" vim-floaterm
tnoremap <c-[> <c-\><c-n>
nnoremap <leader>` :FloatermToggle<cr>

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Trigger a highlight in the appropriate direction when pressing these keys:
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" ncm2/float-preview.nvim
let g:float_preview#docked = 0

" rainbow
let g:rainbow_active = 1

"markdown-preview
let g:mkdp_browser = 'Safari'

" junegunn/vim-slash
noremap <plug>(slash-after) zz
if has('timers')
  " Blink 2 times with 50ms interval
  noremap <expr> <plug>(slash-after) slash#blink(2, 50)
endif

"vim-latex-live-preview
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'

"vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" TODO(Duan-JM): No need for this
""mhinz/vim-startify
"let g:startify_list_order = [
"            \ ['   Bookmarks'],     'bookmarks',
"            \ ['   MRU'],           'files' ,
"            \ ['   MRU '.getcwd()], 'dir',
"            \ ]
"let g:startify_bookmarks = [
"            \ '~/Desktop/Github',
"            \ '~/Documents/Coding/Test']
"let g:startify_change_to_dir          = 0
"let g:startify_enable_special         = 0
"let g:startify_files_number           = 8
"let g:startify_session_autoload       = 1
"let g:startify_session_delete_buffers = 1
"let g:startify_session_persistence    = 1
"let g:startify_use_env                = 1

"Shougo/vimfiler.vim
" nnoremap <leader>nt :VimFilerSimple<CR>
" let g:vimfiler_as_default_explorer = 1

" ntpeters/vim-better-whitespace
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1

"Shougo/defx
nnoremap <leader>nt :Defx -columns=git:indent:icon:filename -split=vertical -winwidth=50 -direction=topleft <cr>
nnoremap - :Defx -columns=git:indent:icon:filename:time <cr>
call defx#custom#column('git', 'column_length', 1)
call defx#custom#column('git', 'max_indicator_width', 1)
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : 'M',
  \ 'Staged'    : 'S',
  \ 'Untracked' : 'U',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })
hi Defx_git_Untracked guifg=#FF0000
hi Defx_git_Ignored guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
hi Defx_git_Unknown guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
hi Defx_git_Renamed ctermfg=214 guifg=#fabd2f
hi Defx_git_Modified ctermfg=214 guifg=#fabd2f
hi Defx_git_Unmerged ctermfg=167 guifg=#fb4934
hi Defx_git_Deleted ctermfg=167 guifg=#fb4934
hi Defx_git_Staged ctermfg=142 guifg=#b8bb26

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> v
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'git:mark:indent:icon:filename:size:time')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
endfunction

"vim-table-mode
let g:table_mode_corner = '|'
let g:table_mode_delimiter = ' '
let g:table_mdoe_verbose = 0
let g:table_mode_auto_align = 0
"autocmd FileType markdown TableModeEnable

"vim-markdown
let g:vim_markdown_math=1

"vim-markdown-toc
let g:vmt_auto_update_on_save=1 "update toc when save
let g:vmt_dont_insert_fence=0 "if equals to 1, can't update toc when save

""gist-vim
"let github_user='Duan-JM'


"Yggdroot/indentLine
let g:indentLine_enabled=1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Telescope
" Find files using Telescope command-line sugar.
" C-v to open in vsplit, C-x to open in split
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" vista.vim
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
left g:vista_default_executive = 'ctags'
let g:vista#renderer#enable_icon = 0

"LightLine
"ayu_dark / simple black
let g:lightline = {
     \ 'colorscheme': 'lighthaus',
     \ 'active': {
     \   'left': [
     \     [ 'mode', 'paste' ],
     \     [ 'filename', 'modified' ],
     \     [ 'gitbranch' ],
     \     [ 'cocstatus' ],
     \   ],
     \ 'right': [
     \     ['lineinfo'],
     \     ['percent'],
     \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]
     \   ],
     \ },
     \ 'separator': {
     \   'left': '',
     \   'right': ''
     \ },
     \ 'component_function': {
     \   'gitbranch': 'FugitiveHead',
     \   'cocstatus': 'coc#status',
     \ },
     \ 'component_type': {
     \   'readonly':        'error',
     \   'linter_infos': 'right',
     \   'linter_warnings': 'warning',
     \   'linter_errors': 'error',
     \   'linter_ok': 'right',
     \ },
     \ 'enable': {
     \   'statusline': 1,
     \   'tabline': 0
     \ }
     \}

"SirVer/ultisnips
"customize python and keymapping
"ref:https://gist.github.com/lencioni/dff45cd3d1f0e5e23fe6
let g:snips_author = 'Duan-JM'
let g:snips_email = 'vincent.duan95@outlook.com'
let g:snips_github = 'https://github.com/Duan-JM'
let g:ultisnips_python_style = 'google'

" Appearance Settings
colorscheme lighthaus_dark

func plugin_configs#init_plugin_configs()
  echom "plugin configs activated"
endfunc
