//
// The Algorithm Museum
// https://gcallah.github.io/algorithms/AlgorithmMuseum.html
//
// section: Greedy Algorithms
// author: rdodson
// created: Mon Feb 27 21:18:51 EST 2017
//
//
package main

import "fmt"

func recursive_activity_selector(start []int, finish []int, k int, n int) []int {

	if n == -1 {
		n = len(start)
	}

	var m int = k + 1

	for m < n && start[m] < finish[k] {
		m = m + 1
	}

	if m <= n {

		var ar []int = make([]int, 1)
		ar[0] = m
		x := recursive_activity_selector(start, finish, m, n)
		ar = append(ar, x...)

		return ar
	} else {
		return nil
	}
}

func greedy_activity_selector(start []int, finish []int) []int {

	var n = len(start)
	var a []int
	var k int = 0

	for m := 1; m < n; m++ {

		if start[m] >= finish[k] {

			a = append(a, m)
			k = m
		}
	}

	return a
}

func printarray(name string, l []int) {

	fmt.Printf("%s: ", name)
	for i := 0; i < len(l); i++ {

		fmt.Printf("%d ", l[i])
	}
	fmt.Printf("\n")
}

func main() {

	var start = []int{0, 1, 3, 0, 5, 3, 5, 6, 8, 8, 2, 12}
	var finish = []int{0, 4, 5, 6, 7, 9, 9, 10, 11, 12, 14, 16}

	printarray("greedy_activity_selector", greedy_activity_selector(start, finish))
	printarray("recursive_activity_selector", recursive_activity_selector(start, finish, 0, 11))
}
