" Through this file existing, defaults.vim doesn't get run. This fixes that by forcibly running it before we do our custom stuff.
runtime defaults.vim

" Fixes some stuff to do with deleting. Makes sure specific delete commands don't automatically yank.
nnoremap dd "_dd

nnoremap dw "_dw
nnoremap dW "_dW

nnoremap db "_db
nnoremap dB "_dB

nnoremap x "_x

" Mappings for moving text around easily.
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
vnoremap <S-Up> :m'<-2<CR>gv
vnoremap <S-Down> :m'>+1<CR>gv

" Changes the color of comments from dark blue to yellow. Makes them way easier to see.
hi Comment ctermfg=yellow

" Prevents vim from wrapping comments and placing comment character on new line.
" The if statement is like an include guard in C, it prevents redefinition if this file is run multiple times by another file.
" autocmd means that set will run when vim finishes setting up and enters interactive mode (VimEnter) for every file-type that I try to open (*).
if !exists("autocommands_loaded")
	autocmd VimEnter * set formatoptions-=cro	" TODO: This doesn't work super well with multiple vim panes. Figure out a new event to use so that its' better.
	let autocommands_loaded = 1
endif

" Prevents accessing directories with vim, because it's annoying when it accidentally happens and who would ever even want to.
for f in argv()
	if isdirectory(f)
		echomsg "vimrc: directory access disabled, cannot access " . f
		quit
	endif
endfor

" Linux without a graphical overlay (headless, just console) doesn't support any clipboards.
" To fix this issue, using these commands will write selection to tmp file which can be read from again so simulate copying and pasting.
vnoremap <leader>y :w! /tmp/vimcopytemp<CR>
vnoremap <leader>d :w! /tmp/vimcopytemp<CR>gvd
nnoremap <leader>p :r! cat /tmp/vimcopytemp<CR>
