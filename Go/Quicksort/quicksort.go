//
// The Algorithm Museum
// https://gcallah.github.io/algorithms/AlgorithmMuseum.html
//
// section: Quicksort
// author: rdodson
// created: Sun Feb 26 13:13:34 EST 2017
//
//
package main

import "fmt"

func quicksort(l []int, p int, r int) {

	if p == -1 {
		p = 0
	}

	if r == -1 {
		r = len(l) - 1
	}

	if p < r {

		var q = partition(l, p, r)
		quicksort(l, p, q-1)
		quicksort(l, q+1, r)
	}
}

func partition(l []int, p int, r int) int {

	var x int = l[r]

	var i int = p - 1

	for j := p; j < r; j++ {

		if l[j] <= x {

			i += 1
			swap(l, i, j)
		}
	}

	swap(l, i+1, r)

	return i + 1
}

func swap(l []int, i int, j int) {

	var temp int = l[i]
	l[i] = l[j]
	l[j] = temp
}

func printarray(name string, l []int) {

	fmt.Printf("%s: ", name)
	for i := 0; i < len(l); i++ {

		fmt.Printf("%d ", l[i])
	}
	fmt.Printf("\n")
}

func main() {

	var l = []int{9, 7, 8, 5, 2, 6, 3, 1, 4, 0}

	printarray(" unsorted", l)
	quicksort(l, -1, -1)
	printarray("quicksort", l)
}

