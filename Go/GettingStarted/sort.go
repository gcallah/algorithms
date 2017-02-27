//
// The Algorithm Museum
// https://gcallah.github.io/algorithms/AlgorithmMuseum.html
//
// section: Getting Started
// author: rdodson
// created: Sun Feb 26 09:47:25 EST 2017
//
//
package main

import "fmt"
import "math"

func bubble_sort(l []int) []int {

	for i := 0; i < len(l); i++ {

		for j := len(l) - 1; j > i; j-- {

			if l[j] < l[j-1] {

				swap(l, j, j-1)
			}
		}
	}

	return l
}

func insert_sort(l []int) []int {

	for j := 1; j < len(l); j++ {

		var key int = l[j]
		var i int = j - 1

		for i >= 0 && l[i] > key {

			l[i+1] = l[i]
			i -= 1
		}

		l[i+1] = key
	}

	return l
}

func merge_sort(l []int, p int, r int) []int {

	if p < r {

		var q int = (p + r) / 2

		merge_sort(l, p, q)
		merge_sort(l, q+1, r)
		merge(l, p, q, r)
	}

	return l
}

func merge(l []int, p int, q int, r int) {

	var n1 int = q - p + 1
	var n2 int = r - q
	var left []int = make([]int, n1+1)
	var right []int = make([]int, n2+1)

	for i := 0; i < n1; i++ {

		left[i] = l[p+i]
	}

	for j := 0; j < n2; j++ {

		right[j] = l[q+j+1]
	}

	left[n1] = math.MaxInt32
	right[n2] = math.MaxInt32

	var i int = 0
	var j int = 0

	for k := p; k <= r; k++ {

		if left[i] <= right[j] {

			l[k] = left[i]
			i++

		} else {

			l[k] = right[j]
			j++
		}
	}
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

	var l0 = []int{9, 7, 8, 5, 2, 6, 3, 1, 4, 0}
	var l1 = []int{9, 7, 8, 5, 2, 6, 3, 1, 4, 0}
	var l2 = []int{9, 7, 8, 5, 2, 6, 3, 1, 4, 0}

	printarray("unsorted", l0)
	printarray("  bubble", bubble_sort(l0))
	printarray("  insert", insert_sort(l1))
	printarray("   merge", merge_sort(l2, 0, len(l2)-1))
}

