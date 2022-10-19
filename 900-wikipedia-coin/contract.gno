// based on Wikipedia's Solidity example: https://en.wikipedia.org/wiki/Solidity
package coin

import (
	"std"
	"strconv"

	"gno.land/p/avl"
	"gno.land/p/ufmt"
)

var balances avl.Tree // addr -> balance
var minter std.Address

// Constructor code is only run when the contract is created
func init() {
	minter = std.GetOrigCaller()
}

func Mint(receiver std.Address, amount uint) {
	if std.GetOrigCaller() != minter {
		panic("restricted")
	}
	curBal := BalanceOf(receiver)
	newBal := curBal + amount
	balances.Set(receiver.String(), newBal)
}

func Send(receiver std.Address, amount uint) {
	sender := std.GetOrigCaller()
	senderBal := BalanceOf(sender)
	if amount > senderBal {
		panic(ufmt.Sprintf("insufficient balance: %d", senderBal))
	}
	receiverBal := BalanceOf(receiver)
	balances.Set(sender.String(), senderBal-amount)
	balances.Set(receiver.String(), receiverBal+amount)
}

func BalanceOf(addr std.Address) uint {
	_, bal, found := balances.Get(addr.String())
	if !found {
		return 0
	}
	return bal.(uint)
}
