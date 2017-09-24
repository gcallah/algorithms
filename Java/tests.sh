#!/bin/bash

# put tests here!

readonly COMPILE="<compile>"
readonly RUN_TESTS="<run-tests>"
readonly CLEAN_UP="<clean_up>"

# Validate the command exit with 0.
validate() {
    if [ $? -eq 0 ]; then
        echo "[INFO] $1 succeeded."
    else
        echo "[ERROR] $1 failed."
        exit 1
    fi
}

# Clean up all Java class files
cleanup() {
    find . -type f -name '*.class' -delete
}

cd ./Java

# MultithreadedAlgorithms tests
#echo "[INFO] Compiling all java files under MultithreadedAlgorithms"
#javac -cp :test/junit-4.12.jar MultithreadedAlgorithms/*.java MultithreadedAlgorithms/tests/*.java
#validate $COMPILE
#
#echo "[INFO] Running FibonacciTest"
#java -cp :MultithreadedAlgorithms/:test/junit-4.12.jar:test/hamcrest-core-1.3.jar org.junit.runner.JUnitCore MultithreadedAlgorithms.tests.FibonacciTest
#validate $RUN_TESTS
#
#echo "[INFO] Running MatrixMultiplicationTest"
#java -cp :MultithreadedAlgorithms/:test/junit-4.12.jar:test/hamcrest-core-1.3.jar org.junit.runner.JUnitCore MultithreadedAlgorithms.tests.MatrixMultiplicationTest
#validate $RUN_TESTS
#
#echo "[INFO] Cleaning up artifacts"
#cleanup
#validate $CLEAN_UP
#
#exit 0
