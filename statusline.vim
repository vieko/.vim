" Section: Powerline
" ------------------

" Airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=0
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline#extensions#coc#enabled=1
let g:airline#extensions#coc#error_symbol='E:'
let g:airline#extensions#coc#warning_symbol='W:'
let g:airline#extensions#coc#stl_format_err='%E{[%e(#%fe)]}'
let g:airline#extensions#coc#stl_format_warn='%W{[%w(#%fw)]}'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

let g:airline#extensions#tmuxline#enabled=0

let g:airline#extensions#tabline#enabled=0
" let g:airline#extensions#tabline#show_splits=1
" let g:airline#extensions#tabline#show_buffers=1
" let g:airline#extensions#tabline#alt_sep=0
" let g:airline#extensions#tabline#show_tabs=0
" let g:airline#extensions#tabline#buffer_idx_mode=1
" let g:airline#extensions#tabline#show_close_button=0
" let g:airline#extensions#tabline#tab_nr_type=1
" let g:airline#extensions#tabline#show_tab_nr=1
" let g:airline#extensions#tabline#show_tab_type=1
" let g:airline#extensions#tabline#tabs_label='tabs'
" let g:airline#extensions#tabline#buffers_label='buffers'
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:airline_filetype_overrides = {
\ 'defx':  ['defx', '%{b:defx.paths[0]}'],
\ 'help':  [ 'Help', '%f' ],
\ }

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.notexists=' ?'
let g:airline_symbols.dirty='  '

