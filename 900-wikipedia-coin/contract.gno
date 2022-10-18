// based on Wikipedia's Solidity example: https://en.wikipedia.org/wiki/Solidity
package coin

import (
	"gno.land/p/avl"
	"std"
)

var balances avl.Tree
var minter std.Address

// Constructor code is only run when the contract is creat:ed
func init() {
	minter = std.GetOrigCaller()
}

func Mint(receiver std.Address, amount uint) {
	if std.GetOrigCaller() != minter {
		panic("restricted")
	}
	curBal := getBalance(receiver)
	newBal := curBal + amount
	balances.Set(receiver, newBal)
}

func Send(receiver std.Address, amount uint) {
	sender := std.GetOrigCaller()

	senderBal := getBalance(sender)
	receiverBal := getBalance(receiver)
	if amount > senderBal {
		panic("insufficient balance: " + senderBal)
	}

	balances.Set(sender, senderBal-amount)
	balances.Set(receiver, receiverBal+amount)
}

func getBalance(addr std.Address) uint {
	bal, found := balances.Get(addr.String())
	if !found {
		return 0
	}
	return bal
}
