all: lang_menu.txt lang_chapter_binary.txt chap_menu.txt

lang_menu.txt: lang_chapter_binary.txt gen_lang_menu.awk
	./gen_lang_menu.awk <lang_chapter_binary.txt >lang_menu.txt

lang_chapter_binary.txt: chapters.txt langs.txt gen_lang_bin.awk
	./gen_lang_bin.awk <chapters.txt >lang_chapter_binary.txt

chap_menu.txt: chapters.txt gen_chaps.awk
	./gen_chaps.awk <chapters.txt >chap_menu.txt

clean:
	rm *_langs.txt
	rm lang_chapter_binary.txt
