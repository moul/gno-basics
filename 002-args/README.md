# `gno.land/r/moul/basics/args/v1`

Passing arguments to an exported function.

## Test it

From the repository root:

```sh
gno test ./002-args -v
```

## Deploy it

Get the current testnet's chain id and RPC endpoint from
[Gno networks](https://docs.gno.land/testnets), then:

```sh
gnokey maketx addpkg \
  -pkgpath "gno.land/r/moul/basics/args/v1" -pkgdir . \
  -gas-fee 1000000ugnot -gas-wanted 20000000 \
  -chainid <chain-id> -remote <rpc> MYKEY
```

Replace `moul` in the path with your own namespace — you can only deploy under a
namespace you own. See [Users and teams](https://docs.gno.land/resources/users-and-teams).
