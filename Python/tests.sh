#!/bin/bash

# put tests here!

./test_quicksort.py
if [ "$?" != "0" ]; then
    exit 1
fi

exit 0
