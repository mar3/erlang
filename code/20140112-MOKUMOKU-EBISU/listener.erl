#!/usr/local/bin/escript
%% -*- erlang -*-

% #############################################################################
%
% 簡易1行サーバー
%
% 2014-01-12 「Erlangもくもく会 1st」 at 「株式会社 Engine Yard」 at Ebisu
%
%
%
%
%
%
% #############################################################################









% *****************************************************************************
%
%
%
% *****************************************************************************
run_server() ->
	try
		{ok, LSocketHandle} = gen_tcp:listen(8089, [binary, {active, false}]),
		do_accept(LSocketHandle)
	catch
		error:Reason ->
			io:format( "[ERROR]: cannot begin listenning. reason=[~w]~n", [Reason] )
	end.


% *****************************************************************************
%
%
%
% *****************************************************************************
do_accept(LSocketHandle) ->
	{ok, LClientSocket} = gen_tcp:accept(LSocketHandle),
	try
		{ok, Bin} = do_recv(LClientSocket, [])
	catch
		error:Reason ->
			io:format( "catch error: ~w~n", [Reason] )
	after
		gen_tcp:close(LClientSocket),
		io:format("end\n", [])
 	end,
	% io:format("~c\x0a", [Bin]),
	do_accept(LSocketHandle).


% *****************************************************************************
%
%
%
% *****************************************************************************
do_recv(ClientSocket, BinaryList) ->
	case gen_tcp:recv(ClientSocket, 0) of
		{ok, BinaryBuffer} ->
			io:put_chars(["REQUEST: ", BinaryBuffer, ""]),
			gen_tcp:send(ClientSocket, <<"Ok.\x0a">>);
		{error, closed} ->
			io:put_chars("[closed ?]\x0a")
	end,
	{ok, []}.

% *****************************************************************************
% 空の行が贈られるまでリクエストとみなすような実装です。
%
%
% *****************************************************************************
do_recv_bak(ClientSocket, BinaryList) ->
	case gen_tcp:recv(ClientSocket, 0) of
		{ok, BinaryBuffer} ->
			io:put_chars(["[", BinaryBuffer, "]"]),
			case BinaryBuffer of
				<<"\x0a">> ->
					gen_tcp:send(ClientSocket, <<"BYE\x0a">>),
					gen_tcp:close(ClientSocket);
				<<"\x0d\x0a">> ->
					gen_tcp:send(ClientSocket, <<"BYE\x0a">>),
					gen_tcp:close(ClientSocket);
				Other -> 
					gen_tcp:send(ClientSocket, <<"OK.\x0a">>),
					do_recv_bak(ClientSocket, [BinaryList, BinaryBuffer])
			end;
		{error, closed} ->
			[]
	end.









% *****************************************************************************
% ああああああああ
%
%
% *****************************************************************************
main(_) ->
	try
		run_server()
	catch
		error:Reason ->
			io:format( "catch error: ~w~n", [Reason] )
	after
		[]
	end.
