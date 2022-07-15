[embedmd]:# (out.txt console)
```console
foo@bar:~$ gnokey maketx call "MYWALLET" --gas-fee 1ugnot --broadcast true --chainid "dev" --remote "localhost:26657" \
> --gas-wanted 200000 --pkgpath gno.land/r/moul_basics_001 --func Hello
Enter password.
("Hello World!" string)
OK!
GAS WANTED: 200000
GAS USED:   69242
```
