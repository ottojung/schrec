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
%use (with-randomizer-seed) "./euphrates/with-randomizer-seed.scm"
%use (raisu) "./euphrates/raisu.scm"

%use (eval-hook) "./eval-hook.scm"
%use (graph->list) "./graph-to-list.scm"
%use (list->graph) "./list-to-graph.scm"
%use (reduce/resultsfirst) "./reduce-resultsfirst.scm"
%use (reduce/resultsall) "./reduce-resultsall.scm"
%use (reduce/resultsrandom) "./reduce-resultsrandom.scm"
%use (with-current-thread) "./with-current-thread.scm"
%use (get-current-thread) "./get-current-thread.scm"
%use (pretty-print-graph) "./pretty-print-graph.scm"
%use (default-eval-hook) "./default-eval-hook.scm"

(define (fatal fmt . args)
  (parameterize ((current-output-port (current-error-port)))
    (apply dprintln (cons fmt args)))
  (exit 1))

(define (main)
  (parameterize ((current-program-path/p "schrec"))
    (with-cli
     (MAIN
      MAIN : --help
      /      OPT* <filename>
      OPT : --results RESULTS
      /     --trace
      /     --no-trace
      /     --seed <seed>
      RESULTS : all / first / random
      )

     :default (all #t)
     :exclusive (all first random)

     :help (all "Non-deterministic mode, returns all possible values.")
     :help (first "Deterministic mode, returns only the first (left-most) value.")
     :help (random "Random deterministic mode, returns a random value.")

     :help (<seed> "A seed for the random number generator.")
     :type (<seed> 'number)
     :default (<seed> 777)

     :default (--no-trace #t)
     :exclusive (--no-trace --trace)

     (when --help
       (define-cli:show-help))

     (unless (file-or-directory-exists? <filename>)
       (fatal "Given file does not exist: ~a" <filename>))

     (with-randomizer-seed
      <seed>
      (let* ((file-port (open-file-port <filename> "r"))
             (parsed (read-list file-port))
             (do (close-port file-port))
             (graph (list->graph parsed)))

        (when --trace
          (eval-hook (default-eval-hook graph))
          (display "Original:\n")
          (pretty-print-graph graph))

        (let ((thread-ids-stream
               (cond
                (all
                 (reduce/resultsall graph))
                (first
                 (reduce/resultsfirst graph))
                (random
                 (reduce/resultsrandom graph))
                (else
                 (raisu 'impossible RESULTS)))))

          (let loop ()
            (let ((thread (thread-ids-stream)))
              (when thread
                (unless --trace
                  (with-current-thread thread (pretty-print-graph graph)))
                (loop))))))))))

(main)
