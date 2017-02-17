;;;; Clojure examples of algorithms from Getting Started chapter of CLRS
;;;; Introduction to Algorithms.
;;;; Since the intention is that students can run these in the interactive
;;;; Clojure interpreter, rather than build JVM Clojure programs with them, for
;;;; now we are not worried about Clojure's module structure.
;;;; This code is from: 
;;;; https://github.com/kokatoo/clojure-algorithms/blob/master/src/clojure_algorithms/optimization.clj

(defn cut-rod-aux [prices, rod-len]
  (loop [results [0] paths [0] i 1]
    (if (> i rod-len)
      [results paths]
      (let [[i-max prev] (reduce (fn [acc j]
                                    (let [j-max (+ (nth prices j) (nth results (- i j)))]
                                      (if (or (nil? acc) (> j-max (first acc)))
                                        [j-max j]
                                        acc)))
                                  nil
                                  (range 1 (inc i)))]
        (recur (conj results i-max) (conj paths prev) (inc i))))))

(defn cut-rod [prices rod-len]
  (let [[results paths] (cut-rod-aux prices rod-len)]
    (loop [idx rod-len path []]
      (if (> idx 0)
        (recur (- idx (nth paths idx)) (conj path (nth paths idx)))
        [(nth results rod-len) path]))))

