#!/bin/bash

# Python tests

function run_test {
    echo "Running $1 tests."
    $2 > /dev/null
    if [ "$?" != "0" ]; then
        echo "$1 test failure."
        exit 1
    fi
}

run_test "Getting Started" "python ./test_getting_started.py"
run_test "Fibonacci" "python ./test_fibonacci.py"
run_test "Heapsort" "python ./test_heapsort.py"
run_test "Quicksort" "python ./test_quicksort.py"
run_test "Binary Search Trees" "python ./test_binary_search_trees.py"
run_test "Greedy Algorithms" "python ./test_greedy_algorithms.py"

exit 0
