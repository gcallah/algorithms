export TEMPLATES=$(PWD)/templates

INCS = $(TEMPLATES)/menu.txt chap_menu.txt lang_menu.txt

HTMLFILES = $(shell ls ptml/*.ptml | sed -e 's/ptml/html/g')
SUBPROJ_FILES = $(shell ls Algocynfas/*.html)

html/%.html: ptml/%.ptml $(INCS)
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

lang_menu.txt: $(TEMPLATES)/lang_chapter_binary.txt
	./gen_lang_menu.awk <$(TEMPLATES)/lang_chapter_binary.txt >$(TEMPLATES)/lang_menu.txt

lang_chapter_binary.txt: $(TEMPLATES)/chapters.txt $(TEMPLATES)/langs.txt
	./gen_lang_bin.sh < $(TEMPLATES)/chapters.txt >$(TEMPLATES)/lang_chapter_binary.txt
	
chap_menu.txt: $(TEMPLATES)/chapters.txt
	./gen_chaps.awk < $(TEMPLATES)/chapters.txt >$(TEMPLATES)/chap_menu.txt

clean:
	rm $(HTMLFILES)
