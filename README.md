Under development

If you use `Plug` you can clone this repository and load it from your local disk

```vimscript
Plug "~/git/vim-flux"
```

## Configuration

By default the InfluxDB host port is `https://localhost:9999`. You can override
it via global vim variable:

```
let g:influxdbHostPort = "http://influxcloud:9999"
```

The token by default it is read from `~/.influxdbv2/credentials`. If not set we
look at the variable `g:influxdbAuthToken`
