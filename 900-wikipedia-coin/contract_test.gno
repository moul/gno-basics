package coin

import (
	"std"
	"strings"
	"testing"

	"gno.land/p/testutils"
)

func Test(t *testing.T) {
	test2 := testutils.TestAddress("test2")

	mint := uint(1000)
	Mint(test2, mint)

	std.TestSetOrigCaller(test2) // dropping privileges
	bal := BalanceOf(test2)
	if bal != mint {
		t.Errorf("expected %d, got %d", mint, bal)
	}
}
