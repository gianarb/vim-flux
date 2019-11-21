if exists('g:NERDCustomDelimiters')
    let g:NERDCustomDelimiters['flux'] = { 'left': '//','right': '' }
else
    let g:NERDCustomDelimiters = { 'flux': { 'left': '//','right': '' } }
endif

au BufRead,BufNewFile *.flux setfiletype flux
