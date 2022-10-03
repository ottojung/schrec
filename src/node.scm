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
%var node-namespace
%var node-binding
%var set-node-binding!
%var node-visited?
%var set-node-visited?!

%use (define-type9) "./euphrates/define-type9.scm"
%use (make-prefixtree prefixtree-ref-furthest prefixtree-set!) "./euphrates/prefixtree.scm"
%use (get-current-thread) "./get-current-thread.scm"
%use (make-nodeinfo nodeinfo-label nodeinfo-namespace) "./nodeinfo.scm"
%use (thread-obj-lst) "./thread-obj.scm"

(define-type9 <n>
  (node-ctor id children info binding visited?) node?
  ;; semantic part
  (id node-id)
  (children node-children/raw set-node-children/raw!)

  ;; meta part
  (info node-info)
  (binding node-binding set-node-binding!)
  (visited? node-visited? set-node-visited?!)
  )

(define (make-node id children label namespace)
  (define pt (make-prefixtree children))
  (define info (make-nodeinfo label namespace))
  (node-ctor id pt info #f #f))

(define (node-label node)
  (nodeinfo-label (node-info node)))

(define (node-namespace node)
  (nodeinfo-namespace (node-info node)))

(define (node-children node)
  (define thread (get-current-thread))
  (define lst (thread-obj-lst thread))
  (define pt (node-children/raw node))
  (define ret (prefixtree-ref-furthest pt lst))
  ret)

(define (set-node-children! node children)
  (define thread (get-current-thread))
  (define lst (thread-obj-lst thread))
  (define pt (node-children/raw node))
  (prefixtree-set! pt lst children))
