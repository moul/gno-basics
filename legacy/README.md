# legacy

Examples that no longer build, kept for reference rather than deleted.

They are **outside the `gnowork.toml` workspace** on purpose, so `gno test ./...`
at the repository root stays green.

Each of these depends on packages that were removed from `gnolang/gno` when the
`p/demo/*` namespace was retired in favour of `p/nt/*`:

| Example | Depends on | Status |
|---|---|---|
| `005-import` | `p/demo/dom` | **No successor.** Would need rewriting against a different package. |
| `006-grc20` | `p/demo/grc/grc20` (`IGRC20`, `NewAdminToken`) | `p/nt/grc20` exists but the API is different — this is a rewrite, not a rename. |
| `007-vault` | `p/demo/grc/exts/vault` | **No successor.** |

They also predate the `std` → `chain` standard-library split and the current
interrealm rules (`cur realm` parameters, `cross(cur)` at call sites).

Porting any of them back into the workspace is welcome: add a `gnomod.toml`,
move the directory up one level, and make `gno test ./...` pass.
