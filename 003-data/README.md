# [gno.land/r/moul_basics_data_v1](https://gno.land/r/moul_basics_data_v1)

```console
foo@bar:~$ gnokey maketx call "MYWALLET" --gas-fee 1ugnot --broadcast true --chainid "dev" --remote "localhost:26657"  \
> --gas-wanted 500000 --pkgpath gno.land/r/moul_basics_data_v1 --func Add --args 42
(1042 int)
OK!
GAS WANTED: 500000
GAS USED:   105135
```
```console
foo@bar:~$ gnokey maketx call "MYWALLET" --gas-fee 1ugnot --broadcast true --chainid "dev" --remote "localhost:26657"  \
> --gas-wanted 500000 --pkgpath gno.land/r/moul_basics_data_v1 --func Add --args 295
(1337 int)
OK!
GAS WANTED: 500000
GAS USED:   105151
```

_generated with 'make integration'_
