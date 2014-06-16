###環境

- CentOS release 6.5 (Final)
- Erlang R16B03-1
- Eshell V5.10.4


###実行方法

Eshell を開きます。
```
$ erl
Erlang R16B03-1 (erts-5.10.4) [source] [64-bit] [async-threads:10] [hipe] [kernel-poll:false]

Eshell V5.10.4  (abort with ^G)
1>
```

hello モジュールをコンパイルします。
```
> c(hello).
{ok,hello}
>
```

hello モジュールの print() 関数を実行します。
```
> hello:print().
hello world.
ok
>
@``

インタープリターを終了します。
```
> q().
```

