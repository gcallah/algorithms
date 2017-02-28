
DIRS = GettingStarted Quicksort GreedyAlgorithms


all:
	-for d in $(DIRS); do (cd $$d; go build -v); done

install:
	-for d in $(DIRS); do (cd $$d; go install -v); done
	
clean:
	-for d in $(DIRS); do (cd $$d; go clean); done



