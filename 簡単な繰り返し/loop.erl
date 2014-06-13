#!/usr/local/bin/escript
% coding: utf-8

do_loop(CurrentPos, Until) ->
	io:format("(~B)\n", [CurrentPos]),
	case CurrentPos < Until of
		true ->
			do_loop(CurrentPos + 1, Until);
		false ->
			io:put_chars("(end)\n")
	end.

main( _ ) ->
	io:format("### start ###\n"),
	do_loop(0, 9),
	io:format("--- end ---\n").

