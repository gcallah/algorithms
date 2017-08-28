INCS = menu.txt chap_menu.txt lang_menu.txt 
PTML_DIR = ptml
HTMLFILES = $(shell ls $(PTML_DIR)/*.ptml | sed -e 's/.ptml/.html/' | sed -e 's/ptml\///')
SUBPROJ_FILES = $(shell ls Algocynfas/*.html)
 
%.html: $(PTML_DIR)/%.ptml $(INCS)
	utils/html_include.awk <$< >$@

website: $(INCS) $(HTMLFILES) $(SUBPROJ_FILES)
	./C++/tests.sh
	./Clojure/tests.sh
	./Go/tests.sh
	./Java/tests.sh
	./Javascript/tests.sh
	./Ruby/tests.sh
	cd Python; ./tests.sh
	cd ..
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
