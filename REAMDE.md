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

curl -i -X GET http://localhost:8000/GvZUoKyDksnaMTpq
HTTP/1.1 302 Found
Location: http://www.johnfdoherty.com/wp-content/uploads/2011/11/short-url-example-2.png
content-length: 0
date: Mon, 18 Jun 2018 07:07:30 GMT
server: Cowboy
```