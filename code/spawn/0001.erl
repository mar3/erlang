% #############################################################################
% encode: utf-8
%
% 2014-04-29 Erlang を用いた並列プログラミングのサンプル
%
%
%
%
%
%
%
%

-module(spawn_test).
-export([say_something/2,sec_start/0, con_start/0]).







%
% パターンマッチングによるオーバーロード的(?)なアプローチ
%
% say_something(*, 0) を呼び出した場合はこのオーバーロードが実行される。
%
say_something(_What, 0) ->
	done;

say_something(What, Times) ->
	io:format("~p~n", [What]),
	say_something(What, Times - 1).




%
% 逐次(=直列)処理の例
%
sec_start() ->
	say_something(hello,3),
	say_something(goodbye,3),
	done.






%
% 並列処理の例
%
con_start() ->
	spawn(spawn_test, say_something, [hello, 3]),
	spawn(spawn_test, say_something, [goodbye, 3]),
	done.





% main(_) ->

% 	io:format('Ok.\n'),
% 	sec_start(),
% 	con_start(),
% 	done.

