#!/usr/bin/env escript
% coding: utf-8

log(Args) ->
	Now = erlang:now(),
	{{Year, Month, Day}, {Hour, Min, Sec}} = calendar:now_to_local_time(Now),
	{_, _, Micros} = Now,
	{ok, Handle} = file:open("log", [append]),

	% io:format(Handle,
	% 	'~4..0w-~2..0w-~2..0w ~2..0w:~2..0w:~2..0w.~6..0w [info] ~s~n',
	% 	[Year, Month, Day, Hour, Min, Sec, Micros, Args]),

	io:fwrite(Handle,
		'~4..0w-~2..0w-~2..0w ~2..0w:~2..0w:~2..0w.~6..0w [info] ~s~n',
		[Year, Month, Day, Hour, Min, Sec, Micros, Args]),

	file:close(Handle).

main(_) ->

	log('### start ###'),
	log(["name:", "[", "99999", "]"]),
	log('--- end ---'),
	done.

