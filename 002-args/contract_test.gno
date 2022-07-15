package demo

import "testing"

func Test(t *testing.T) {
	got := Hello("People")
	expected := "Hello People!"
	if got != expected {
		t.Fatalf("expected %q, got %q.", expected, got)
	}
}
