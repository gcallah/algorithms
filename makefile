SRCS = $(wildcard *.ptml)
OBJS = $(wildcard *.html)
INCS = menu.txt chap_menu.txt chapters.txt lang_menu.txt langs.txt

lang_menu:
	./gen_lang_bin.awk <chapters.txt >lang_chapter_binary.txt
	./gen_lang_menu.awk <lang_chapter_binary.txt >lang_menu.txt

%.html: %.ptml $(INCS)
	./html_include.awk <$< >$@

website: $(OBJS) $(INCS)
	git commit -a -m "HTML rebuild."
	git push origin master
