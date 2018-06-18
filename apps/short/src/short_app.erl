-module(short_app).
-behaviour(application).
-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    sync:go(),
    inets:start(),
    ssl:start(),
    Dispatch = cowboy_router:compile([
        {'_', [

            {"/[:url]",short,[]}

        ]}]),

     cowboy:start_clear(http, [{port, 8000}],
                            #{env => #{dispatch => Dispatch}}),

    short_sup:start_link().

stop(_State) ->
    ok.
