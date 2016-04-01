-module(logger).
-export([info/1]).

info([String]) ->
	io:format("~p~n", [String]),
	done.


