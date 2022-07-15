package hello

import "strconv"

var sum int

func init() {
	sum = 1000
}

func Inc() {
	sum++
}

func Get() int {
	return sum
}

func Render(path string) string {
	return strconv.Itoa(sum)
}
