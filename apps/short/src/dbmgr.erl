-module(dbmgr).
-behaviour(gen_server).
-define(SERVER, ?MODULE).
-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-export([save_url/2, get_url/1]).

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

save_url(LongURL, ShortURL) ->
  gen_server:cast(?SERVER, {save_url, LongURL, ShortURL}).

get_url(ShortURL) ->
  gen_server:call(?SERVER, {get_url, ShortURL}).

init(Args) ->
    ets:new(urls, [public, named_table, set]),
    {ok, Args}.


handle_call({get_url, ShortURL}, _From, State) ->

 URL = case ets:lookup(urls, list_to_binary("http://localhost:8000/" ++ binary_to_list(ShortURL))) of
    [{_, LongURL}]-> LongURL;
    _ -> ""
    end,

  {reply, URL, State};

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast({save_url, LongURL, ShortURL}, State) ->
  ets:insert(urls, {ShortURL, LongURL}),
  {noreply, State};

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
