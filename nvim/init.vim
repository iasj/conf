let s:nvpm = 1
"░░░░░░░░░░░░░░░ MAIN MENU ░░░░░░░░░░░░░░░░
"░░╭─────────┬──────────────────────────╮░░
"░░│ ctrl-m  │ collapse all sections    │░░
"░░│─────────┼──────────────────────────│░░
"░░│ ctrl-j  │ jump to section below    │░░
"░░│─────────┼──────────────────────────│░░
"░░│ ctrl-k  │ jump to section above    │░░
"░░│─────────┼──────────────────────────│░░
"░░│ ctrl-s  │ jump to subsection below │░░
"░░│─────────┼──────────────────────────│░░
"░░│ ctrl-h  │ close section            │░░
"░░│─────────┼──────────────────────────│░░
"░░│ c-space │ toggle section           │░░
"░░╰─────────┴──────────────────────────╯░░
"░░░░░░░░░░░░░░░ MAIN MENU ░░░░░░░░░░░░░░░░
" Variables                               {
" ├─ s:plugs                              {

  let s:plugs = {}
  let s:plugs['quicktests'] = 1
  let s:plugs['new_plug']   = 1
  let s:loadpluginsettings  = 1

" }
" ├─ completion                           {

  let s:plugs['delimitmate'] = 1

" }
" ├─ nvpm                                 {

  let s:plugs['nvpm'] = 0

" }
" ├─ others                               {

  let s:plugs['argwrap'      ] = 0
  let s:plugs['tabular'      ] = 0
  let s:plugs['openscad'     ] = 0
  let s:plugs['tmuxclipboard'] = 0
  let s:plugs['cleverf'      ] = 1
  let s:plugs['nerdcommenter'] = 1
  let s:plugs['colorscheme'  ] = 1

" }
" └─ Disable all plugins                  {

  let s:killthemall_shownomercy = 0
  if  s:killthemall_shownomercy
    for plug in keys(s:plugs)
      let s:plugs[plug] = 0
    endfor
  endif

" }
" }
" vim-plug                                {
  call plug#begin()
" ├─ <new-plug>                           {

  if s:plugs['new_plug']
  endif

" }
" ├─ colorscheme                          {

  if s:plugs['colorscheme']
  endif

" }
" ├─ nvpm                                 {

  if s:plugs['nvpm'] && !s:nvpm
    Plug 'nvpm/nvpm'
    Plug 'nvpm/zoom'
    Plug 'nvpm/text'
  endif

" }
" ├─ delimitmate                          {

  if s:plugs['delimitmate']
    Plug 'Raimondi/delimitMate'
  endif

" }
" ├─ tabular                              {

  if s:plugs['tabular']
    Plug 'godlygeek/tabular'
  endif

" }
" ├─ argwrap                              {

  if s:plugs['argwrap']
    Plug 'FooSoft/vim-argwrap'
  endif

" }
" ├─ tmuxclipboard                        {

  if s:plugs['tmuxclipboard']
    Plug 'roxma/vim-tmux-clipboard'
  endif

" }
" ├─ openscad                             {

  if s:plugs['openscad']
    Plug 'sirtaj/vim-openscad'
  endif

" }
" ├─ cleverf                              {

  if s:plugs['cleverf']
    Plug 'rhysd/clever-f.vim'
  endif

" }
" ├─ nerdcommenter                        {

  if s:plugs['nerdcommenter']
    Plug 'preservim/nerdcommenter'
  endif

" }
" └─ quicktests                           {

  if s:plugs['quicktests']
    Plug 'https://github.com/preservim/tagbar'
  endif

" }
  call plug#end()
"end-vim-plug}
" Plugins                                 {
" ├─ quicktests                           {

  if s:plugs['quicktests'] && s:loadpluginsettings
  endif

" }
" ├─ new_plug                             {

  if s:plugs['new_plug'] && s:loadpluginsettings
    "<new-plug-settings>
  endif

" }
" ├─ colorscheme                          {

  if s:plugs['colorscheme'] && s:loadpluginsettings
    set termguicolors
    hi comment gui=bold term=bold
    hi folded guibg=#222222 guifg=#777777
  endif



" }
" ├─ nvpm                                 {

  if s:plugs['nvpm'] && s:loadpluginsettings && !s:nvpm

    " NVPMProj {

      set termguicolors
      set hidden
      set showtabline=2
      set laststatus=2

      " Project options
      let g:nvpm_new_project_edit_mode = 1
      let g:nvpm_load_new_project      = 1

      " directory tree
      let g:nvpm_maketree = 1

      " Line options for use with colors
      let g:nvpm_line_closure       = 0
      let g:nvpm_line_innerspace    = 0
      let g:nvpm_line_show_projname = 1
      let g:nvpm_line_bottomright   = '%y%m ⬤ %l,%c/%P'
      let g:nvpm_line_bottomcenter  = ' ⬤ %{NVPMLINEFILENAME()}'
      let g:nvpm_line_git_info      = 1
      let g:nvpm_line_git_delayms   = 5000

      " Git Info Colors
      hi NVPMLineGitModified guifg=#aa4371 gui=bold
      hi NVPMLineGitStaged   guifg=#00ff00 gui=bold
      hi NVPMLineGitClean    guifg=#77aaaa gui=bold

      " Tab Colors
      hi NVPMLineTabs     guifg=#777777 gui=bold
      hi NVPMLineTabsSel  guibg=#333a5a guifg=#ffffff gui=bold
      hi NVPMLineTabsFill guibg=none
      " Buffer Colors
      hi link NVPMLineBuff     NVPMLineTabs
      hi link NVPMLineBuffSel  NVPMLineTabsSel
      hi link NVPMLineBuffFill NVPMLineTabsFill
      " Workspace Colors
      hi link NVPMLineWksp     NVPMLineTabs
      hi link NVPMLineWkspSel  NVPMLineTabsSel
      " Project File Name Colors
      hi NVPMLineProjSel   guifg=#000000 guibg=#007777

      nmap <silent><space>  :NVPMNext buffer<cr>
      nmap <silent>m<space> :NVPMPrev buffer<cr>
      nmap <silent><tab>    :NVPMNext tab<cr>
      nmap <silent>m<tab>   :NVPMPrev tab<cr>
      nmap <silent><c-n>    :NVPMNext workspace<cr>
      nmap <silent><BS>     :NVPMNext workspace<cr>
      nmap <silent><c-p>    :NVPMPrev workspace<cr>
      nmap <F7>             :NVPMLoadProject<space>
      nmap <F8>             :w<cr>:NVPMEditProjects<cr>
      imap <F8>        <esc>:w<cr>:NVPMEditProjects<cr>
      nmap <F9>             :NVPMSaveDefaultProject<space>
      nmap <F10>            :NVPMNewProject<space>
      nmap mt               :NVPMTerminal<cr>
      nmap ml               :NVPMLineSwap<cr>
      nmap <F12>            :NVPMTest<cr>

    " }
    " NVPMZoom {

      let zoom_height = 26
      let zoom_width  = 80
      let zoom_layout = 'left'
      let zoom_left   = 0
      let zoom_right  = 0

      nmap <silent>mn    :Zoom<cr>
      nmap <silent><F11> :Zoom<cr>

    " }
    " NVPMText {

      nmap mja vipo<esc>
               \vip:s/\s\+/ /g<cr>
               \vip:TextJust 35<cr>
               \0vip<c-v><esc>$<right>
               \vip>
               \:nohlsearch<cr>
      nmap mjj vipo<esc>
               \vip:s/\s\+/ /g<cr>
               \vip:TextJust 76<cr>
               \0vip<c-v><esc>$<right>
               \:nohlsearch<cr>
      nmap mj5 vip:TextJust 50<cr>
      nmap mj6 vip:TextJust 60<cr>
      nmap mj7 vip:TextJust 70<cr>

    " }

  endif

" }
" ├─ tabular                              {

  if s:plugs['tabular'] && s:loadpluginsettings
    vmap mt :Tabularize /
  endif

" }
" └─ argwrap                              {

  if s:plugs['argwrap'] && s:loadpluginsettings
    nmap mwr <esc>:ArgWrap<cr>
  endif

" }
" }
" Settings                                {
" ├─ General                              {

  "set cursorline
  "set cursorcolumn
  set noswapfile
  set nobackup
  set ignorecase
  set smartcase
  set mouse=a
  set scrolloff=1000
  set ve=all

  set nobackup
  set nowritebackup
  set cmdheight=1
  set updatetime=1000

  let s:maxw = 80
  let g:netrw_dirhistmax = 0

  " set undofile
  "set wildmenu
  "set wildmode=full
  "set wildignore=*.o,*.obj,*.png,*.jpg,*.jpeg,*.exe
  "set incsearch

" }
" ├─ Indentation                          {

  set autoindent
  set expandtab
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2

" }
" └─ Folding                              {

  set foldenable
  set foldmarker={,}
  set foldmethod=marker
  set foldlevel=100000
  set foldopen=block,hor
  set foldtext=SimpleFoldText()
  function!    SimpleFoldText()
    let line = getline(v:foldstart)
    let width = winwidth('%')
    let line .= repeat(' ',10*width)
    return line
    return substitute(line,'{', '', 'g')
    "}
  endfunction

" }
" }
" Mappings                                {
" ├─ Insert Helpers                       {


  " ctrl+b: left
  " ctrl+f: right
  " ctrl+l: delete
  " ctrl+h: backspace
  " ctrl+w: delete word before
  " ctrl+n: delete word after
  " ctrl+k: delete until end of line
  " ctrl+s: delete until beginning of line
  " ctrl+a: go to the beginning of first word
  " ctrl+e: go to the end of last word
  imap <c-l> <del>
  imap <c-h> <backspace>
  imap <c-w> <esc>cb
  imap <c-g> <esc>dwi
  imap <c-k> <esc>c$
  imap <c-s> <esc>d0xI
  imap <c-a> <esc>I
  imap <c-e> <esc>A
  imap <c-f> <right>
  imap <c-b> <left>

" }
" ├─ Makefile                             {

  nmap <F1> <esc>:wall<cr>:term make     <cr>:startinsert<cr>
  nmap <F2> <esc>:wall<cr>:term make main<cr>:startinsert<cr>
  nmap <F3> <esc>:wall<cr>:term make liby<cr>:startinsert<cr>
  nmap <F4> <esc>:wall<cr>:term make free<cr>:startinsert<cr>

  imap <F1> <esc>:wall<cr>:term make     <cr>:startinsert<cr>
  imap <F2> <esc>:wall<cr>:term make main<cr>:startinsert<cr>
  imap <F3> <esc>:wall<cr>:term make liby<cr>:startinsert<cr>
  imap <F4> <esc>:wall<cr>:term make free<cr>:startinsert<cr>

" }
" ├─ Git helpers                          {


  nmap mga :wall<cr>:!git add .<cr>
  nmap mgc :wall<cr>:!git add .<cr>:!git commit -m ''<left>
  nmap mgr :wall<cr>:!git restore --staged .<cr>
  nmap mgR :wall<cr>:!git restore          .<cr>
  nmap mgb :wall<cr>:!git switch<space>
  nmap mgg :wall<cr>:!git<space>

  nmap <silent>mgs :wall<cr>:term git status<cr>:startinsert<cr>
  nmap <silent>mgd :wall<cr>:term git diff<cr>:startinsert<cr>
  nmap <silent>mgl :wall<cr>:term git log --graph --pretty=oneline
        \                     --abbrev-commit --branches
        \<cr>:startinsert<cr>
  nmap mgp :wall<cr>:term git push orig main --tags<cr>:startinsert<cr>

" }
" ├─ Fold helpers                         {

" ctrl-m     : collapse all sections
" ctrl-j     : jump to section below
" ctrl-k     : jump to section above
" ctrl-s     : jump to subsection below
" ctrl-h     : close section
" ctrl-space : toggle section
nmap <c-j>     zczjzo<c-l>
nmap <c-k>     zczkzo%0<c-l>
nmap <c-m>     zR<c-l>
nmap <cr>      zMggza<c-l>
nmap <c-s>     zjzo<c-l>
nmap <c-h>     zc<c-l>
nmap <c-space> za<c-l>

" }
" ├─ Leader Key                           {

  map , <leader>

" }
" ├─ ESC    Alternatives                  {

  imap jk <esc>
  imap kj <esc>
  imap jj <esc>
  imap kk <esc>

" }
" ├─ Visual Mode                          {

  nmap mv <c-v>
  vmap u  <esc>

  function! s:getSelectedText()
    let l:old_reg = getreg('"')
    let l:old_regtype = getregtype('"')
    norm gvy
    let l:ret = getreg('"')
    call setreg('"', l:old_reg, l:old_regtype)
    exe "norm \<Esc>"
    return l:ret
  endfunction

  vmap <silent>* :call setreg("/",
      \ substitute(<SID>getSelectedText(),
      \ '\_s\+',
      \ '\\_s\\+', 'g')
      \ )<Cr>gv

  vmap <silent># :call setreg("?",
      \ substitute(<SID>getSelectedText(),
      \ '\_s\+',
      \ '\\_s\\+', 'g')
      \ )<Cr>gv

" }
" ├─ Save, Exit, etc                      {

  nmap  s :wall<cr><c-l>
  nmap me :q<cr>
  nmap mx :x<cr>
  nmap <c-d> :q<cr>
  "nmap <s-m>e :qall<cr>
  "nmap <s-m>s :wall<cr>
  "nmap <s-m>x :xall<cr>

" }
" ├─ Command Line                         {

  nmap mm :
  vmap mm :

" }
" ├─ Clipboard                            {

vmap my "+y
nmap mp "+p

vmap <c-c> "+y
imap <c-v> <c-o>"+p


" }
" ├─ Window Resizing                      {

  "nmap <leader>k   <esc>:res +1<cr>
  "nmap <leader>j   <esc>:res -1<cr>
  "nmap <leader>h   <esc><c-w><<cr>
  "nmap <leader>l   <esc><c-w>><cr>

" }
" ├─ Window Moving                        {

  "nmap <c-h> <c-w><c-h>
  "nmap <c-j> <c-w><c-j>
  "nmap <c-k> <c-w><c-k>
  "nmap <c-l> <c-w><c-l>

" }
" ├─ Terminal Mode                        {

  tmap <esc> <c-\><c-n>

" }
" ├─ Tab Related                          {

  "nmap  <tab>   <esc>:tabnext<cr>
  "nmap m<tab>   <esc>:tabprev<cr>
  "nmap >        <esc>:+tabmove<cr>
  "nmap <        <esc>:-tabmove<cr>
  "nmap  <space> :bn<cr>
  "nmap m<space> :bp<cr>

" }
" ├─ Search Related                       {

  set incsearch
  set hlsearch
  fu! SearchSwap()
    if v:hlsearch
      set nohlsearch
    else
      set hlsearch
    endif
  endfu
  nmap mS :call SearchSwap()<cr><c-l>

" }
" ├─ Quick Files                          {

  nmap m1 :edit .nvpm/todo<cr>
  nmap m2 :edit .nvpm/save<cr>
  nmap m3 :edit .gitignore<cr>
  nmap m4 :edit .nvpm/note<cr>
  nmap m5 :edit .nvpm/bugs<cr>
  nmap m0 :edit /i/snip/mess<cr>
  nmap mh :edit ~/refe/make/make.txt<cr>

" }
" └─ Random                               {

  "map <cr> :w<cr>:so ~/.config/nvim/init.vim<cr>

  nmap mw<space> :%s/\s\+$//g<cr>:set nohlsearch<cr>

  nmap mr R

  nmap mq :execute ':term sdcv '.expand("<cword>")<cr>

  imap <m-o> {
  nmap <m-o> i{
  imap <m-e> ;
  imap <m-i> :
  imap <m-4> $
  imap <m-9> (
  imap <m-a> @
  nmap <m-e> i;<esc>
  " don't remove these }
  " don't remove these }

  " Indent whole paragraph
  nmap >> vip>
  nmap << vip<
  " Indent whole block
  nmap >b >iB
  nmap <b <iB

  "nmap mdos :set ff=dos<cr>:w<cr>

  nmap mvim :edit ~/.config/nvim/init.vim<cr>
  nmap <leader>n    :setlocal number!<cr>
  nmap <leader>so   :so ~/.config/nvim/init.vim<cr>
  nmap mbox   :e /i/snip/box-drawing.txt<cr>

  nmap Y yip

" }
" }
" Commands                                {

  command! -complete=file -nargs=* Delete call system("rm -r <args>")
  command! -complete=file -nargs=* Remove call system("rm -r <args>")
  command! -complete=file -nargs=* Move   call system("mv <args>")
  command! -complete=file -nargs=* Mkdir  call system("mkdir -p <args>")

" }
" Autocommands                            {

  " Go to Last Line
  au BufReadPost * '"

  " Autoreload buffer on focus
  au FocusGained,BufEnter * :silent! !
  au FileChangedShell     * :silent! !

  " Automatically execute makefile for latex
  " au BufWritePost *.tex silent! :make

  " Force python with 2 spaces for tab
  au FileType python setlocal
  \ expandtab tabstop=2 shiftwidth=2

  "au BufRead /i/snip/mess,.nvpm/todo,README.md,*.sng
        "\ setlocal spell spelllang=en,pt
  "autocmd BufRead germ.note,germ.dict setlocal ft=seng spell spelllang=en,de
  "autocmd BufRead fren.note,fren.dict setlocal ft=seng spell spelllang=en,fr
  "autocmd BufRead port.note,port.dict setlocal ft=seng spell spelllang=en,pt
  "autocmd BufRead engl.note,engl.dict setlocal ft=seng spell spelllang=en

" }
"
"   press ctrl-m to open MAIN MENU
"
" vim: fdm=marker fmr={,} fdl=0 fen
" The NVPM plugins development section    {
" SEE: https://gitlab.com/nvpm
if s:nvpm

  set termguicolors

  set runtimepath+=~/save/nvpm/nvpm

  " using development packs
  if 0|set runtimepath+=~/proj/nvpm/devl/plug/flux|endif
  if 0|set runtimepath+=~/proj/nvpm/devl/plug/proj|endif
  if 0|set runtimepath+=~/proj/nvpm/devl/plug/rgex|endif
  if 0|set runtimepath+=~/proj/nvpm/devl/plug/test|endif
  if 0|set runtimepath+=~/proj/nvpm/devl/plug/text|endif
  if 0|set runtimepath+=~/proj/nvpm/devl/plug/zoom|endif
  if 0|set runtimepath+=~/proj/nvpm/devl/plug/file|endif

  so ~/proj/nvpm/devl/conf/user.vim
  so ~/proj/nvpm/devl/conf/devl.vim

endif " }
