#!/usr/bin/env escript
% coding: utf-8

main(_) ->
	% 結合
	L1 = [1, 2, 3, "xxx"],
	L2 = [4, 5, 6, "yyy"],
	L = lists:append([L1, L2]),
	io:format("~p~n", [L]),
	done.
