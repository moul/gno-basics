// based on Wikipedia's Solidity example: https://en.wikipedia.org/wiki/Solidity
package wikipedia_coin

import (
	"chain/runtime/unsafe"

	"gno.land/p/nt/avl/v0"
	"gno.land/p/nt/ufmt/v0"
)

var (
	balances = avl.NewTree() // addr -> balance
	minter   address
)

// Constructor code is only run when the contract is created
func init() {
	minter = unsafe.OriginCaller()
}

func Mint(cur realm, receiver address, amount uint) {
	if unsafe.OriginCaller() != minter {
		panic("restricted")
	}
	curBalance := BalanceOf(receiver)
	newBalance := curBalance + amount
	balances.Set(receiver.String(), newBalance)
}

func Send(cur realm, receiver address, amount uint) {
	sender := unsafe.OriginCaller()
	senderBalance := BalanceOf(sender)
	if amount > senderBalance {
		panic(ufmt.Sprintf("insufficient balance: %d", senderBalance))
	}
	receiverBalance := BalanceOf(receiver)
	balances.Set(sender.String(), senderBalance-amount)
	balances.Set(receiver.String(), receiverBalance+amount)
}

func BalanceOf(addr address) uint {
	balance := balances.Get(addr.String())
	if balance == nil {
		return 0
	}
	return balance.(uint)
}
