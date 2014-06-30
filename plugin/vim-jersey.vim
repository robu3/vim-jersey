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

" map the function
map <silent> <leader>vj :call <SID>GetColorScheme()<CR>

