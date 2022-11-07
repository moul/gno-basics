//go:build tool
// +build tool

package tool

import (
	_ "github.com/campoy/embedmd/embedmd"    // for embedmd
	_ "github.com/gnolang/gno"               // for contracts' deps
	_ "github.com/gnolang/gno/pkgs/bft/node" // for gnokey
	_ "github.com/gnolang/gno/pkgs/command"  // for gnokey
	_ "github.com/gnolang/gno/pkgs/gnolang"  // for gnodev
)
