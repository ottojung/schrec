
%run guile

%var graph->list

%use (graph->rtree) "./graph-to-rtree.scm"
%use (rtree->list) "./rtree-to-list.scm"

(define graph->list
  (compose rtree->list graph->rtree))
