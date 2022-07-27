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

%var match-rewrite-block

%use (list-drop-n) "./euphrates/list-drop-n.scm"

%use (make-node node? node-children set-node-children! node-id node-label node-namespace node-type node-bindtype set-node-bindtype! node-binding set-node-binding! node-status set-node-status! node-visited? set-node-visited?!) "./node.scm"
%use (associate-free-variable!) "./associate-free-variable-bang.scm"
%use (initialize-free-variable!) "./initialize-free-variable-bang.scm"
%use (reinitialize-free-variable!) "./reinitialize-free-variable-bang.scm"
%use (uninitialize-free-variable!) "./uninitialize-free-variable-bang.scm"
%use (run-match-pattern) "./run-match-pattern.scm"
%use (free-variable?) "./free-variable-huh.scm"

%use (debug) "./euphrates/debug.scm"

(define (match-rewrite-block free-stack block main-input)
  (define children (node-children block))
  (define free-list (node-children (list-ref children 0)))
  (define input-node (list-ref children 1))
  (define match-pattern (list-ref children 2))
  (define replace-pattern (list-ref children 3))

  (when (free-variable? input-node)
    (associate-free-variable! free-stack input-node main-input))

  (let ((result (run-match-pattern free-stack match-pattern input-node)))
    (set-node-status! block (if result 'matched 'not-matched))
    ;; (when result
    ;;   (debug "MATCHED ~s WITH ~s" match-pattern free-stack))
    result))
