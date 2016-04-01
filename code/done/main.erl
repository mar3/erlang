#!/usr/local/bin/escript
% coding: utf-8

method1() ->
	% なにもしないの意
	done.

main(_) ->
	method1(),
	io:format("Ok.~n").

