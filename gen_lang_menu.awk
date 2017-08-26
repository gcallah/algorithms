#!/usr/bin/awk -f

BEGIN {
    url = "https://github.com/gcallah/algorithms/tree/master/"
    indent1 = "    "
    indent2 = indent1 indent1
    indent3 = indent2 indent1
    print indent1 "<table>"
}

/^CHAPTER/ {
    tr()
    print indent3 "<th>Chapter</th>"
    for (i = 2; i <= NF; i++) {
        print indent3 "<th>" $i "</th>"
        langs[i] = $i
    }
    endtr()
    next
}

{
    chap = $1
    chap_langs = chap "_langs.txt"
    tr()
    print indent3 "<td>" chap "</td>"
    print indent3 "" > chap_langs
    for (i = 2; i <= NF; i++) {
        yn = "No"
        if($i) {
            yn = "<a href=\"" url langs[i] "/" chap "\">Yes</a>"
            print "<a href=\"" url langs[i] "/" chap "\">" langs[i] "</a><br>" >> chap_langs
        }
        print indent3 "<td>" yn "</td>"
    }
    close(chap_langs)
    endtr()
}

END {
    print indent1 "</table>"
}

function tr() {
    print indent2 "<tr>"
}

function endtr() {
    print indent2 "</tr>"
}
