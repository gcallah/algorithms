QINCS = $(shell ls quiz*.txt | sed -e 's/txt/qhtm/g')
TEST = $(shell ls quiz*.txt | sed -e 's/txt/thtm/g')
QUIZZES = $(shell ls quiz*.txt)

%.qhtm: %.txt
	../utils/quiz2html.py $< \# >$@
	cp $@ ../templates

%.thtm: %.txt
	../utils/quiz2test.py $< \# >$@

all: $(QINCS)

test: $(TEST)

clean:
	touch *.txt
