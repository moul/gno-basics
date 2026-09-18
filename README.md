# gno-basics [![CI](https://github.com/moul/gno-basics/actions/workflows/ci.yml/badge.svg)](https://github.com/moul/gno-basics/actions/workflows/ci.yml)

[Gno](https://github.com/gnolang/gno) smart contract examples, smallest first.

Each directory is a self-contained realm with a `gnomod.toml`, a contract, and a
test. `gnowork.toml` at the root ties them into one workspace, so `gno test ./...`
runs everything.

| Example | Shows |
|---|---|
| [`001-hello`](./001-hello) | The smallest realm: one exported function |
| [`002-args`](./002-args) | Passing arguments |
| [`003-data`](./003-data) | Persistent state — package-level variables survive between calls |
| [`004-render`](./004-render) | `Render(path)`, the entry point gnoweb calls |
| [`900-wikipedia-coin`](./900-wikipedia-coin) | Wikipedia's Solidity coin example, in Gno |

[`legacy/`](./legacy) holds three older examples that no longer build — their
dependencies were removed from the monorepo. See the README there.

## Usage

```sh
make install_deps                 # Gno toolchain into ~/.gno/bin
export PATH="$HOME/.gno/bin:$PATH"

make test                         # gno test ./... -v
make lint                         # gno lint ./...
make dev                          # local chain with hot reload, all examples
```

Deploying: see each example's README, and
[Gno networks](https://docs.gno.land/testnets) for the current testnet's chain
id and RPC endpoint.

## See also

* https://gno.land — mainnet (`gnoland-1`)
* https://docs.gno.land — documentation
* https://github.com/gnolang/gno — the monorepo
* https://github.com/moul/gno-contracts — moul's maintained realms and packages
