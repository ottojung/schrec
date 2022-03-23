;;;; Copyright (C) 2021, 2022  Otto Jung
;;;;
;;;; This program is free software: you can redistribute it and/or modify
;;;; it under the terms of the GNU General Public License as published by
;;;; the Free Software Foundation; version 3 of the License.
;;;;
;;;; This program is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;; GNU General Public License for more details.
;;;;
;;;; You should have received a copy of the GNU General Public License
;;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

%run guile

%use (with-cli define-cli:show-help) "./euphrates/define-cli.scm"
%use (current-program-path/p) "./euphrates/current-program-path-p.scm"
%use (read-string-file) "./euphrates/read-string-file.scm"
%use (dprintln) "./euphrates/dprintln.scm"
%use (file-or-directory-exists?) "./euphrates/file-or-directory-exists-q.scm"
%use (open-file-port) "./euphrates/open-file-port.scm"
%use (read-list) "./euphrates/read-list.scm"

%use (eval-hook) "./eval-hook.scm"
%use (graph->list) "./graph-to-list.scm"
%use (list->graph) "./list-to-graph.scm"
%use (reduce/det-topdown/loop) "./reduce-det-topdown-loop.scm"
%use (reduce/nondet) "./reduce-nondet.scm"

%use (debugv) "./euphrates/debugv.scm"

%for (COMPILER "guile")
(use-modules (ice-9 pretty-print))
%end

(define (fatal fmt . args)
  (parameterize ((current-output-port (current-error-port)))
    (apply dprintln (cons fmt args)))
  (exit 1))

(define (main)
  (parameterize ((current-program-path/p "tegfs"))
    (with-cli
     (MAIN
      MAIN : OPT* <filename>
      OPT : --deterministic / --nondeterministic / --help
      )

     :default (--deterministic #t)
     :exclusive (--deterministic --nondeterministic)

     (when --help
       (define-cli:show-help))

     (unless (file-or-directory-exists? <filename>)
       (fatal "Given file does not exist: ~a" <filename>))

     (eval-hook
      (lambda (g)
        (display "\nStep:\n") (pretty-print (graph->list g))))

     (let* ((file-port (open-file-port <filename> "r"))
            (parsed (car (read-list file-port)))
            (do (close-port file-port))
            (do (debugv parsed))
            (graph (list->graph parsed)))

       (if --deterministic
           (reduce/det-topdown/loop graph)
           (reduce/nondet graph))

       ((eval-hook) graph)))))

(main)
