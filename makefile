# Need to export as ENV var
export TEMPLATE_DIR = templates
PTML_DIR = ptml

INCS = $(TEMPLATE_DIR)/menu.txt chap_menu.txt lang_menu.txt

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

lang_menu.txt: $(TEMPLATE_DIR)/lang_chapter_binary.txt gen_lang_menu.awk
	./gen_lang_menu.awk <$(TEMPLATE_DIR)/lang_chapter_binary.txt >$(TEMPLATE_DIR)/lang_menu.txt

lang_chapter_binary.txt: $(TEMPLATE_DIR)/chapters.txt $(TEMPLATE_DIR)/langs.txt gen_lang_bin.sh
	./gen_lang_bin.sh <$(TEMPLATE_DIR)/chapters.txt >$(TEMPLATE_DIR)/lang_chapter_binary.txt
	
chap_menu.txt: $(TEMPLATE_DIR)/chapters.txt gen_chaps.awk
	./gen_chaps.awk <$(TEMPLATE_DIR)/chapters.txt >$(TEMPLATE_DIR)/chap_menu.txt

clean:
	rm $(HTMLFILES)
