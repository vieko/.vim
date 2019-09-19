" Section: Keybindings
" --------------------

" better leader
let mapleader=" "

" LEADER -
"        SPC     → find file in project (git based)
         nnoremap <leader><leader> :<C-u>CocList files<CR>
"        '       → resume last search
         nnoremap <leader>' :<C-u>CocListResume<CR>
"        *       → search for symbol in project
         nnoremap <leader>* :<C-u>CocList symbols<CR>
"        .       → find file
         nnoremap <leader>. :<C-u>CocList files<CR>
"        <       → switch buffer
         nnoremap <leader>< :<C-u>CocList buffers<CR>
"        `       → switch to last buffer
         nnoremap <leader>` <C-^>
"        SEARCH  /
"                d      → search current directory
                 nnoremap <leader>/d :<C-u>CocList files<CR>
"                b      → search buffer
                 nnoremap <leader>/b :<C-u>CocList lines<CR>
"                k      → look up in local docset
                 nnoremap <silent><leader>/k :call <SID>ShowDocumentation()<CR>
"                p      → search project
"        BUFFER  b
"                B      → switch buffer
                 nnoremap <leader>bB :<C-u>CocList buffers<CR>
"                N      → new empty buffer
                 nnoremap <silent><leader>bN :enew<CR>
"                d      → kill buffer
                 nnoremap <silent><leader>bd :bd<CR>
"                k      → kill buffer
                 nnoremap <leader>bk :bd<CR>
"                n      → next buffer
                 nnoremap <silent><leader>bn :<C-u>CocNext<CR>
"                p      → previous buffer
                 nnoremap <silent><leader>bp :<C-u>CocPrev<CR>
"                s      → save buffer
                 nnoremap <leader>bs :w!<CR>
"        CODE    c
"                W      → delete trailing newlines
"                d      → jump to definition
"                f      → format buffer / region
"                k      → jump to documentation
"                w      → delete trailing whitespace
"                x      → list errors
"        FILES   f
"                .      → find file
"                /      → find file from here
"                V      → browser neovim config
"                R      → recent project files
"                v      → find file in neovim config
"                r      → recent files
"                s      → save file
"                y      → yank filename
"        GIT     g
"        OPEN    o
"                p      → project sidebar
                 nnoremap <silent><leader>op :call DefxOpen()<CR>
"        PROJECT p
"                .      → browse project
"                /      → find file in project

" change pwd to current working directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>


" clear highlights
nnoremap <silent><Leader><CR> :noh<CR>

" replace all of current word
nnoremap <leader>rs :%s/\<<C-r><C-w>\>//g<left><left>

" reload vimrc file
nnoremap <leader>rl :source ~/.config/nvim/.vimrc<CR>
 
" remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" search with grep
" nnoremap <leader>/ :Rg<space>

" clean some dirty charactors
nnoremap <silent><leader>cl :<C-u>call <SID>Clean()<CR>

" show vim highlight group under cursor
nnoremap <leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nnoremap <silent> <leader>pp "0p
" nnoremap <silent> <leader>o :call <SID>Open()<CR>


" remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)

" fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" coc.nvim
" nmap <leader>x  <Plug>(coc-cursors-operator)
" nmap <leader>rn <Plug>(coc-rename)
" nmap <leader>rf <Plug>(coc-refactor)
" nmap <leader>ca <Plug>(coc-codelens-action)
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>ac <Plug>(coc-codeaction)
" nmap <leader>di <Plug>(coc-diagnostic-info)
" nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>
" nmap <leader>dr <Plug>(coc-diagnostic-related)

vnoremap <leader>g :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
nnoremap <leader>g :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@

function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList grep '.word
endfunction

" simple clean utility
function! s:Clean()
  let view = winsaveview()
  let ft = &filetype
  " replace tab with 2 space
  if index(['javascript', 'html', 'css', 'vim', 'php'], ft) != -1
    silent! execute "%s/\<tab>/  /g"
  endif
  " replace tailing comma
  if ft ==# 'javascript' || ft ==# 'typescript'
    silent! execute '%s/;$//'
  endif
  " remove tailing white space
  silent! execute '%s/\s\+$//'
  " remove windows `\r`
  call winrestview(view)
endfunction

function! s:Open()
  let res = CocAction('openLink')
  if res | return | endif
  let line = getline('.')
  " match url
  let url = matchstr(line, '\vhttps?:\/\/[^)\]''" ]+')
  if !empty(url)
    let output = system('open '. url)
  else
    let mail = matchstr(line, '\v([A-Za-z0-9_\.-]+)\@([A-Za-z0-9_\.-]+)\.([a-z\.]+)')
    if !empty(mail)
      let output = system('open mailto:' . mail)
    else
      let output = system('open ' . expand('%:p:h'))
    endif
  endif
  if v:shell_error && output !=# ""
    echoerr output
  endif
endfunction

function! s:ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction




