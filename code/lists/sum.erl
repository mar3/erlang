#!/usr/bin/env escript
% coding: utf-8

main(_) ->
	% 合計
	Sum = lists:sum([1, 2, 3, 4, 5, 6, 7]),
	io:format("~p~n", [Sum]),
	done.
