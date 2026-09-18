package demo

import (
	"strings"
	"testing"
)

func Test(t *testing.T) {
	got := Render("")
	expected := `
# [plot] Hello!

## Foo
foo foo foo
## Bar
bar bar bar
`
	if strings.TrimSpace(got) != strings.TrimSpace(expected) {
		t.Fatalf("expected %q, got %q.", expected, got)
	}
}
