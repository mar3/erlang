#!/usr/local/bin/escript
% coding: utf-8


print_line(Handle) ->
	case io:get_line(Handle, "") of
		eof ->
			ok;
		Line ->
			io:format("~s", [Line]),
			print_line(Handle)
	end.

main(File) ->
	try
		{ok, Handle} = file:open(File, read),
		print_line(Handle),
		file:close(Handle)
	catch
		error:Reason ->
			io:format( "[ERROR] caught an exception: ~w~n", [Reason] )
	end.
