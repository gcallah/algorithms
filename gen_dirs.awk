#!/usr/bin/awk -f

BEGIN {
    file="langs.txt"; 
    while((getline < file ) > 0 ) {
    	langs[$1] = 1  # record each language
    }
}

/^$/ { }     # blank lines allowed

/^\;/ { }    # allows comments in the chapter file

/^[IVX]/ { } # skip the major section names

/^[0-9]/ {
    print $2
    for( lang in langs ) {
        new_dir = lang "/" $2
        if (system( "[ -d " new_dir " ] ") == 0)
            print new_dir " already exists."
        else {
            print "We are going to add " new_dir
            if (system( "mkdir " new_dir) == 0) {
                system( "touch " new_dir "/README")
                system( "git add " new_dir "/README")                
            }
        }
    }
}
