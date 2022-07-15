package demo

import "strings"

func Hello() string {
	return "Hello World!"
}

func greetings(name string) string { // private
	return "Welcome, " + name + "!"
}

func Render(path string) string {
	switch {
	case path == "hello":
		return Hello()
	case strings.HasPrefix(path, "greetings/"):
		name := strings.Split(path, "/")[1] // take string after slash
		name = strings.Title(name)          // capitalize first letter
		return greetings(name)
	case path == "":
		out := "- [hello](/r/moul_basics_004:hello)\n"
		out += "- [greetings/Manfred](/r/moul_basics_004:greetings/Manfred)\n"
		return out
	}
	return "404"
}
