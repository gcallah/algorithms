INCS = menu.txt chap_menu.txt lang_menu.txt 

website: lang_menu.txt menu.txt
	git commit -a -m "HTML rebuild."
	git push origin master

lang_menu.txt: lang_chapter_binary.txt
	./gen_lang_menu.awk <lang_chapter_binary.txt >lang_menu.txt

lang_chapter_binary.txt: chapters.txt langs.txt
	./gen_lang_bin.awk <chapters.txt >lang_chapter_binary.txt
	
menu.txt: chapters.txt
	./gen_chaps.awk <chapters.txt >menu.txt

%.html: %.ptml $(INCS)
	./html_include.awk <$< >$@
