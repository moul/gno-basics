# `gno.land/r/moul/basics/wikipedia_coin/v1`

Wikipedia's [Solidity example](https://en.wikipedia.org/wiki/Solidity) written in Gno: a minimal coin with a minter, balances in an AVL tree, and crossing functions for the state-changing calls.

## Test it

From the repository root:

```sh
gno test ./900-wikipedia-coin -v
```

## Deploy it

Get the current testnet's chain id and RPC endpoint from
[Gno networks](https://docs.gno.land/testnets), then:

```sh
gnokey maketx addpkg \
  -pkgpath "gno.land/r/moul/basics/wikipedia_coin/v1" -pkgdir . \
  -gas-fee 1000000ugnot -gas-wanted 20000000 \
  -chainid <chain-id> -remote <rpc> MYKEY
```

Replace `moul` in the path with your own namespace — you can only deploy under a
namespace you own. See [Users and teams](https://docs.gno.land/resources/users-and-teams).
