package demo

import (
	"std"
	"strings"
	"testing"

	"gno.land/p/testutils"
)

func Test(t *testing.T) {
	test1 := std.Address("g1jg8mtutu9khhfwc4nxmuhcpftf0pajdhfvsqf5")
	test2 := testutils.TestAddress("test2")
	std.TestSetOrigCaller(test1)

	// check token metadata.
	{
		got := FooToken.GetName()
		expected := "Foo Token"
		if strings.TrimSpace(got) != strings.TrimSpace(expected) {
			t.Fatalf("expected %q, got %q.", expected, got)
		}
	}

	// check balance of test1.
	{
		got, _ := FooToken.BalanceOf(test1)
		expected := 100000000
		if got != expected {
			t.Fatalf("expected %d, got %d.", expected, got)
		}
	}

	// transfer tokens to test2.
	_ = FooToken.Transfer(test2, 1000)

	// check balance of test1.
	{
		got, _ := FooToken.BalanceOf(test1)
		expected := 99999000
		if got != expected {
			t.Fatalf("expected %d, got %d.", expected, got)
		}
	}

	// check balance of test2.
	{
		got, _ := FooToken.BalanceOf(test2)
		expected := 1000
		if got != expected {
			t.Fatalf("expected %d, got %d.", expected, got)
		}
	}
}
