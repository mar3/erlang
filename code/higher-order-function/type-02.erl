#!/usr/bin/env escript
%% coding: utf-8



get_operation(Request) ->

	%%
	%% 無名関数を返却する“高階関数”の例です。
	%%
	%% 引数 Request によって下記のような処理にわかれます。
	%%
	%% "addition" の場合:
	%%      第一引数と第二引数を加算するような関数を返します。
	%% "subtraction" の場合:
	%%      は第一引数から第二引数を引くような関数を返します。
	%%

	case Request of
		"addition" ->
			fun(X, Y) -> X + Y end;
		"subtraction" ->
			fun(X, Y) -> X - Y end
	end.

main(_) ->

	%%
	%% get_operation() が返してきたものを Operation という変数に束縛しています。
	%% 戻り値は無名関数のはずです。
	%%

	Operation = get_operation("addition"),

	%%
	%% get_operation() が返してきた Operation を呼び出してみます。二つの数値を引数として与えています。
	%% Operation() が何かを返してきたら Result に束縛されることになります。
	%%

	Result = Operation(10, 1),

	%%
	%% Result を表示しています。
	%%

	io:format("~p~n", [Result]),

	done.
