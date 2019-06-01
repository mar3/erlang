#!/usr/bin/env escript
%% -*- erlang -*-

% mylogger を mylogger.beam にコンパイルしておく必要がある。まえからそうだったっけ？？

-import(mylogger, [hello/0]).
% -import(mylogger, [info/1]).

main(_) ->
	io:format("### begin ###\n"),
	io:format(<<"[TRACE] 自分のモジュールを呼び出しています...\n"/utf8>>),
	mylogger:hello(),
	% mylogger:info(["Hello Erlang World"]),
	{ok},
	io:format("---end ---\n"),
	done.




