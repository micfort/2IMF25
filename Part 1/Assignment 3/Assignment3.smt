(benchmark test.smt
:logic QF_UFLIA
:extrafuns ((S Int Int) (E Int Int) (MAX Int))
:formula (and
(<= MAX 36)
(<= (+ (S 1) 1) MAX)
(>= (S 1) 0)
(= (E 1) (+ (S 1) 1))
(<= (+ (S 2) 2) MAX)
(>= (S 2) 0)
(= (E 2) (+ (S 2) 2))
(<= (+ (S 3) 3) MAX)
(>= (S 3) 0)
(= (E 3) (+ (S 3) 3))
(<= (+ (S 4) 4) MAX)
(>= (S 4) 0)
(= (E 4) (+ (S 4) 4))
(<= (+ (S 5) 5) MAX)
(>= (S 5) 0)
(= (E 5) (+ (S 5) 5))
(<= (+ (S 6) 6) MAX)
(>= (S 6) 0)
(= (E 6) (+ (S 6) 6))
(<= (+ (S 7) 7) MAX)
(>= (S 7) 0)
(= (E 7) (+ (S 7) 7))
(<= (+ (S 8) 8) MAX)
(>= (S 8) 0)
(= (E 8) (+ (S 8) 8))
(<= (+ (S 9) 9) MAX)
(>= (S 9) 0)
(= (E 9) (+ (S 9) 9))
(<= (+ (S 10) 10) MAX)
(>= (S 10) 0)
(= (E 10) (+ (S 10) 10))
(<= (+ (S 11) 11) MAX)
(>= (S 11) 0)
(= (E 11) (+ (S 11) 11))
(<= (+ (S 12) 12) MAX)
(>= (S 12) 0)
(= (E 12) (+ (S 12) 12))
(>= (S 3) (+ (S 1) 1))
(>= (S 3) (+ (S 2) 2))
(>= (S 5) (+ (S 3) 3))
(>= (S 5) (+ (S 4) 4))
(>= (S 7) (+ (S 3) 3))
(>= (S 7) (+ (S 4) 4))
(>= (S 7) (+ (S 6) 6))
(>= (S 9) (+ (S 5) 5))
(>= (S 9) (+ (S 8) 8))
(>= (S 11) (+ (S 10) 10))
(>= (S 12) (+ (S 9) 9))
(>= (S 12) (+ (S 11) 11))
(not 
	(and 
		(>= (S 5) (S 7))
		(< (S 5) (+ (S 7) 7))
	)
)
(not 
	(and 
		(> (+ (S 5) 5) (S 7))
		(<= (+ (S 5) 5) (+ (S 7) 7))
	)
)
(not 
	(and 
		(>= (S 7) (S 5))
		(< (S 7) (+ (S 5) 5))
	)
)
(not 
	(and 
		(> (+ (S 7) 7) (S 5))
		(<= (+ (S 7) 7) (+ (S 5) 5))
	)
)
(not 
	(and 
		(>= (S 7) (S 10))
		(< (S 7) (+ (S 10) 10))
	)
)
(not 
	(and 
		(> (+ (S 7) 7) (S 10))
		(<= (+ (S 7) 7) (+ (S 10) 10))
	)
)
(not 
	(and 
		(>= (S 10) (S 7))
		(< (S 10) (+ (S 7) 7))
	)
)
(not 
	(and 
		(> (+ (S 10) 10) (S 7))
		(<= (+ (S 10) 10) (+ (S 7) 7))
	)
)
(not 
	(and 
		(>= (S 5) (S 10))
		(< (S 5) (+ (S 10) 10))
	)
)
(not 
	(and 
		(> (+ (S 5) 5) (S 10))
		(<= (+ (S 5) 5) (+ (S 10) 10))
	)
)
(not 
	(and 
		(>= (S 10) (S 5))
		(< (S 10) (+ (S 5) 5))
	)
)
(not 
	(and 
		(> (+ (S 10) 10) (S 5))
		(<= (+ (S 10) 10) (+ (S 5) 5))
	)
)
))
