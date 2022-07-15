package hello

import "testing"

func TestRender(t *testing.T) {
	{
		got := Render("/")
		expected := "1000"
		if got != expected {
			t.Fatalf("expected %q, got %q.", expected, got)
		}
	}

	Inc()

	{
		got := Render("/")
		expected := "1001"
		if got != expected {
			t.Fatalf("expected %q, got %q.", expected, got)
		}
	}
}
