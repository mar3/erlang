#!/usr/local/bin/escript
%% -*- erlang -*-

main( File ) ->

	try
		io:put_chars("$$$ printing argument $$$\x0a"),

		io:format(File),
		io:put_chars("\x0a"),

		io:put_chars("$$$ now openning file... $$$\x0a"),

		{ok, IoDevice} = file:open(File, read),

		io:put_chars("$$$ now reading file... $$$\x0a"),

		print_with_line(IoDevice, 1),
		file:close(IoDevice)
	catch
		error:Reason ->
			io:format( "catch error: ~w~n", [Reason] )
	after
		io:format("end\n", [])
	end.

print_with_line(IoDevice, LineNumber) ->
    case io:get_line(IoDevice, "") of
    eof ->
        ok;
    Line ->
        io:format("~b ~s", [LineNumber, Line]),
        print_with_line(IoDevice, LineNumber + 1)
    end.