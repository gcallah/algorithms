SRCS = $(wildcard *.ptml)
OBJS = $(wildcard *.html)
INCS = menu.txt

%.html: %.ptml $(INCS)
	./html_include.awk <$< >$@

web_site: $(OBJS) $(INCS)
	git commit -a -m "HTML rebuild."
	git push origin master
