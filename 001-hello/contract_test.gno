package demo

import "testing"

func Test(t *testing.T) {
	got := Hello()
	expected := "Hello World!"
	if got != expected {
		t.Fatalf("expected %q, got %q.", expected, got)
	}
}
