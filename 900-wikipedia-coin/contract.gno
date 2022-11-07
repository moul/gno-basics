// based on Wikipedia's Solidity example: https://en.wikipedia.org/wiki/Solidity
package coin

import (
	"std"
	"strconv"

	"gno.land/p/demo/avl"
	"gno.land/p/demo/ufmt"
)

var balances = avl.NewMutTree() // addr -> balance
var minter std.Address

// Constructor code is only run when the contract is created
func init() {
	minter = std.GetOrigCaller()
}

func Mint(receiver std.Address, amount uint) {
	if std.GetOrigCaller() != minter {
		panic("restricted")
	}
	curBalance := BalanceOf(receiver)
	newBalance := curBalance + amount
	balances.Set(receiver.String(), newBalance)
}

func Send(receiver std.Address, amount uint) {
	sender := std.GetOrigCaller()
	senderBalance := BalanceOf(sender)
	if amount > senderBalance {
		panic(ufmt.Sprintf("insufficient balance: %d", senderBalance))
	}
	receiverBalance := BalanceOf(receiver)
	balances.Set(sender.String(), senderBalance-amount)
	balances.Set(receiver.String(), receiverBalance+amount)
}

func BalanceOf(addr std.Address) uint {
	balance, found := balances.Get(addr.String())
	if !found {
		return 0
	}
	return balance.(uint)
}
