#!/usr/bin/awk -f

# This program generates the chapter menu (a grid of cards, one per part)
# for the DAA home page.
# It reads stdin for the chapter names.

BEGIN {
    indent1 = "    "
    indent2 = indent1 indent1
    indent3 = indent2 indent1
    indent4 = indent2 indent2
    indent5 = indent4 indent1
    menu = "chap_menu.txt"
    templ = "ChapTemplate.txt"

    # Did not use daa and create_pg ? maybe remove those later on?
    # daa = "Design and Analysis of Algorithms: "
    # create_pg = "../utils/create_page.py"

    print indent2 "<div class=\"part-grid\">" > menu   # not cumulative!
    in_part = 0
}

END {
    close_part()
    print indent2 "</div>" >> menu
}


/^$/ { }       # blank lines allowed

/^\;/ { }      # allows comments in the chapter file

/^[IVXLCM]/ {   # a major section name
    close_part()
    in_part = 1
    sect_nm = split_on_caps($2)
    print indent3 "<section class=\"part-card part-" $1 "\">" >> menu
    print indent4 "<img class=\"part-icon\" src=\"graphics/parts/" $1 \
        ".svg\" alt=\"\">" >> menu
    print indent4 "<h2>" >> menu
    print indent5 "<span class=\"part-num\">Part " $1 "</span>" >> menu
    print indent5 sect_nm >> menu
    print indent4 "</h2>" >> menu
    print indent4 "<ol class=\"chapter-list\">" >> menu
}

/^[0-9]/ {     # this is a chapter name
    chap_file = $2 ".ptml"   # we process ptml files into html
    chap_html = $2 ".html"   # we process ptml files into html
    chap_nm = split_on_caps($2)
    print indent5 "<li><a href=\"" chap_html "\">" >> menu
    print indent5 "<span class=\"chap-num\">" $1 "</span>" >> menu
    print indent5 chap_nm >> menu
    print indent5 "</a></li>" >> menu
}

function close_part() {
    if(in_part) {
        print indent4 "</ol>" >> menu
        print indent3 "</section>" >> menu
    }
}

function split_on_caps(s) {
    split_str = ""
    split(s, chars, "")
    for(i = 0; i < length(chars); i++)
    {
        # i > 0: no need to introduce space at start of string!
        # Keep acronyms together: "TheFFT" -> "The FFT",
        # "NPCompleteness" -> "NP Completeness".
        if((i > 0) && match(chars[i], /[A-Z]/) &&
           (match(chars[i-1], /[a-z]/) || match(chars[i+1], /[a-z]/)))
            split_str = split_str " "
        split_str = split_str chars[i]
    }
    return split_str
}
