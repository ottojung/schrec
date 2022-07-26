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

%var make-node
%var node?
%var node-children
%var set-node-children!
%var node-id
%var node-label
%var node-type
%var node-bindtype
%var set-node-bindtype!
%var node-binding
%var set-node-binding!
%var node-status
%var set-node-status!
%var node-visited?
%var set-node-visited?!

%use (define-type9) "./euphrates/define-type9.scm"
%use (make-prefixtree prefixtree-set! prefixtree-ref-furthest) "./euphrates/prefixtree.scm"
%use (raisu) "./euphrates/raisu.scm"

%use (get-current-thread) "./get-current-thread.scm"

(define-type9 <n>
  (node-ctor id children label type bindtype binding status visited?) node?
  ;; reference part
  (id node-id)

  ;; children part
  (children node-children/raw set-node-children/raw!)

  ;; meta part
  (label node-label)
  (type node-type)
  (bindtype node-bindtype set-node-bindtype!)
  (binding node-binding set-node-binding!)
  (status node-status set-node-status!)
  (visited? node-visited? set-node-visited?!)
  )

(define (make-node id children label type)
  (define pt (make-prefixtree children))
  (node-ctor id pt label type #f #f #f #f))

(define (node-children node)
  (define thread (get-current-thread))
  (define pt (node-children/raw node))
  (define ret (prefixtree-ref-furthest pt (reverse thread)))
  ret)

(define (set-node-children! node children)
  (define thread (get-current-thread))
  (define pt (node-children/raw node))
  (prefixtree-set! pt (reverse thread) children))
