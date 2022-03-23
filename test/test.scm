
%run guile

%use (debug) "./src/euphrates/debug.scm"
%use (debugv) "./src/euphrates/debugv.scm"

%use () "./example.scm"

(use-modules (ice-9 pretty-print))

(display "Done.\n")
