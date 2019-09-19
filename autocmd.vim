" Section: Auto Commands
" ----------------------

augroup common
  autocmd!
  autocmd BufEnter * call EmptyBuffer()
  autocmd BufWinEnter * call s:OnBufEnter()
  autocmd ColorScheme * call s:Highlight()
  autocmd FileType * call s:OnFileType(expand('<amatch>'))
  if exists('##DirChanged')
    autocmd DirChanged,VimEnter * let &titlestring = pathshorten(substitute(getcwd(), $HOME, '~', ''))
  endif

  autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  autocmd BufEnter,FocusGained * checktime

  autocmd CursorHold * silent! call CocActionAsync('highlight')
  autocmd User CocQuickfixChange :CocList --normal quickfix
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  autocmd FileType *
  \ if &omnifunc == "" |
  \    setlocal omnifunc=syntaxcomplete#Complete |
  \ endif

  autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

  autocmd FileType json syntax match Comment +\/\/.\+$+
  autocmd FileType typescript setl formatexpr=CocAction('formatSelected')
  autocmd FileType typescript let b:coc_pairs_disabled = ['<']
augroup end

augroup COC
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

function! EmptyBuffer()
  if @% ==# ""
    setfiletype txt
  endif
endfunction

function! s:Highlight() abort
  " if !has('gui_running') | hi normal guibg=NONE | endif
  hi link CocCursorRange         Search
  hi link CocErrorSign           GruvboxRedSign
  hi link CocWarningSign         GruvboxYellowSign
  hi link CocInfoSign            GruvboxBlueSign
  hi link CocHintSign            GruvboxBlueSign
  hi link CocErrorVirtualText    GruvboxBg2
  hi link CocWarningVirtualText  GruvboxBg2
  hi link CocInfoVirtualText     GruvboxBg2
  hi link CocHintVirtualText     GruvboxBg2
  hi link CocFloating            SignColumn
  hi link MsgSeparator           MoreMsg
  hi VertSplit                   guifg=#3c3836
  hi ColorColumn                 guibg=#1d2021
  hi HighlightedyankRegion       guibg=#d65d0e
  hi CursorLineNr                guifg=#7c6f64
  hi LineNr                      guifg=#504945
endfunction

function! s:OnFileType(filetype)
  if index(['xml', 'html', 'css', 'scss', 'less'], a:filetype) >=0
    let b:coc_additional_keywords = ['-']
  endif
endfunction

function! s:OnBufEnter()
  let name = bufname(+expand('<abuf>'))
  if &previewwindow || name =~# '^term://' || &buftype ==# 'nofile' || &buftype ==# 'help'
    if !mapcheck('q', 'n')
      nnoremap <silent><buffer> q :<C-U>bd!<CR>
    endif
  elseif name =~# '/tmp/'
    setl bufhidden=delete
  endif
  unlet name
endfunction

