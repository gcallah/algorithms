INCS = menu.txt chap_menu.txt lang_menu.txt 
HTMLFILES = $(shell ls *.ptml | sed -e 's/ptml/html/g')
 
%.html: %.ptml $(INCS)
	utils/html_include.awk <$< >$@

website: $(INCS) $(HTMLFILES)
	./C++/tests.sh
	./Clojure/tests.sh
	./Go/tests.sh
	./Java/tests.sh
	./Javascript/tests.sh
	./Python/tests.sh
	./Ruby/tests.sh
	-git commit -a -m "HTML rebuild."
	git push origin master

local: $(INCS) $(HTMLFILES)

lang_menu.txt: lang_chapter_binary.txt
	./gen_lang_menu.awk <lang_chapter_binary.txt >lang_menu.txt

lang_chapter_binary.txt: chapters.txt langs.txt
	./gen_lang_bin.sh <chapters.txt >lang_chapter_binary.txt
	
chap_menu.txt: chapters.txt
	./gen_chaps.awk <chapters.txt >chap_menu.txt

clean:
	rm $(HTMLFILES)
