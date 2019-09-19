" vim-sneak
let g:sneak#label=1
let g:sneak#s_next=1
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
 
" vim-matchup
let g:matchup_transmute_enabled=0
let g:matchup_matchparen_deferred=1

" defx
let g:defx_icons_enable_syntax_highlight = 0

" netrw
let g:loaded_netrwPlugin=1
let g:netrw_chgwin = 2
let g:netrw_banner=0
let g:netrw_list_hide = ',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize=20
let g:netrw_liststyle=3
let g:netrw_localrmdir='rmtrash'
let g:netrw_bufsettings = "noma nomod nonu nobl nowrap ro nornu buftype=nofile"

" echodoc
let g:echodoc_enable_at_startup=1
let g:echodoc#type='virtual'

" polyglot
let g:jsx_ext_required=0
