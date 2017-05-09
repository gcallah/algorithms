#!/bin/bash

# put tests here!

echo "Running quicksort tests."
./test_quicksort.py > /dev/null
if [ "$?" != "0" ]; then
    echo "Quicksort test failure."
    exit 1
fi

exit 0
