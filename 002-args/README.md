# [gno.land/r/moul_basics_args_v1](https://test2.gno.land/r/moul_basics_args_v1)

```console
foo@bar:~$ gnokey maketx call "MYWALLET" --gas-fee 1ugnot --broadcast true --chainid "dev" --remote "localhost:26657"  \
> --gas-wanted 500000 --pkgpath gno.land/r/moul_basics_args_v1 --func Hello --args Universe
("Hello Universe!" string)
OK!
GAS WANTED: 500000
GAS USED:   69835
```

```console
foo@bar:~$ gnokey maketx call "MYWALLET" --gas-fee 1ugnot --broadcast true --chainid "dev" --remote "localhost:26657"  \
> --gas-wanted 500000 --pkgpath gno.land/r/moul_basics_args_v1 --func Hello --args Multiverse
("Hello Multiverse!" string)
OK!
GAS WANTED: 500000
GAS USED:   69855
```


_generated with 'make integration'_
