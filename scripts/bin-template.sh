#! /bin/sh
exec guile -L 'ROOT' -s 'ROOT/schrec/main.scm' "$@"
