;;;; Copyright (C) 2021, 2022, 2023 Otto Jung
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

(cond-expand
 (guile
  (define-module (schrec main)
    :use-module ((euphrates current-program-path-p) :select (current-program-path/p))
    :use-module ((euphrates define-cli) :select (define-cli:show-help with-cli))
    :use-module ((euphrates dprintln) :select (dprintln))
    :use-module ((euphrates file-or-directory-exists-q) :select (file-or-directory-exists?))
    :use-module ((euphrates open-file-port) :select (open-file-port))
    :use-module ((euphrates raisu) :select (raisu))
    :use-module ((euphrates read-list) :select (read-list))
    :use-module ((euphrates with-randomizer-seed) :select (with-randomizer-seed))
    :use-module ((schrec alpharename-list) :select (alpharename-list))
    :use-module ((schrec betaconvert-list) :select (betaconvert-list))
    :use-module ((schrec default-eval-hook) :select (default-eval-hook))
    :use-module ((schrec eval-hook) :select (eval-hook))
    :use-module ((schrec list-to-graph) :select (list->graph))
    :use-module ((schrec node) :select (node-children))
    :use-module ((schrec pretty-print-graph) :select (pretty-print-graph))
    :use-module ((schrec pretty-print-list) :select (pretty-print-list))
    :use-module ((schrec reduce-resultsall) :select (reduce/resultsall))
    :use-module ((schrec reduce-resultsfirst) :select (reduce/resultsfirst))
    :use-module ((schrec reduce-resultsrandom) :select (reduce/resultsrandom))
    :use-module ((schrec rooting-unjoin) :select (rooting-unjoin))
    :use-module ((schrec show-license) :select (show-license))
    :use-module ((schrec show-warranty) :select (show-warranty))
    :use-module ((schrec with-current-thread) :select (with-current-thread))
    )))


(define (fatal fmt . args)
  (parameterize ((current-output-port (current-error-port)))
    (apply dprintln (cons fmt args)))
  (exit 1))

(define (main)
  (parameterize ((current-program-path/p "schrec"))
    (with-cli
     (MAIN
      MAIN : --help
      /      version
      /      license
      /      warranty
      /      alpharename BREAK? <filename>
      /      betaconvert BREAK? <filename>
      /      RUN? OPT* BREAK? <filename>
      RUN : run
      BREAK : --
      OPT : --results RESULTS
      /     --trace
      /     --no-trace
      /     --seed <seed>
      /     --reflexive
      /     --irreflexive
      /     --root-at ROOTAT
      RESULTS : all / first / random
      ROOTAT : last / module
      )

     :default (all #t)
     :exclusive (all first random)

     :help (all "Non-deterministic mode, returns all possible values.")
     :help (first "Deterministic mode, returns only the first (left-most) value.")
     :help (random "Random deterministic mode, returns a random value.")
     :help (--root-at "Where to put the root of the graph")
     :help (last "Root is the tip of the last expression in the <filename>")
     :help (module "Root is a new node that joins all expressions in <filename>")

     :help (alpharename "Renames all let variables so that no two names are the same. Also removes alias bindings (by executing them, basically)")
     :help (betaconvert "Replaces variable names by their values. This turns trees into graphs")

     :help (<seed> "A seed for the random number generator.")
     :type (<seed> 'number)
     :default (<seed> 777)

     :default (--no-trace #t)
     :exclusive (--no-trace --trace)

     :default (--reflexive #t)
     :exclusive (--reflexive --irreflexive)

     :default (last #t)
     :exclusive (last module)

     :synonym (version --version -v)
     :synonym (--help help -h)
     :synonym (license copying)

     (define unjoin-mode
       (cond
        (last 'last)
        (module 'module)
        (else (fatal "Uknown --root-at value"))))

     (when --help
       (define-cli:show-help))
     (when version
       (display "0.9.9")
       (newline)
       (exit 0))
     (when license
       (show-license)
       (exit 0))
     (when warranty
       (show-warranty)
       (exit 0))

     (unless (file-or-directory-exists? <filename>)
       (fatal "Given file does not exist: ~a" <filename>))

     (with-randomizer-seed
      <seed>

      (let* ((file-port (open-file-port <filename> "r"))
             (parsed (read-list file-port)))
        (close-port file-port)

        (cond
         (alpharename
          (let ((renamed (alpharename-list parsed)))
            (for-each pretty-print-list renamed)))
         (betaconvert
          (let ((converted (betaconvert-list parsed)))
            (for-each pretty-print-graph (node-children converted))))

         (else
          (let* ((graph (list->graph parsed))
                 (rooted (rooting-unjoin unjoin-mode graph)))

            (when --trace
              (eval-hook (default-eval-hook rooted))
              (display "Original:\n")
              (pretty-print-graph rooted))

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

              (let loop ((first? #t))
                (let ((thread (thread-ids-stream)))
                  (if thread
                      (begin
                        (unless --trace
                          (with-current-thread thread (pretty-print-graph rooted)))
                        (loop #f))
                      (when (and first? --reflexive (not --trace))
                        (pretty-print-graph rooted))))))))))))))

(main)
