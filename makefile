INCS = menu.txt chap_menu.txt lang_menu.txt 
PTMLFILES = $(wildcard *.ptml)
HTMLFILES = $(shell ls *.ptml | sed -e 's/ptml/html/g')

website: lang_menu.txt menu.txt $(HTML_FILES)
	git commit -a -m "HTML rebuild."
	git push origin master

lang_menu.txt: lang_chapter_binary.txt
	./gen_lang_menu.awk <lang_chapter_binary.txt >lang_menu.txt

lang_chapter_binary.txt: chapters.txt langs.txt
	./gen_lang_bin.awk <chapters.txt >lang_chapter_binary.txt
	
chap_menu.txt: chapters.txt
	./gen_chaps.awk <chapters.txt >chap_menu.txt

$(HTML_FILES): $(PTML_FILES) $(INCS)
	./html_include.awk <$< >$@
