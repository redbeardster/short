# tiny URL shortener

## Build

```
$rebar get-deps compile && rebar generate
```

## Run

```
cd rel/short/bin && ./short start
```


## Test

```
$curl -X POST http://localhost:8000/ -d 'https://ru.aliexpress.com/item/Retro-Design-Leather-Band-Watches-Men-Top-Brand-Relogio-Masculino-2017-NEW-Mens-Sports-Clock-Analog'
{"result":"success","data":{"url":"http://localhost:8000/mKmcDqUMCRRRThhY"}}⏎

$curl -i -X GET http://localhost:8000/mKmcDqUMCRRRThhY
HTTP/1.1 302 Found
Location: https://ru.aliexpress.com/item/Retro-Design-Leather-Band-Watches-Men-Top-Brand-Relogio-Masculino-2017-NEW-Mens-Sports-Clock-Analog
`
``