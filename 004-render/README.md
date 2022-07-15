# [gno.land/r/moul_basics_render_v1](https://test2.gno.land/r/moul_basics_render_v1)

```console
foo@bar:~$ gnokey maketx call "MYWALLET" --gas-fee 1ugnot --broadcast true --chainid "dev" --remote "localhost:26657"  \
> --gas-wanted 500000 --pkgpath gno.land/r/moul_basics_render_v1 --func Render --args hello
("Hello World!" string)
OK!
GAS WANTED: 500000
GAS USED:   72697
```

```console
foo@bar:~$ gnokey maketx call "MYWALLET" --gas-fee 1ugnot --broadcast true --chainid "dev" --remote "localhost:26657"  \
> --gas-wanted 500000 --pkgpath gno.land/r/moul_basics_render_v1 --func Render --args foobar
("404" string)
OK!
GAS WANTED: 500000
GAS USED:   202920
```


_generated with 'make integration'_
