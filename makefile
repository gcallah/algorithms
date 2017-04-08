SRCS = $(wildcard *.ptml)
OBJS = $(wildcard *.html)
INCS = menu.txt

%.html: %.ptml $(INCS)
	./gen_lang_bin.awk <chapters.txt | ./gen_lang_menu.awk > lang_menu.txt
	./html_include.awk <$< >$@

website: $(OBJS) $(INCS)
	git commit -a -m "HTML rebuild."
	git push origin master
