#!/bin/sh
# get a bunch of hosts as argument (or just a file containing  the hosts),
# then add them in and commit the changes.

main ()
{
    mklist "$@" | format >> hosts
    sort -u hosts > hosts-sorted
    mv -f hosts-sorted hosts
    git add hosts
    git commit -m 'Updated hosts'
}

mklist ()
{
    if [ -r "$1" ]
    then
        awk NF "$1"
    else
        for arg; do
            echo "$arg"
        done
    fi
}

format ()
{
    list="$(cat)"
    list_www="$(echo "$list" | add_www)"
    ( echo "$list"; echo "$list_www" ) | add_ip
}

add_www ()
{
    sed 's/^/www./'
}

add_ip ()
{
    sed 's/^/0.0.0.0 /'
}

main "$@"
exit
