#!/usr/bin/awk -f

# This program generates the program dirs for the Algorithm Museum's languages.
# It reads langs.txt to get the language list, and stdin for the chapter names.

BEGIN {
    header = "| CHAPTER |"
    separator = "| :---: |"
    file = "langs.txt";
    while((getline < file ) > 0 ) {
    	langs[$1] = 1  # record each language
    }
    for (lang in langs) {
      header = header " " lang " |"
      separator = separator " :---: |"
    }
    print header
    print separator
}

/^[0-9]/ {     # this is a chapter name
    k = " | **" $2 "** | "
    for( lang in langs ) {
        dir = lang "/" $2
        cmd = "ls " dir " | egrep -v 'README' | awk 'END{print NR}'"
        cmd | getline x
        close(cmd)
        if (x == 0) {
          k = k "<a href='#'><img src='cross.png' align='center' height='20' width='20' ></a> |"
        } else {
          k = k "<a href='" dir "'><img src='checked.png' align='center' height='20' width='20' ></a> |"
        }
    }
    print k
}
