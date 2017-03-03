#!/usr/bin/awk -f

BEGIN {
    file="langs.txt"; 
    while((getline < file ) > 0 ) {
    	langs[$1] = 1  # record each language
    }
# next lines for debugging:
#    for( lang in langs )
#        print lang
}

/^$/ { }     # blank lines allowed

/^\;/ { }    # allows comments in the chapter file

/^[IVX]/ { } # skip the major section names

/^[0-9]/ {
    print $2
    for( lang in langs ) {
        print "We are about to test for " lang "/" $2
        if (system( "[ -f " lang "/" $2 " ] ") == 0)
            print lang "/" $2 " exists."
    }
}
