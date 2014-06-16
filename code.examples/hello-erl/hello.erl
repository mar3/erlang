% coding: utf-8
%
% Erlang のモジュールのサンプル
%

-module(hello).
-export([print/0]).

print() ->
	io:format("hello world.\x0a").

