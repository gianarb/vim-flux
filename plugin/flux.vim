set rtp+=webapi-vim

let g:buf_request_query_name = "FluxQueryResult"
let s:buf_nr = -1
let g:influxdbHostPort = "http://localhost:9999"
let g:influxdbAuthToken = ""

function! s:query() range
  let l:credentialsfile = expand('~/.influxdbv2/credentials')
  if len(g:influxdbAuthToken) == 0
      let l:auth_token = join(readfile(credentialsfile),"")
  else
      let l:auth_token = g:influxdbAuthToken
  endif

  if len(l:auth_token) == 0
      echoerr "Auth token needs to be set or via ~/.influxdbv2/credentials or overriding g:influxdbAuthToken."
      return
  endif

  let l:selectedQuery = ""

  for lineno in range(a:firstline, a:lastline)
    let l:selectedQuery = l:selectedQuery."\x0a".getline(lineno)
  endfor

  let l:query_url = g:influxdbHostPort."/api/v2/query?org=gianarb"
  let l:headers = {"Authorization": "Token ".auth_token, "Content-Type": "application/vnd.flux"}
  let l:ret = webapi#http#post(query_url, selectedQuery, headers)

  if !bufexists(s:buf_nr)
    botright new
    let s:buf_nr = bufnr('%')
    exec 'f ' . g:buf_request_query_name
  elseif bufwinnr(s:buf_nr) == -1
    botright new
    execute s:buf_nr . 'buffer'
  elseif bufwinnr(s:buf_nr) != bufwinnr('%')
    execute bufwinnr(s:buf_nr).'wincmd w'
  endif

  setlocal modifiable
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  setlocal filetype=fluxresult

  call append(0, split("\n".l:ret.content."\n", "\n"))
  call append(0, split('Executed Query:'.l:selectedQuery."\n"."\n", "\n"))

  setlocal nomodifiable
endfunction

command -range FluxQueryInfluxDB <line1>,<line2>call s:query()
