INCS = menu.txt chap_menu.txt chapters.txt lang_menu.txt langs.txt

website: lang_menu 
	git commit -a -m "HTML rebuild."
	git push origin master

lang_menu:
	./gen_lang_bin.awk <chapters.txt >lang_chapter_binary.txt
	./gen_lang_menu.awk <lang_chapter_binary.txt >lang_menu.txt

%.html: %.ptml $(INCS)
	./html_include.awk <$< >$@
