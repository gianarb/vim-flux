[flux](https://github.com/influxdata/flux) is a programming langauge for data open sourced by InfluxData. Editor and IDE are not a commodity anymore and languages needs to support them in order to improve the developer happiness. The Flux community is doing a lot of work be as friendly as possible. This plugin will make your experience with flux awesome in VIM!

What it (will) provide:

- [x] Syntax highlight
- [x] Query an InfluxDB OSS/Cloud with a friendly output.
- [x] With a proper language server client you can enjoy [flux-lsp](https://github.com/influxdata/flux-lsp) for autocompletition and inspection.
- [x] [NerdCommenter](https://github.com/scrooloose/nerdcommenter) integration to make commenting easy
- [ ] Converstion to AST for debugging purpose
- [ ] I don't know... tell me.

## Install

```
Plug "github.com/gianarb/vim-flux
```

This plugin is under development, I cloned the repositoy and I use the Plug ability to load a plugin from my local disk, in this way I can make easy contributions

```vimscript
Plug "~/git/vim-flux"
```

## Syntax Highlight

When you open `.flux` file it will automatically detect the `filetype` and it will highight the code.

## Query an InfluxDB

If you have a InfluxDB v2 reachable at `http://localhost:9999` this plugin can query it using the selected part of the script you have open in your current buffer.

How does it work?! Open a `.flux` file with your queries/query. Enter `visual` mode and select the query or the part you would like to sent to `InfluxDB` and type `:FluxQueryInfluxDB`. Behind the scene the select string will be sent to `http://localhost:9999/api/v2/query` and the request will be printed as readonly buffer in a new window.


By default the InfluxDB host port is `https://localhost:9999`. You can override it via global vim variable:

```
let g:influxdbHostPort = "http://influxcloud:9999"
```

As you probably know InfluxDB 2 has authentication enable by default. vim-flux by default reads it from `~/.influxdbv2/credentials` in order to override this behavior you can set the variable `g:influxdbAuthToken` with your token.
