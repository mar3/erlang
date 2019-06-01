-module(mylogger).
-export([hello/0]).
% -export([info/1]).
% -export([info/2]).

hello() ->
	io:format("[TRACE] hello.\n"),
	done.

% info(String) ->
% 	io:format("[TRACE] called.\n"),
% 	io:format("~p~n", [String]),
% 	done.

% info([String]) ->
% 	io:format("[TRACE] called.\n"),
% 	io:format("~p~n", [String]),
% 	done.


