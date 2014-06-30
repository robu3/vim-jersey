function! s:GetColorScheme()
	call inputsave()
	let s:code = input("Enter color scheme code (e.g., ff00ff-triad): ")
	call inputrestore()
	call inputsave()
	let s:filename = input("Enter scheme name (*.vim): ")
	call inputrestore()

	let s:url = "http://bitsmash.co:8085/scheme/" . s:code . ".vim"
	let s:cmd = "curl " . s:url . " > " . "~/.vim/colors/" . s:filename

	echo system(s:cmd)
endfunction

function! s:GetRandomColorScheme(paletteType)
	let s:url = "http://bitsmash.co:8085/scheme/random-" . a:paletteType . ".vim"
	let s:cmd = "curl " . s:url . " > " . "~/.vim/colors/vj-random.vim"

	echo system(s:cmd)

	execute(":colorscheme vj-random")
endfunction

" map the function
map <silent> <leader>vj :call <SID>GetColorScheme()<CR>
map <silent> <leader>vjr2 :call <SID>GetRandomColorScheme("complementary")<CR>
map <silent> <leader>vjr3 :call <SID>GetRandomColorScheme("triad")<CR>
map <silent> <leader>vjr4 :call <SID>GetRandomColorScheme("tetrad")<CR>
map <silent> <leader>vjra :call <SID>GetRandomColorScheme("analogous")<CR>

