#!/usr/bin/env escript
%% coding: utf-8

name_of(Value) ->
	case Value of
		1 -> "One";
		2 -> "Two";
		3 -> "Three";
		_ -> "Unknown"
	end.

increment(Value) ->
	Value + 1.

main(_) ->
	io:format("~s~n", [name_of(1)]),
	io:format("~s~n", [name_of(2)]),
	io:format("~s~n", [name_of(3)]),
	io:format("~s~n", [name_of(4)]),
	io:format("~p~n", [increment(-982)]),
	io:format("~p~n", [increment(3)]),
	io:format("~p~n", [increment(300)]),
	done.
