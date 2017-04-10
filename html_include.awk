#!/usr/bin/awk -f
# this file preprocesses HTML files to put in includes
# It looks for lines beginning with <!--include and takes the next bit as 
# a file name to include.

BEGIN {
}

/<!--include/ {
    file = $2
    while((getline < file ) > 0 ) {
    	print $0
    }
    next
}

{ print }
