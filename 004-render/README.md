[embedmd]:# (out.txt console)
```console
foo@bar:~$ gnokey maketx call "MYWALLET" --gas-fee 1ugnot --broadcast true --chainid "dev" --remote "localhost:26657" \
> --gas-wanted 500000 --pkgpath gno.land/r/moul_basics_004 --func Render --args hello
Enter password.
("Hello World!" string)
OK!
GAS WANTED: 500000
GAS USED:   72457
foo@bar:~$ gnokey maketx call "MYWALLET" --gas-fee 1ugnot --broadcast true --chainid "dev" --remote "localhost:26657" \
> --gas-wanted 500000 --pkgpath gno.land/r/moul_basics_004 --func Render --args foobar
Enter password.
("404" string)
OK!
GAS WANTED: 500000
GAS USED:   202680
```
