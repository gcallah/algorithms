;;;; Clojure examples of algorithms from Getting Started chapter of CLRS
;;;; Introduction to Algorithms.
;;;; Since the intention is that students can run these in the interactive
;;;; Clojure interpreter, rather than build JVM Clojure programs with them, for
;;;; now we are not worried about Clojure's module structure.
;;;; We used:
;;;; http://danmidwood.com/content/2013/02/24/exploring-clojure-memoization.html
;;;; in preparing these functions

(defn fib
  "A naive, recursive fibonacci function."
  [n]
  ;; print . to indicate number of calls
  (print ".")
  (if (>= 1 n)
    n
    (+ (fib (- n 1)) (fib (- n 2)))
  )
)

;; memo-ized version of above
(def memo-fib
  (memoize
    (fn [n]
      ;; print . to indicate number of calls
      (print ".")
      (if (>= 1 n)
        n
        (+ (memo-fib (- n 1)) (memo-fib (- n 2)))
      )
    )
  )
)
