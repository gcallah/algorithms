#!/usr/bin/awk -f

# This program generates the program dirs for the Algorithm Museum's languages.
# It reads langs.txt to get the language list, and stdin for the chapter names.

BEGIN {
    file = "langs.txt"; 
    while((getline < file ) > 0 ) {
    	langs[$1] = 1  # record each language
    }
}

/^$/ { }       # blank lines allowed

/^\;/ { }      # allows comments in the chapter file

/^[IVXCM]/ { } # skip the major section names (Roman numberals)

/^[0-9]/ {     # this is a chapter name
    print $2
    for( lang in langs ) {
        new_dir = lang "/" $2
        if (system( "[ -d " new_dir " ] ") == 0)
            print new_dir " already exists."
        else {
            print "We are going to add " new_dir
            if (system( "mkdir " new_dir) == 0) {
                system( "touch " new_dir "/README.md")
                system( "git add " new_dir "/README.md")                
            }
        }
    }
}
