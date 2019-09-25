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
let g:matchup_matchparen_deferred=1
let g:matchup_matchparen_enabled=0
let g:matchup_matchparen_offscreen={}

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
" let g:echodoc_enable_at_startup=1
" let g:echodoc#type='virtual'

" polyglot
let g:jsx_ext_required=0

" limelight
let g:limelight_conceal_guifg = '#3c3836'
let g:limelight_paragraph_span = 0

" autopairs
let g:AutoPairsShortcutToggle=''
let g:AutoPairsShortcutFastWrap=''
let g:AutoPairsShortcutJump=''
let g:AutoPairsShortcutBackInsert=''
 
" vim-hardtime
let g:hardtime_default_on=1
let g:hardtime_allow_different_key=1
let g:hardtime_showmsg=1
let g:hardtime_ignore_buffer_patterns=[".git/index"]
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []
