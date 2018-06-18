-module(short).
-export([init/2]).

random_string(Len) ->
  rand:seed(exs1024s),
  Chrs = list_to_tuple("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"),
  ChrsSize = size(Chrs),
  F = fun(_, R) -> [element(rand:uniform(ChrsSize), Chrs) | R] end,
  lists:foldl(F, "", lists:seq(1, Len)).

init(Req0, Opts) ->

  Method = cowboy_req:method(Req0),
  Req1 = echo(Method,  Req0),

  {ok, Req1, Opts}.

echo(<<"GET">>, Req) ->

  ShortURL = lists:nth(1, string:tokens(binary_to_list(cowboy_req:path(Req)), "/")),
%%  io:format("URL: ~p~n", [dbmgr:get_url(list_to_binary(ShortURL))]),
  URL = dbmgr:get_url(list_to_binary(ShortURL)),

  case URL of
    BinURL when is_binary(URL) =:= true  ->
      cowboy_req:reply(302, #{<<"Location">> => BinURL}, Req);
    _ ->
      cowboy_req:reply(404, Req)
  end;

echo(<<"POST">>,  Req) ->

  {ok, Postvals, _} =cowboy_req:read_urlencoded_body(Req),

    case Postvals of
    [{BinURL, true}] ->

        io:format("BinURL: ~p~n", [BinURL]),
        ShortURL = list_to_binary("http://localhost:8000/" ++random_string(16)),
        dbmgr:save_url(BinURL, ShortURL),
        cowboy_req:reply(200, #{<<"content-type">> => <<"application/json; charset=utf-8">>},
                              jsx:encode([{<<"result">>,<<"success">>}, {<<"data">>, [{<<"url">>, ShortURL}]}]), Req);
    _ ->
        cowboy_req:reply(403, Req)
  end;

echo(_,Req) ->
  cowboy_req:reply(405, Req).




