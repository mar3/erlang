#!/usr/bin/env escript
% coding: utf-8
%
%
% ・単純な繰り返し操作
% ・パターンマッチング
%

do_loop(CurrentPos, Until) ->

	io:format("(~B)\n", [CurrentPos]),

	% このような条件判定を「パターンマッチング」と言う。
	case CurrentPos < Until of
		true ->
			do_loop(CurrentPos + 1, Until);
		false ->
			io:put_chars("(end)\n")
	end.

%
% エントリーポイント。
% (ただし、Erlang でそのように呼ぶのかどうか不明。)
%
main( _ ) ->

	io:format("### start ###\n"),

	do_loop(0, 9),

	io:format("--- end ---\n").


% 出力イメージ
%
% # ./loop.erl
% ### start ###
% (0)
% (1)
% (2)
% (3)
% (4)
% (5)
% (6)
% (7)
% (8)
% (9)
% (end)
% --- end ---
%
%

