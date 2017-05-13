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

run_test "Getting Started" "./test_getting_started.py"
run_test "Quicksort" "./test_quicksort.py"
run_test "Greedy Algorithms" "./test_greedy_algorithms.py"

exit 0
