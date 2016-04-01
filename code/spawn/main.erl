#!/usr/bin/env escript
% coding: utf8

% -module(main).

log(Args) ->

	Now = erlang:now(),
	{{Year, Month, Day}, {Hour, Min, Sec}} = calendar:now_to_local_time(Now),
	{_, _, Micros} = Now,
	io:format('~4..0w-~2..0w-~2..0w ~2..0w:~2..0w:~2..0w.~6..0w [info] ~s~n',
		[Year, Month, Day, Hour, Min, Sec, Micros, Args]).

exec_process() ->

	erlang:spawn(

		fun() ->

			%
			% 子プロセスの処理
			%
			log("<child> $$$ start $$$"),
			timer:sleep(500),
			log("<child> processing..."),
			timer:sleep(500),
			log("<child> processing..."),
			timer:sleep(500),
			log("<child> processing..."),
			timer:sleep(500),
			log("<child> processing..."),
			timer:sleep(500),
			log("<child> processing..."),
			timer:sleep(500),
			log("<child> processing..."),
			log("<child> $$$ end $$$")

		end),

	done.

main(_) ->

	log("<root> ### start ###"),

	%
	% 子プロセスの呼び出し
	%
	exec_process(),
	exec_process(),
	exec_process(),
	exec_process(),
	exec_process(),

	%
	% 親プロセスの処理
	%
	timer:sleep(1000),
	log("<root> waiting..."),
	timer:sleep(1000),
	log("<root> waiting..."),
	timer:sleep(1000),
	log("<root> waiting..."),
	timer:sleep(1000),
	log("<root> waiting..."),
	timer:sleep(1000),
	log("<root> waiting..."),
	timer:sleep(1000),

	log("<root> --- end ---"),

	done.
