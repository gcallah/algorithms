#!/usr/bin/awk -f

# This program generates the language menu for the Algorithm Museum's languages.
# It reads langs.txt to get the language list, and stdin for the chapter names.

BEGIN {
    header = "CHAPTER"
    file = "langs.txt"
    while((getline < file ) > 0 ) {
    	langs[$1] = $2  # record each language and ext
    }
    for (lang in langs) {
        header = header " " lang
    }
    print header
}

/^[0-9]/ {     # this is a chapter name
    chapnm = $2
    entry = chapnm
    for( lang in langs ) {
        ext = langs[lang]
        files = "../" lang "/" chapnm "/*" ext
        if(system("ls " files " 1> /dev/null 2>&1")) {
#            print "Got nuttin"
            entry = entry " 0 "
        } else {
#            print "Got one"
            entry = entry " 1 "
        }
    }
    print entry
}
