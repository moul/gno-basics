package demo

import (
	"std"

	"gno.land/p/demo/grc/exts/vault"
	"gno.land/p/demo/grc/grc20"
)

// FooToken and FooVault are exported. Other contracts can interact with them.
var FooToken grc20.IGRC20
var FooVault vault.Vault

func init() {
	// generate admin and mint some tokens to test1.
	const test1 = std.Address("g1jg8mtutu9khhfwc4nxmuhcpftf0pajdhfvsqf5")
	admin := grc20.NewAdminToken("Foo Token", "FOO", 4)
	admin.Mint(test1, 100000000)

	// publicly expose an unprivileged implementation of IGRC20.
	FooToken = admin.GRC20()

	// publicly expose a vault.
	FooVault = vault.New(admin)
}

func MyBalance() uint64 {
	caller := std.GetOrigCaller()
	balance, err := FooToken.BalanceOf(caller)
	if err != nil {
		panic(err)
	}
	return balance
}

func Deposit(amount uint, recoverAddress std.Address) {
	lockDuration := uint(100) // in blocks.
	FooVault.Deposit(amount, recoverAddress, lockDuration)
}

func Recover(target std.Address) {
	FooVault.Recover(target)
}

func Unvault(amount uint) {
	FooVault.Unvault(amount)
}

func Redeem(amount uint) {
	FooVault.Redeem()
}
