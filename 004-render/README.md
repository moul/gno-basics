# `gno.land/r/moul/basics/render/v1`

`Render(path)` — the entry point gnoweb calls to display a realm as a page, and how to route on the path.

## Test it

From the repository root:

```sh
gno test ./004-render -v
```

## Deploy it

Get the current testnet's chain id and RPC endpoint from
[Gno networks](https://docs.gno.land/testnets), then:

```sh
gnokey maketx addpkg \
  -pkgpath "gno.land/r/moul/basics/render/v1" -pkgdir . \
  -gas-fee 1000000ugnot -gas-wanted 20000000 \
  -chainid <chain-id> -remote <rpc> MYKEY
```

Replace `moul` in the path with your own namespace — you can only deploy under a
namespace you own. See [Users and teams](https://docs.gno.land/resources/users-and-teams).
