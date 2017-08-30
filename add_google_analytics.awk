#!/usr/bin/awk -f
# this file insert all html with google analytics

BEGIN {
}

# match if already inject google_analytics or not
/<!-- google_analytics/, /<!-- end google_analytics/ {
    next
}

/\<\/body\>/ {
    print "    " $1
    print "    <!-- google_analytics -->"

    file = "templates/google_analytics.txt"
    while ((getline < file ) > 0) {
        print
    }
    print "    <!-- end google_analytics -->"
    next
}

{ print }