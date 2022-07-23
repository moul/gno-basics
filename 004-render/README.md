# [r/moul_basics_render_v1](https://test2.gno.land/r/moul_basics_render_v1)
_`README.md` generated by "make integration"._

## Examples

```console
foo@bar:~$ gnokey maketx call "MYWALLET" --gas-fee 1ugnot --broadcast true --chainid "test2" --remote  \
> "test2.gno.land:36657" --gas-wanted 500000 --pkgpath gno.land/r/moul_basics_render_v1 --func Render --args hello
("Hello World!" string)
OK!
GAS WANTED: 500000
GAS USED:   72697
```

```console
foo@bar:~$ gnokey maketx call "MYWALLET" --gas-fee 1ugnot --broadcast true --chainid "test2" --remote  \
> "test2.gno.land:36657" --gas-wanted 500000 --pkgpath gno.land/r/moul_basics_render_v1 --func Render --args foobar
("404" string)
OK!
GAS WANTED: 500000
GAS USED:   202920
```

## `gnodev test`

```console
foo@bar:~$ gnodev test . --verbose
=== RUN   Test
--- PASS: Test (0.00s)
ok      ./. 	3.03s
```

## How to publish locally

```sh
gnokey maketx addpkg "MYWALLET" --deposit "ugnot" --gas-fee "1ugnot" --gas-wanted "5000000" --broadcast true --remote "localhost:26657" --chainid "dev" --pkgpath "'gno.land/r/moul_basics_render_v1'" --pkgdir "."
```
