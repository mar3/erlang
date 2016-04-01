-module(hello).
-export([public_operation_a/0, public_operation_b/0, increment/1, add/2]).
-export([name_of/1]).

% encode: utf-8

begin_listener(ListeningPort) ->

inner_operation() ->
	'Hello Erlang World!'.

public_operation_a() ->
	inner_operation().

public_operation_b() ->
	inner_operation().

increment(Value) ->
	Value + 1.

add(X,Y) ->
	Y+X.

name_of(X) ->
	case X of
		1 -> 'イチ';
		2 -> 'ニ';
		3 -> 'サン'
		% Other -> 'フメイ'
	end.

