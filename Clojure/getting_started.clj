;;;; Clojure examples of algorithms from Getting Started chapter of CLRS
;;;; Introduction to Algorithms.
;;;; Since the intention is that students can run these in the interactive
;;;; Clojure interpreter, rather than build JVM Clojure programs with them, for
;;;; now we are not worried about Clojure's module structure.

;; insertion-sort is from:
;; http://eddmann.com/posts/insertion-sort-in-clojure/
;; Example: (insertion-sort (list 3 2 5 4 8 6 9 1))
;; This turns the list into a vector!
(defn insertion-sort [xs]
  (letfn [(insert [col x]
    (loop [[y & ys] col acc []]
      (cond
        (nil? y) (conj acc x)
        (<= x y) (vec (concat acc [x y] ys))
        :else (recur ys (conj acc y)))))]
  (reduce insert [] xs)))


;; merge-sort is from:
;; https://gist.github.com/baabelfish/6573984 
;; Example: (merge-sort (list 3 2 5 4 8 6 9 1))
(defn merge-aux [[x & xrest :as X] [y & yrest :as Y] R]
  (if (and (not-empty X) (not-empty Y))
    (if (<= x y)
      (merge-aux xrest Y (conj R x))
      (merge-aux X yrest (conj R y)))
  (concat R X Y)))

(defn merge-sort [X]
  (if (> (count X) 1)
    (let [sides (split-at (/ (count X) 2) X)]
      (merge-aux (merge-sort (get sides 0)) (merge-sort (get sides 1)) []))
  X))

;; bubble-sort is from:
;; http://eddmann.com/posts/bubble-sort-in-clojure/
;; Example: (bubble-sort (list 3 2 5 4 8 6 9 1))
(defn- bubble [ys x]
    (if-let [y (peek ys)]
      (if (> y x)
        (conj (pop ys) x y)
          (conj ys x))
      [x]))

(defn bubble-sort [xs]
    (let [ys (reduce bubble [] xs)]
      (if (= xs ys)
        xs
        (recur ys))))
