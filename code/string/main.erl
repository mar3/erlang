#!/usr/bin/env escript
% coding: utf-8

main(_) ->

	Left = "ABC",
	Right = "XYZ",
	Both = Left ++ Right,
	io:format("~p~n", [Both]),

	io:format("~p~n", [lists:append("abc", "def")]),

	done.

