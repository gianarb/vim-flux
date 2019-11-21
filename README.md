[flux](https://github.com/influxdata/flux) is a programming langauge for data
open sourced by InfluxData. Editor and IDE are not a commodity anymore and
languages needs to support them in order to improve the developer happiness. The
Flux community is doing a lot of work be as friendly as possible. This plugin
will make your experience with flux awesome in VIM!

What it (will) provide:

- [x] Syntax highlight
- [x] Query an InfluxDB OSS/Cloud with a friendly output.
- [x] With a proper language server client you can enjoy
  [flux-lsp](https://github.com/influxdata/flux-lsp) for autocompletion and
  inspection.
- [x] [NerdCommenter](https://github.com/scrooloose/nerdcommenter) integration
  to make commenting easy
- [ ] Convert to AST for debugging purpose
- [ ] I don't know... Tell me.

## Install

## Install

* [Vim 8 packages](http://vimhelp.appspot.com/repeat.txt.html#packages)
  * `git clone https://github.com/gianarb/vim-flux.git ~/.vim/pack/plugins/start/vim-flux`
* [Pathogen](https://github.com/tpope/vim-pathogen)
  * `git clone https://github.com/gianarb/vim-flux.git ~/.vim/bundle/vim-flux`
* [vim-plug](https://github.com/junegunn/vim-plug)
  * `Plug 'gianarb/vim-flux'`
* [Vundle](https://github.com/VundleVim/Vundle.vim)
  * `Plugin 'gianarb/vim-flux'`

The `Query an InfluxDB` feature depends on
[mattn/webapi-vim](https://github.com/mattn/webapi-vim), be sure to install it
as well.

## Syntax Highlight

When you open `.flux` file it will automatically detect the `filetype` and it
will highight the code.

## Query an InfluxDB

If you have a InfluxDB v2 reachable at `http://localhost:9999` this plugin can
query it using the selected part of the script you have open in your current
buffer.

How does it work?! Open a `.flux` file with your queries/query. Enter `visual`
mode and select the query or the part you would like to sent to `InfluxDB` and
type `:FluxQueryInfluxDB orgName`. Behind the scene the select string will be sent to
`http://localhost:9999/api/v2/query` and the request will be printed as readonly
buffer in a new window.


By default the InfluxDB host port is `https://localhost:9999`. You can override
it via global vim variable:

```
let g:influxdbHostPort = "http://influxcloud:9999"
```

As you probably know InfluxDB 2 has authentication enable by default. vim-flux
by default reads it from `~/.influxdbv2/credentials` in order to override this
behavior you can set the variable `g:influxdbAuthToken` with your token.
