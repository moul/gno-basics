package demo

import (
	"std"

	"gno.land/p/grc/grc20"
)

// FooToken is exported. Other contracts can interact with it.
var FooToken grc20.IGRC20

func init() {
	// generate minter and mint some tokens to test1.
	const test1 = std.Address("g1jg8mtutu9khhfwc4nxmuhcpftf0pajdhfvsqf5")
	minter := grc20.NewAdminToken("Foo Token", "FOO", 4)
	minter.Mint(test1, 100000000)

	// publicly expose an unprivileged implementation of IGRC20.
	FooToken = minter.GRC20()
}

func MyBalance() uint64 {
	caller := std.GetOrigCaller()
	balance, err := FooToken.BalanceOf(caller)
	if err != nil {
		panic(err)
	}
	return balance
}
