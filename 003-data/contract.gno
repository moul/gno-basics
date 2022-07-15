package demo

var total int

func init() {
	total = 1000
}

func Add(nb int) int {
	total += nb
	return total
}
