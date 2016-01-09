(benchmark test.smt
:logic QF_UFLIA
:extrafuns ((N Int Int) (P Int Int) (S Int Int) (C Int Int) (D Int Int) (i Int))
:formula (and
(>= (P 1) 0)
(>= (N 1) 0)
(>= (S 1) 0)
(>= (C 1) 0)
(>= (D 1) 0)
(<= (+ (* 700 (N 1)) (* 800 (P 1)) (* 1000 (S 1)) (* 1500 (C 1)) (* 100 (D 1))) 7800)
(not (and (> (P 1) 0) (> (C 1) 0)))
(<= (D 1) 2)
(>= (P 2) 0)
(>= (N 2) 0)
(>= (S 2) 0)
(>= (C 2) 0)
(>= (D 2) 0)
(<= (+ (* 700 (N 2)) (* 800 (P 2)) (* 1000 (S 2)) (* 1500 (C 2)) (* 100 (D 2))) 7800)
(not (and (> (P 2) 0) (> (C 2) 0)))
(<= (D 2) 2)
(>= (P 3) 0)
(>= (N 3) 0)
(>= (S 3) 0)
(>= (C 3) 0)
(>= (D 3) 0)
(<= (+ (* 700 (N 3)) (* 800 (P 3)) (* 1000 (S 3)) (* 1500 (C 3)) (* 100 (D 3))) 7800)
(not (and (> (P 3) 0) (> (C 3) 0)))
(<= (D 3) 2)
(>= (P 4) 0)
(>= (N 4) 0)
(>= (S 4) 0)
(>= (C 4) 0)
(>= (D 4) 0)
(<= (+ (* 700 (N 4)) (* 800 (P 4)) (* 1000 (S 4)) (* 1500 (C 4)) (* 100 (D 4))) 7800)
(not (and (> (P 4) 0) (> (C 4) 0)))
(<= (D 4) 2)
(>= (P 5) 0)
(>= (N 5) 0)
(>= (S 5) 0)
(>= (C 5) 0)
(>= (D 5) 0)
(<= (+ (* 700 (N 5)) (* 800 (P 5)) (* 1000 (S 5)) (* 1500 (C 5)) (* 100 (D 5))) 7800)
(not (and (> (P 5) 0) (> (C 5) 0)))
(<= (D 5) 2)
(>= (P 6) 0)
(>= (N 6) 0)
(>= (S 6) 0)
(>= (C 6) 0)
(>= (D 6) 0)
(<= (+ (* 700 (N 6)) (* 800 (P 6)) (* 1000 (S 6)) (* 1500 (C 6)) (* 100 (D 6))) 7800)
(not (and (> (P 6) 0) (> (C 6) 0)))
(<= (D 6) 2)
(= (+ (P 1) (P 2) (P 3) (P 4) (P 5) (P 6)) 25) 
(= (+ (N 1) (N 2) (N 3) (N 4) (N 5) (N 6)) 4) 
(= (+ (S 1) (S 2) (S 3) (S 4) (S 5) (S 6)) 8) 
(= (+ (C 1) (C 2) (C 3) (C 4) (C 5) (C 6)) 10)
(= (+ (D 1) (D 2) (D 3) (D 4) (D 5) (D 6)) 5) 
(= (S 3) 0)
(= (S 4) 0)
(= (S 5) 0)
(= (S 6) 0)
))
