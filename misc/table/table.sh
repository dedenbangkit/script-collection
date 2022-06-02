#!/usr/bin/env bash

TABLE=$(pick < ~/.tableaccess)

if [[ "$TABLE" = "chrome" ]]; then
    TABLE=$(chrome-cli list links | pick | cut -d " " -f2)
    vd "$TABLE"
fi

if [[ "$TABLE" = "mysql" ]]; then
    echo -n Password:
    read -rs sqlpwd
    TABLE=$(mysql --user=root --password="${sqlpwd}" -e 'show databases' \
        | tail -n +2 \
        | pick)
    vd "mysql://root:${sqlpwd}@localhost:3306/${TABLE}"
fi

if [[ "$TABLE" = "postgres" ]]; then
    echo -n Username:
    read -r pguser
    echo -n Password:
    read -rs pgpwd
    echo ""
    echo -n Database:
    read -r pgdb
    vd "postgres://${pguser}:${pgpwd}@localhost:5432/${pgdb}"
fi

