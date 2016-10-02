#!/usr/bin/env escript
%% coding: utf-8



invoke(Operation, Vaule) ->

	%%
	%% “高階関数”の例です。
	%%
	%% 第一引数 Operation が関数であるとみなして Operation() を呼び出してみます。
	%% 引数は Value です。
	%%

	Operation(Vaule).

main(_) ->

	%%
	%% Erlang の無名関数を Operation という変数に束縛しています。
	%%

	Operation = fun(X) -> X * 2 end,

	%%
	%% Operation を渡して invoke() を呼び出しています。第二引数は 7 です。
	%% invoke() の結果が Result に束縛されることになります。
	%%

	Result = invoke(Operation, 7),

	%%
	%% Result を表示しています。
	%%

	io:format("~p~n", [Result]),

	done.
