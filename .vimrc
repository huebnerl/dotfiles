" SOME PLUGINS
call plug#begin('~/.config/vim/plugged')
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        Plug 'crusoexia/vim-monokai'
        Plug 'vim-scripts/darkspectrum'
        Plug 'vim-scripts/256-grayvim'
	Plug 'vim-scripts/AutoComplPop'

	" autocomplete
	Plug 'davidhalter/jedi-vim'
	Plug 'Shougo/neocomplcache.vim'
call plug#end()

" GENERAL SETTING WHEN STARTING VIM
" autocmd VimEnter * NERDTree
nnoremap ,k <Esc>:NERDTreeToggle<CR>
"
" press m to show all possible action in NERDTree
"
colorscheme 256-grayvim
" set nu
set rnu

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
filetype plugin on
syntax on

" FUZZY FINDER
" for :find files in sub-sub-folder
" do fuzzy with *
" :ls list the buffer
" :b 1 to switch to file 1 in buffer - also works with autocomplete any open
set path+=**

set wildmenu


" DEFINITION JUMPING
" Create the 'tags' file (may needto install ctags first)
command! MakeTags !ctags -R .

" use C-j mapping to go to definition
" use C-t to go to usage
" use g] to list all definitions
:nnoremap <C-j> <C-]>


" AUTOCMPLETE
"
" the good stuff is documented in |ins-complete|
"
" - ^x^n for just this file
" - ^x^f for filenames (works with our path trick!)
" - ^n for anything specified by the complete option 
"
"   use ^n and ^p to go back and forth in the suggestion list
inoremap <C-Space> <C-n>

" FILE BROWSING
"
" Tweaks for browsing
"
" let g:netrw_banner=0 	" disable anniyung banner
" let g:netrw_browser_split=4   	" open in prior window
" let g:netrw_altv=1		" open split to the right
" let g:netrw_lifestyle=3		" tree view
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Now we can :
" - :edit a folder to open a file browser 
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browser-maps| for more mapping
" 
" - :only     to show this single split
" - :tabonly  to show only this single tab


" COPY OTHER FILES
" :-1read main.h

" GOTO FILE (PATH UNDER CURSOR)
" - gf


" TAB HANDLING AND SPLIT WINDOW
" - :tabnew :tabc gt gT
" - ^ws ^wv ^wq 

" SCOLL TIPS
" - h j k l
" - ^E scroll window down 
" - ^Y scroll winwow up
" - H M L move cursor to the Top Middle or Bottom of the window
" - gg go to the top of the Fil
" - G go to the end of the file

" DELETE INSIDE WORD (without whitespaces)
" diw
"
" CHANGE ALL WORD (with white spaces)
" caw
" 
" DELETE EVERYTHING IN THE BRACKETS
" di) 
"
" YANK ALL TEXT INSIDE THE BACKETS
" yi)
" 
" DELETE UNTIL THE SPACE
" dt<space>
"
" DELETE WITH THE SPACE
" df<space>
"
" MARK EVERYTHING IN BRACKETS
" vi)
"
" DOT TO REPEAT A MOTION
" ci)newword<ESC> 	-> . repeats itfor all (oldword)
"
" VIM HISTORY 
" - u
" - ^r
" - :earlier 2m
"
" RECORDING MACROS
" - qw	start recording in register w
" - q 	stop recording
" - @w	execute marco in register w
" - :reg shows all markros
"
" MARKER
" - mk	set a macro to the current cursor line
" - 'k	brings me back to the marker
" - ^A 	increment the number under the cursor

" C++ SNIPPETS 
autocmd FileType cpp inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType h inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
" inoremap <Tab> <C-n>
" inoremap <Tab><Tab> <Tab>
" autocmd FileType cpp inoremap [ []<Esc>i
" autocmd FileType cpp inoremap ] <right>
" autocmd FileType cpp inoremap ]] ]
" autocmd FileType cpp inoremap ( ()<Esc>i
" autocmd FileType cpp inoremap ) <right>
" autocmd FileType cpp inoremap )) )
" autocmd FileType cpp inoremap { {}<Esc>i
" autocmd FileType cpp inoremap } <right>
" autocmd FileType cpp inoremap }} }

autocmd FileType cpp inoremap ;im int<Space>main(int<Space>argc,<Space>char*<Space>argv[]){<Enter><Enter>return<Space>0;<Enter>}<Esc>kki<Tab>
autocmd FileType cpp inoremap ;fi for<Space>(int<Space>i<Space>=<Space>0;<Space>i<Space><<Space><++>;<Space>++i){<Enter><++><Enter>}<Esc>/<++><Enter>"_c4l
autocmd FileType cpp inoremap ;co std::cout<Space><<<Space>"<++>"<Space><<<Space>std::endl;<Enter><++><Esc>/<++><Enter>"_c4l
autocmd FileType cpp inoremap ;ci std::cin<Space>>><Space>;<Esc>i
autocmd FileType cpp inoremap ;wl while<Space>(<++>){<Enter><++><Enter>}<Esc>/<++><Enter>"_c4l
autocmd FileType cpp inoremap ;if if<Space>(<++>){<Enter><++><Enter>}<Esc>/<++><Enter>"_c4l
autocmd FileType cpp inoremap ;cl class<Space><++>{<Enter>private:<Enter><++><Enter>public:<Enter><Esc>xi<Tab><Tab><++><Enter>};<Esc>/<++><Enter>"_c4l
autocmd FileType h inoremap ;cl class<Space><++>{<Enter>private:<Enter><++><Enter>public:<Enter><Esc>xi<Tab><Tab><++><Enter>};<Esc>/<++><Enter>"_c4l
autocmd FileType cpp inoremap ;up std::unique_ptr<<++>><Space><++>(new <++>(<++>));<Esc>/<++><Enter>"_c4l
autocmd FileType h inoremap ;up std::unique_ptr<<++>><Space><++>(new <++>(<++>));<Esc>/<++><Enter>"_c4l
autocmd FileType cpp inoremap ;sp std::shared_ptr<<++>><Space><++><Space>=<Space>std::make_shared<<++>>(<++>);<Esc>/<++><Enter>"_c4l
autocmd FileType h inoremap ;sp std::shared_ptr<<++>><Space><++><Space>=<Space>std::make_shared<<++>>(<++>);<Esc>/<++><Enter>"_c4l


autocmd FileType python set dictionary+=/usr/share/dict/python-dict-short
set colorcolumn=80
" Python SNIPPETS
autocmd FileType python inoremap ;cl <Esc>:-1read /home/d067836/.vim/.snippets/class.py<CR>f:i
autocmd FileType python inoremap ;gm <Esc>lmtyiw/def<CR>Odef<Space>get<Esc>pF<Space>4l~A(self):<CR>return<Space>self.<Esc>po<Esc>'t
autocmd FileType python inoremap ;sm <Esc>lmtyiw/def<CR>Odef<Space>set<Esc>pF<Space>4l~A(self,<Space><Esc>pa):<CR>self.<Esc>pa<Space>=<Space><Esc>po<Esc>'t
autocmd FileType python nnoremap <F5> <Esc>:w !python3<CR>

