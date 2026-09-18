package wikipedia_coin

import (
	"testing"

	"gno.land/p/nt/testutils/v0"
)

func TestMintAndBalance(cur realm, t *testing.T) {
	test2 := testutils.TestAddress("test2")

	mint := uint(1000)
	Mint(cross(cur), test2, mint)

	testing.SetRealm(testing.NewUserRealm(test2)) // dropping privileges
	bal := BalanceOf(test2)
	if bal != mint {
		t.Errorf("expected %d, got %d", mint, bal)
	}
}
