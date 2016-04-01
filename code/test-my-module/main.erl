#!/usr/local/bin/escript
%% -*- erlang -*-

-import(logger, [hello/0]).
-import(logger, [info/1]).

main(_) ->
	% io:put_chars("Hello Erlang.\x0a"),
	logger:info(["Hello Erlang World"]),
	{ok}.




