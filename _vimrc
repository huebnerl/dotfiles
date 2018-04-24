"
" vimrc
" vim configuration file
"
" Lars Hübner
" 22. April 2018
"

" start pathogen
execute pathogen#infect()
Helptags

" remove all the window stuff
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar

" use the new vi Improved commands
"
" this command is completely unnecessary because it will be set automaticaly 
" if a vimrc has been found
set nocompatible

" fix some issues with windows
" as info: you can paste with shift-insert
set backspace=2
set tabstop=4
set textwidth=100

filetype plugin indent on
syntax on

" make command-line autocomplete look nicer
set wildmenu

" FUZZY FINDER
" do fuzzy with *
" :ls list the buffer
" :b 1 to switch to file 1 in buffer - also works with autocomplete any open
"
" for :find files in sub-sub-folder
set path+=**

" set colorscheme to jetbrains dark like
colorscheme darcula 

nnoremap ,k <Esc>:NERDTreeToggle<CR>

set encoding=utf-8

" python setup -------------------------------------------------
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
    autocmd Filetype python setlocal omnifunc=lsp#complete
endif

" Python run command
autocmd Filetype python nnoremap <F5> <Esc>:w !python<CR>


" cpp setup -------------------------------------------------
if executable('cquery')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['cquery']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
   autocmd Filetype cpp setlocal omnifunc=lsp#complete
endif

autocmd Filetype cpp nnoremap <F5> <Esc>:w ! g++ % && a.exe<CR>

autocmd Filetype cpp nnoremap <F6> <Esc>:w ! echo.) > CMakeLists.txt & echo add_executable(%:t:r %:t) >> CMakeLists.txt
autocmd Filetype cpp nnoremap <F7> <Esc>:w ! mkdir build<CR>
autocmd Filetype cpp nnoremap <F8> <Esc>:w ! cd build\ && cmake -G "Unix Makefiles" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..<CR>
autocmd Filetype cpp nnoremap <F9> <Esc>:w ! cd build\ && make<CR>
autocmd Filetype cpp nnoremap <S-F10> <Esc>:! build\ %:t:r.exe<CR>

" some directly implemented snippets
autocmd FileType cpp inoremap ,nn <Esc>/<++><Enter>"_c4l
autocmd FileType h inoremap  ,nn <Esc>/<++><Enter>"_c4l

autocmd FileType cpp inoremap ,im int<Space>main(int<Space>argc,<Space>char*<Space>argv[]){<Enter><Enter>return<Space>0;<Enter>}<Esc>kki<Tab>
autocmd FileType cpp inoremap ,fi for<Space>(int<Space>i<Space>=<Space>0;<Space>i<Space><<Space><++>;<Space>++i){<Enter><++><Enter>}<Esc>/<++><Enter>"_c4l
autocmd FileType cpp inoremap ,co std::cout<Space><<<Space>"<++>"<Space><<<Space>std::endl;<Enter><++><Esc>/<++><Enter>"_c4l
autocmd FileType cpp inoremap ,ci std::cin<Space>>><Space>;<Esc>i
autocmd FileType cpp inoremap ,wl while<Space>(<++>){<Enter><++><Enter>}<Esc>/<++><Enter>"_c4l
autocmd FileType cpp inoremap ,if if<Space>(<++>){<Enter><++><Enter>}<Esc>/<++><Enter>"_c4l
autocmd FileType cpp inoremap ,cl class<Space><++>{<Enter>private:<Enter><++><Enter>public:<Enter><Esc>xi<Tab><Tab><++><Enter>};<Esc>/<++><Enter>"_c4l
autocmd FileType h inoremap ,cl class<Space><++>{<Enter>private:<Enter><++><Enter>public:<Enter><Esc>xi<Tab><Tab><++><Enter>};<Esc>/<++><Enter>"_c4l
autocmd FileType cpp inoremap ,up std::unique_ptr<<++>><Space><++>(new <++>(<++>));<Esc>/<++><Enter>"_c4l
autocmd FileType h inoremap ,up std::unique_ptr<<++>><Space><++>(new <++>(<++>));<Esc>/<++><Enter>"_c4l
autocmd FileType cpp inoremap ,sp std::shared_ptr<<++>><Space><++><Space>=<Space>std::make_shared<<++>>(<++>);<Esc>/<++><Enter>"_c4l
autocmd FileType h inoremap ,sp std::shared_ptr<<++>><Space><++><Space>=<Space>std::make_shared<<++>>(<++>);<Esc>/<++><Enter>"_c4l
