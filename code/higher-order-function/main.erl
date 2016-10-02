#!/usr/bin/env escript
%% coding: utf-8



invoke(Function, Vaule) ->
	Function(Vaule).

main(_) ->
	Operation = fun(X) -> X * 2 end,
	Result = invoke(Operation, 999),
	io:format("~p~n", [Result]),
	done.

