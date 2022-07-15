package demo

import "testing"

func Test(t *testing.T) {
	{ // call 1
		got := Add(42)
		expected := 1042
		if got != expected {
			t.Fatalf("expected %d, got %d.", expected, got)
		}
	}
	{ // call 2
		got := Add(295)
		expected := 1337
		if got != expected {
			t.Fatalf("expected %d, got %d.", expected, got)
		}
	}
}
