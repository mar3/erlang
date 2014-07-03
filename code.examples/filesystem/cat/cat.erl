#!/usr/local/bin/escript
% coding: utf-8


print_line(Handle) ->

	%
	% ファイルの読出し操作。再帰呼び出しで繰り返しを実現している。
	%

	%
	% get_line の戻り値による処理分岐。Erlang ではパターンマッチングと呼ぶ。
	%
	case io:get_line(Handle, "") of
		eof ->
			ok;
		Line ->
			io:format("~s", [Line]),
			print_line(Handle)
	end.

main(Path) ->

	try

		%
		% ファイルを開く
		%
		{ok, Handle} = file:open(Path, read),

		%
		% 読み出し。ファイルの終端まで繰り返す。
		%
		print_line(Handle),

		%
		% ファイルを閉じる
		%
		file:close(Handle)

	catch

		%
		% 例外処理
		%
		error:Reason ->
			io:format( "[ERROR] caught an exception: ~w~n", [Reason] )

	end.

