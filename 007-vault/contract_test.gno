package demo

import (
	"std"
	"strings"
	"testing"

	"gno.land/p/demo/testutils"
)

func Test(t *testing.T) {
	test1 := std.Address("g1jg8mtutu9khhfwc4nxmuhcpftf0pajdhfvsqf5")
	test2 := testutils.TestAddress("test2")
	test3 := testutils.TestAddress("test3")
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

	// test1 deposits 300 with an unlock duration of 100 blocks default.
	std.TestSetOrigCaller(test1)
	Deposit(300, test3)

	// check balance of test1.
	{
		got, _ := FooToken.BalanceOf(test1)
		expected := 99998700
		if got != expected {
			t.Fatalf("expected %d, got %d.", expected, got)
		}
	}

	// check balance of valut pkgs.
	{
		got, _ := FooToken.BalanceOf(std.GetOrigPkgAddr())
		expected := 300
		if got != expected {
			t.Fatalf("expected %d, got %d.", expected, got)
		}
	}

	// test1 calls unvalut for 50 tokens
	// and wait 101 blocks
	// then redeem it
	Unvault(50)
	std.TestSkipHeights(101)
	Redeem(50)

	// check balance of test1.
	{
		got, _ := FooToken.BalanceOf(test1)
		expected := 99998750
		if got != expected {
			t.Fatalf("expected %d, got %d.", expected, got)
		}
	}

	// check balance of valut pkgs.
	{
		got, _ := FooToken.BalanceOf(std.GetOrigPkgAddr())
		expected := 250
		if got != expected {
			t.Fatalf("expected %d, got %d.", expected, got)
		}
	}

	// TODO: additional test case(s) func Recover().
}
