#!/bin/bash
# compile and run the unit tests for heapsort algorithm of MinHeap, MaxHeap.

javac -cp :../../test/junit-4.12.jar ../Heap.java ../MinHeap.java ../MaxHeap.java MinHeapTest.java  MaxHeapTest.java

echo "[INFO] Running MaxHeapTest..."
java -cp .:../:../../test/junit-4.12.jar:../../test/hamcrest-core-1.3.jar org.junit.runner.JUnitCore MaxHeapTest
echo "[INFO] Running MinHeapTest..."
java -cp .:../:../../test/junit-4.12.jar:../../test/hamcrest-core-1.3.jar org.junit.runner.JUnitCore MinHeapTest

