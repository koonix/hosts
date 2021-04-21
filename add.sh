#!/bin/sh

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
    local list="$(cat)"
    local list_www="$(echo "$list" | add_www)"
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
