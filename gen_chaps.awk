#!/usr/bin/awk -f

# This program generates the chapter files for DAA.
# It reads stdin for the chapter names.

BEGIN {
    indent1 = "    "
    indent2 = indent1 indent1
    indent3 = indent2 indent1
    indent4 = indent2 indent2
    menu = "chap_menu.txt"
    templ = "ChapTemplate.txt"
    daa = "Design and Analyis of Algorithms: "
    create_pg = "../utils/create_page.py"

    print "" > menu   # because we don't want a cumulative menu for each run!
}

/^$/ { }       # blank lines allowed

/^\;/ { }      # allows comments in the chapter file

/^[IVXLCM]/ {   # a major section name
    sect_nm = split_on_caps($2)
    print indent2 "<h2>" >> menu
    print indent3 $1 ". " sect_nm >> menu
    print indent2 "</h2>" >> menu
}

/^[0-9]/ {     # this is a chapter name
    chap_file = $2 ".ptml"   # we process ptml files into html
    chap_html = $2 ".html"   # we process ptml files into html
    chap_nm = split_on_caps($2)
    if (system( "[ -f " chap_file " ] ") == 0)
        print chap_file " already exists."
    else 
        system("touch " chap_html)
        system(create_pg " <" templ " >" chap_file " \"" daa chap_nm "\"")
    print indent3 "<h3>" >> menu
    print indent4 "<a href=\"" chap_html "\">" >> menu
    print indent4 $1 ". " chap_nm >> menu
    print indent4 "</a>" >> menu
    print indent3 "</h3>" >> menu
}

function split_on_caps(s) {
    split_str = ""
    split(s, chars, "")
    for(i = 0; i < length(chars); i++)
    {
        # i > 0: no need to introduce space at start of string!
        if((i > 0) && match(chars[i], /[A-Z]/))
            split_str = split_str " "
        split_str = split_str chars[i]
    }
    return split_str
}
