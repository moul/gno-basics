[embedmd]:# (out.txt console)
```console
foo@bar:~$ gnokey maketx call "MYWALLET" --gas-fee 1ugnot --broadcast true --chainid "dev" --remote "localhost:26657" \
> --gas-wanted 200000 --pkgpath gno.land/r/moul_basics_003 --func Add --args 42
Enter password.
(1042 int)
OK!
GAS WANTED: 200000
GAS USED:   104255
foo@bar:~$ gnokey maketx call "MYWALLET" --gas-fee 1ugnot --broadcast true --chainid "dev" --remote "localhost:26657" \
> --gas-wanted 200000 --pkgpath gno.land/r/moul_basics_003 --func Add --args 295
Enter password.
(1337 int)
OK!
GAS WANTED: 200000
GAS USED:   104271
```
