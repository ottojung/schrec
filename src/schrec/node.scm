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
  (define-module (node)
    :export (make-node node? node-children set-node-children! node-id node-label node-namespace node-binding set-node-binding! node-visited? set-node-visited?! node-display set-node-display!)
    :use-module ((euphrates define-type9) :select (define-type9))
    :use-module ((euphrates prefixtree) :select (make-prefixtree prefixtree-ref-furthest prefixtree-set!))
    :use-module ((get-current-thread) :select (get-current-thread))
    :use-module ((nodeinfo) :select (make-nodeinfo nodeinfo-display nodeinfo-label nodeinfo-namespace set-nodeinfo-display!))
    :use-module ((thread-obj) :select (thread-obj-lst))
    )))



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

(define (node-display node)
  (nodeinfo-display (node-info node)))
(define (set-node-display! node new)
  (set-nodeinfo-display! (node-info node) new))

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
