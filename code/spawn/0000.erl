#!/usr/local/bin/escript
% coding: utf-8
%
%
% 2014-04-29 Erlang を用いた並列プログラミングのサンプル
%

-module(spawn_test2).
-export([say_something/2]).

%
% パターンマッチングによるオーバーロード的(?)なアプローチ
%
% say_something(*, 0) を呼び出した場合はこのオーバーロードが実行される。
%
say_something(_What, 0) ->
	done;

say_something(What, Times) ->
	io:format("~p(~p)~n", [What, Times]),
	timer:sleep(1),
	say_something(What, Times - 1).

%
% 並列処理の例
%
con_start(Try) ->

	% なんか明示的に module 宣言してフルネームで spawn する情報もあるっぽいけど...
	% spawn(spawn_test2, say_something, [hello, 3]),
	% spawn(?MODULE, say_something, [goodbye, 3]),

	% =========================================================================
	% 無名関数で process を作成
	% =========================================================================
	spawn(fun() -> say_something(process00, Try) end),
	spawn(fun() -> say_something(process01, Try) end),
	spawn(fun() -> say_something(process02, Try) end),
	spawn(fun() -> say_something(process03, Try) end),
	spawn(fun() -> say_something(process04, Try) end),
	spawn(fun() -> say_something(process05, Try) end),
	spawn(fun() -> say_something(process06, Try) end),
	spawn(fun() -> say_something(process07, Try) end),
	spawn(fun() -> say_something(process08, Try) end),
	spawn(fun() -> say_something(process09, Try) end),

	%
	% 本当はすべてのプロセスが処理を終えるのを待つべき
	%
	% system:join() 的な何か...
	%

	timer:sleep(1000),

	done.

main(_) ->

	io:format('### START ###\n'),

	%
	% 並列処理サンプル
	%
	con_start(99),

	io:format('--- END ---\n'),

 	done.

