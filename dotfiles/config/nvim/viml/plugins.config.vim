" plugins config {{{

" deoplete {{{
let g:deoplete#enable_at_startup = 1
"let g:deoplete#max_list = 15
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" }}} deoplete

" echodoc {{{
let g:echodoc_enable_at_startup = 1
set noshowmode
" }}} echodoc

" vim-polyglot"{{{
let g:jsx_ext_required = 1
" }}} vim-polyglot

" context_filetype {{{
if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#same_filetypes = {}
endif
let g:context_filetype#same_filetypes.javascript = 'html,string,String'
let g:context_filetype#same_filetypes.html = 'javascript,string,String'
let g:context_filetype#same_filetypes.string = 'javascript,html,String'
let g:context_filetype#same_filetypes.String = 'javascript,html,string'

" }}} context_filetype

" deoplete-ternjs {{{
set completeopt-=preview
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 1
" }}} deoplete-ternjs

" deoplete-typescript {{{
"let g:deoplete#sources#tss#javascript_support = 1
" }}} deoplete-typescript

" neomake {{{
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_html_enabled_makers = ['tidy']
autocmd! BufWritePost *.{js,css,html,py,vim} Neomake
" }}} neomake

" closetag {{{
let g:closetag_html_style=1     " html sytle tag matching
autocmd BufRead,BufNewFile *.{String,string} set filetype=html
" }}} closetag

" css complete {{{
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
" }}}

" vim-JsBeautify {{{
let g:html_indent_inctags = 'html,body,head,tbody'
let g:html_indent_script1 = 'inc'
let g:html_indent_style1 = 'inc'
let g:vim_json_syntax_conceal = 0
autocmd FileType javascript noremap <buffer>  <leader>sf :call JsBeautify()<cr>
autocmd FileType javascript vnoremap <buffer> <leader>sf :call RangeJsBeautify()<cr>
autocmd FileType html noremap <buffer> <leader>sf :call HtmlBeautify()<cr>
autocmd FileType html vnoremap <buffer> <leader>sf :call RangeHtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <leader>sf :call CSSBeautify()<cr>
autocmd FileType css vnoremap <buffer> <leader>sf :call RangeCSSBeautify()<cr>
autocmd FileType json noremap <buffer> <leader>sf :call JsonBeautify()<cr>
autocmd FileType json vnoremap <buffer> <leader>sf :call RangeJsonBeautify()<cr>
" }}} vim-JsBeautify

" vim-jsdoc {{{
"nmap <silent> <C-l> ?function<cr>:noh<cr><Plug>(jsdoc)
" }}} vim-jsdoc

" coffee-script {{{
" coffee-script的缩进为2个空格
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType coffee noremap <buffer> <leader>w :CoffeeWatch<cr>
" }}} coffee-script

" markdown {{{
autocmd BufRead,BufNewFile *.{md,mkd,markdown,mdown,mkdn,mdwn} set filetype=markdown
" }}} markdown

" font vim-devicons {{{
"let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" }}} font vim-devicons

" markdown-preview {{{
if has('mac')
    let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
elseif has('unix') && !has('mac')
    let g:mkdp_path_to_chrome = "google-chrome"
endif
" }}} markdown-preview

" ctrlsf {{{
" ag sudo apt-get install silversearcher-ag
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_default_root = 'project'
nmap <leader>fs <Plug>CtrlSFPrompt
nmap <leader>fw <Plug>CtrlSFCwordPath
nmap <Leader>fo :CtrlSFOpen<CR>
" }}} ctrlsf

" ctrlp {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
noremap <Leader>p :CtrlP ./<CR>
noremap <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
            \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
let g:ctrlp_working_path_mode = 'ra'    " 搜索根目录使用模式
" }}} ctrlp

" vim-fugitive {{{
" TODO: config
" }}} vim-fugitive

" vim-gitgutter {{{
" TODO: config
" }}} vim-gitgutter

" vim-trailing-whitespace {{{
map <leader><space> :FixWhitespace<cr>
" }}} vim-trailing-whitespace

" vim-multiple-cursors {{{
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
function Multiple_cursors_before()
    let g:deoplete#disable_auto_complete = 1
endfunction
function Multiple_cursors_after()
    let g:deoplete#disable_auto_complete = 0
endfunction
" }}} vim-multiple-cursors

" textobj-user {{{
try
    call textobj#user#plugin('html', {
                \   'keyVal': {
                \     'pattern': ' *[^" ]\+ *= *"[^"]\+"',
                \     'select': ['ak', 'ik'],
                \   },
                \ })
catch /.*/
endtry
" }}} textobj-user

" vim-expand-region {{{
map + <Plug>(expand_region_expand)
map _ <Plug>(expand_region_shrink)
" }}} vim-expand-region

" vim-autoclose {{{
let g:AutoClosePairs_del= "{}"
" }}} vim-autoclose

" quickrun {{{
let g:quickrun_config = {}
let g:quickrun_config.javascript = {
            \'outputter/buffer/split': 'bo',
            \'outputter/buffer/into': 1,
            \'outputter/buffer/close_on_empty': 1
            \}
let g:quickrun_config.coffee = {
            \'outputter/buffer/split': 'bo',
            \'outputter/buffer/into': 1,
            \'outputter/buffer/close_on_empty': 1
            \}
let g:quickrun_config.python = {
            \'outputter/buffer/split': 'bo',
            \'outputter/buffer/into': 1,
            \'outputter/buffer/close_on_empty': 1
            \}
let g:quickrun_config.sh = {
            \'outputter/buffer/split': 'bo',
            \'outputter/buffer/into': 1,
            \'outputter/buffer/close_on_empty': 1
            \}
" }}} quickrun

" easy-align {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}} easy-align

" NerdTree {{{
function! GetRootPathDirectory()
    return fnamemodify(finddir('.git', fnameescape(expand('%:p:h')) . ';'), ':h')
endfunction

function! OpenNerdTreeAtRootDirectory()
    if !g:NERDTree.IsOpen()
        exec "cd " . GetRootPathDirectory()
        NERDTreeFind "\"" . expand('%:p') . ".""
    else
        NERDTreeToggle
    endif
endfunction

map <silent> <leader>e :call OpenNerdTreeAtRootDirectory()<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

" resolve Dots after icons in NERDTree
autocmd FileType nerdtree setlocal nolist

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

" }}} NerdTree

" ctrlspace {{{
set showtabline=0
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
" }}} ctrlspace

" mundo {{{
nnoremap <Leader>h :MundoToggle<CR>
" }}} mundo

" neoterm {{{
let g:neoterm_size = 10
" open new term
nnoremap <silent> ,tn :call neoterm#tnew()<CR>
" open term
nnoremap <silent> ,to :call neoterm#open()<CR>
" Toggles the last window in the current tab.
nnoremap <silent> ,tt :call neoterm#toggle()<CR>
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<CR>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<CR>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<CR>
" command
nnoremap <silent> ,tm :T
" }}} neoterm

" airline {{{
"let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
" }}} airline

" parenmatch {{{
" disable the default matchparen plugin
let g:loaded_matchparen = 1
" }}} parenmatch

" }}} plugins config

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
