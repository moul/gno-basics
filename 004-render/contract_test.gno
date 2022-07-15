package demo

import "testing"

func Test(t *testing.T) {
	shouldEqual(t, "hello", "Hello World!")
	shouldEqual(t, "greetings/Manfred", "Welcome, Manfred!")
	shouldEqual(t, "foobar", "404")
}

func shouldEqual(t *testing.T, path string, expected string) {
	t.Helper()

	got := Render(path)
	if got != expected {
		t.Fatalf("expected %d, got %d.", expected, got)
	}
}
