#!/usr/local/bin/escript
% coding: utf8

-module(main).

log(Args) ->
	Now = erlang:now(),
	{{Year, Month, Day}, {Hour, Min, Sec}} = calendar:now_to_local_time(Now),
	{_, _, Micros} = Now,
	io:format('~4..0w-~2..0w-~2..0w ~2..0w:~2..0w:~2..0w.~6..0w [info] ~s~n',
			   [Year, Month, Day, Hour, Min, Sec, Micros, Args]).

main(_) ->

	log("### start ###"),
	log(["ログテスト", "ABC"]),
	log("ログテストその2"),
	log(["日本語のメッセージを出力", "します", "。"]),
	log("--- end ---"),
	done.
