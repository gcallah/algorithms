#!/usr/bin/awk -f
# this file preprocesses HTML files to put in includes

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
