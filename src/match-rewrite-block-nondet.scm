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

%var match-rewrite-block/nondet

%use (make-node node? node-children set-node-children! node-id node-label node-namespace node-type node-constant? set-node-constant?! node-binding set-node-binding! node-status set-node-status! node-visited? set-node-visited?!) "./node.scm"
%use (run-match-pattern/nondet) "./run-match-pattern-nondet.scm"
%use (variable-get-association-nondet-singleton) "./variable-get-association-nondet-singleton.scm"

%use (variable-get-association-or/nondet) "./variable-get-association-or-nondet.scm"
%use (get-head) "./get-head.scm"
%use (debug) "./euphrates/debug.scm"
%use (debugv) "./euphrates/debugv.scm"

(define (match-rewrite-block/nondet free-stack block main-input)
  (define children (node-children block))
  (define const-node (list-ref children 0))
  (define input-node (list-ref children 1))
  (define match-pattern (list-ref children 2))
  (define replace-pattern (list-ref children 3))

  (define input-val
    (variable-get-association-nondet-singleton input-node main-input #f))

  (define ret
    (if (not input-val) '()
        (run-match-pattern/nondet free-stack match-pattern input-val)))

  ;; (let* ((current input-node)
  ;;        (view (get-head 4 current))
  ;;        (status (if (null? ret) 'FAIL 'OK))
  ;;        (get
  ;;         (let ((ass (variable-get-association-or/nondet current #f)))
  ;;           (and ass (list->vector (map (lambda (n) (get-head 4 n)) ass))))))
  ;;   (debugv input-val)
  ;;   (debug "Matching ~s (bound ~s) -> ~s" view get status))

  ret)
