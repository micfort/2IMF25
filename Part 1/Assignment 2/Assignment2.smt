(benchmark test.smt
:logic QF_UFLIA
:extrafuns ((SW Int) (SH Int) (PD Int) (CX Int Int) (CY Int Int) (CW Int Int) (CH Int Int) (PX Int Int) (PY Int Int) (PW Int Int) (PH Int Int))
:formula (and
(= SW 29)
(= SH 22)
(= PD 17)
(or
	(>= (+ (PX 1) (/ (PW 1) 2)) (+ (+ (PX 0) (/ (PW 0) 2)) PD))
	(>= (+ (PY 1) (/ (PH 1) 2)) (+ (+ (PY 0) (/ (PH 0) 2)) PD))
	(<= (+ (PX 1) (/ (PW 1) 2)) (- (+ (PX 0) (/ (PW 0) 2)) PD))
	(<= (+ (PY 1) (/ (PH 1) 2)) (- (+ (PY 0) (/ (PH 0) 2)) PD))
)
(or
	(>= (+ (PX 2) (/ (PW 2) 2)) (+ (+ (PX 0) (/ (PW 0) 2)) PD))
	(>= (+ (PY 2) (/ (PH 2) 2)) (+ (+ (PY 0) (/ (PH 0) 2)) PD))
	(<= (+ (PX 2) (/ (PW 2) 2)) (- (+ (PX 0) (/ (PW 0) 2)) PD))
	(<= (+ (PY 2) (/ (PH 2) 2)) (- (+ (PY 0) (/ (PH 0) 2)) PD))
)
(<= (+ (PX 0) (PW 0)) SW)
(<= (+ (PY 0) (PH 0)) SH)
(>= (PX 0) 0)
(>= (PY 0) 0)
(or
	(and
		(= (PW 0) 4)
		(= (PH 0) 2)
	)
	(and
		(= (PW 0) 2)
		(= (PH 0) 4)
	)
)
(or
	(>= (+ (PX 2) (/ (PW 2) 2)) (+ (+ (PX 1) (/ (PW 1) 2)) PD))
	(>= (+ (PY 2) (/ (PH 2) 2)) (+ (+ (PY 1) (/ (PH 1) 2)) PD))
	(<= (+ (PX 2) (/ (PW 2) 2)) (- (+ (PX 1) (/ (PW 1) 2)) PD))
	(<= (+ (PY 2) (/ (PH 2) 2)) (- (+ (PY 1) (/ (PH 1) 2)) PD))
)
(<= (+ (PX 1) (PW 1)) SW)
(<= (+ (PY 1) (PH 1)) SH)
(>= (PX 1) 0)
(>= (PY 1) 0)
(or
	(and
		(= (PW 1) 4)
		(= (PH 1) 2)
	)
	(and
		(= (PW 1) 2)
		(= (PH 1) 4)
	)
)
(<= (+ (PX 2) (PW 2)) SW)
(<= (+ (PY 2) (PH 2)) SH)
(>= (PX 2) 0)
(>= (PY 2) 0)
(or
	(and
		(= (PW 2) 4)
		(= (PH 2) 2)
	)
	(and
		(= (PW 2) 2)
		(= (PH 2) 4)
	)
)
(or
	(or
		(and
			(= (PX 0) (+ (CX 0) (CW 0)))
			(> (PY 0) (- (CY 0) (PH 0)))
			(< (PY 0) (+ (CY 0) (CH 0)))
		)
		(and
			(= (PY 0) (+ (CY 0) (CH 0)))
			(> (PX 0) (- (CX 0) (PW 0)))
			(< (PX 0) (+ (CX 0) (CW 0)))
		)
		(and
			(= (PX 0) (- (CX 0) (PW 0)))
			(> (PY 0) (- (CY 0) (PH 0)))
			(< (PY 0) (+ (CY 0) (CH 0)))
		)
		(and
			(= (PY 0) (- (CY 0) (PH 0)))
			(> (PX 0) (- (CX 0) (PW 0)))
			(< (PX 0) (+ (CX 0) (CW 0)))
		)
	)
	(or
		(and
			(= (PX 1) (+ (CX 0) (CW 0)))
			(> (PY 1) (- (CY 0) (PH 1)))
			(< (PY 1) (+ (CY 0) (CH 0)))
		)
		(and
			(= (PY 1) (+ (CY 0) (CH 0)))
			(> (PX 1) (- (CX 0) (PW 1)))
			(< (PX 1) (+ (CX 0) (CW 0)))
		)
		(and
			(= (PX 1) (- (CX 0) (PW 1)))
			(> (PY 1) (- (CY 0) (PH 1)))
			(< (PY 1) (+ (CY 0) (CH 0)))
		)
		(and
			(= (PY 1) (- (CY 0) (PH 1)))
			(> (PX 1) (- (CX 0) (PW 1)))
			(< (PX 1) (+ (CX 0) (CW 0)))
		)
	)
	(or
		(and
			(= (PX 2) (+ (CX 0) (CW 0)))
			(> (PY 2) (- (CY 0) (PH 2)))
			(< (PY 2) (+ (CY 0) (CH 0)))
		)
		(and
			(= (PY 2) (+ (CY 0) (CH 0)))
			(> (PX 2) (- (CX 0) (PW 2)))
			(< (PX 2) (+ (CX 0) (CW 0)))
		)
		(and
			(= (PX 2) (- (CX 0) (PW 2)))
			(> (PY 2) (- (CY 0) (PH 2)))
			(< (PY 2) (+ (CY 0) (CH 0)))
		)
		(and
			(= (PY 2) (- (CY 0) (PH 2)))
			(> (PX 2) (- (CX 0) (PW 2)))
			(< (PX 2) (+ (CX 0) (CW 0)))
		)
	)
)
(or
	(>= (CX 1) (+ (CX 0) (CW 0)))
	(>= (CY 1) (+ (CY 0) (CH 0)))
	(<= (CX 1) (- (CX 0) (CW 1)))
	(<= (CY 1) (- (CY 0) (CH 1)))
)
(or
	(>= (CX 2) (+ (CX 0) (CW 0)))
	(>= (CY 2) (+ (CY 0) (CH 0)))
	(<= (CX 2) (- (CX 0) (CW 2)))
	(<= (CY 2) (- (CY 0) (CH 2)))
)
(or
	(>= (CX 3) (+ (CX 0) (CW 0)))
	(>= (CY 3) (+ (CY 0) (CH 0)))
	(<= (CX 3) (- (CX 0) (CW 3)))
	(<= (CY 3) (- (CY 0) (CH 3)))
)
(or
	(>= (CX 4) (+ (CX 0) (CW 0)))
	(>= (CY 4) (+ (CY 0) (CH 0)))
	(<= (CX 4) (- (CX 0) (CW 4)))
	(<= (CY 4) (- (CY 0) (CH 4)))
)
(or
	(>= (CX 5) (+ (CX 0) (CW 0)))
	(>= (CY 5) (+ (CY 0) (CH 0)))
	(<= (CX 5) (- (CX 0) (CW 5)))
	(<= (CY 5) (- (CY 0) (CH 5)))
)
(or
	(>= (CX 6) (+ (CX 0) (CW 0)))
	(>= (CY 6) (+ (CY 0) (CH 0)))
	(<= (CX 6) (- (CX 0) (CW 6)))
	(<= (CY 6) (- (CY 0) (CH 6)))
)
(or
	(>= (CX 7) (+ (CX 0) (CW 0)))
	(>= (CY 7) (+ (CY 0) (CH 0)))
	(<= (CX 7) (- (CX 0) (CW 7)))
	(<= (CY 7) (- (CY 0) (CH 7)))
)
(or
	(>= (PX 0) (+ (CX 0) (CW 0)))
	(>= (PY 0) (+ (CY 0) (CH 0)))
	(<= (PX 0) (- (CX 0) (PW 0)))
	(<= (PY 0) (- (CY 0) (PH 0)))
)
(or
	(>= (PX 1) (+ (CX 0) (CW 0)))
	(>= (PY 1) (+ (CY 0) (CH 0)))
	(<= (PX 1) (- (CX 0) (PW 1)))
	(<= (PY 1) (- (CY 0) (PH 1)))
)
(or
	(>= (PX 2) (+ (CX 0) (CW 0)))
	(>= (PY 2) (+ (CY 0) (CH 0)))
	(<= (PX 2) (- (CX 0) (PW 2)))
	(<= (PY 2) (- (CY 0) (PH 2)))
)
(<= (+ (CX 0) (CW 0)) SW)
(<= (+ (CY 0) (CH 0)) SH)
(>= (CX 0) 0)
(>= (CY 0) 0)
(or
	(and
		(= (CW 0) 9)
		(= (CH 0) 7)
	)
	(and
		(= (CW 0) 7)
		(= (CH 0) 9)
	)
)
(or
	(or
		(and
			(= (PX 0) (+ (CX 1) (CW 1)))
			(> (PY 0) (- (CY 1) (PH 0)))
			(< (PY 0) (+ (CY 1) (CH 1)))
		)
		(and
			(= (PY 0) (+ (CY 1) (CH 1)))
			(> (PX 0) (- (CX 1) (PW 0)))
			(< (PX 0) (+ (CX 1) (CW 1)))
		)
		(and
			(= (PX 0) (- (CX 1) (PW 0)))
			(> (PY 0) (- (CY 1) (PH 0)))
			(< (PY 0) (+ (CY 1) (CH 1)))
		)
		(and
			(= (PY 0) (- (CY 1) (PH 0)))
			(> (PX 0) (- (CX 1) (PW 0)))
			(< (PX 0) (+ (CX 1) (CW 1)))
		)
	)
	(or
		(and
			(= (PX 1) (+ (CX 1) (CW 1)))
			(> (PY 1) (- (CY 1) (PH 1)))
			(< (PY 1) (+ (CY 1) (CH 1)))
		)
		(and
			(= (PY 1) (+ (CY 1) (CH 1)))
			(> (PX 1) (- (CX 1) (PW 1)))
			(< (PX 1) (+ (CX 1) (CW 1)))
		)
		(and
			(= (PX 1) (- (CX 1) (PW 1)))
			(> (PY 1) (- (CY 1) (PH 1)))
			(< (PY 1) (+ (CY 1) (CH 1)))
		)
		(and
			(= (PY 1) (- (CY 1) (PH 1)))
			(> (PX 1) (- (CX 1) (PW 1)))
			(< (PX 1) (+ (CX 1) (CW 1)))
		)
	)
	(or
		(and
			(= (PX 2) (+ (CX 1) (CW 1)))
			(> (PY 2) (- (CY 1) (PH 2)))
			(< (PY 2) (+ (CY 1) (CH 1)))
		)
		(and
			(= (PY 2) (+ (CY 1) (CH 1)))
			(> (PX 2) (- (CX 1) (PW 2)))
			(< (PX 2) (+ (CX 1) (CW 1)))
		)
		(and
			(= (PX 2) (- (CX 1) (PW 2)))
			(> (PY 2) (- (CY 1) (PH 2)))
			(< (PY 2) (+ (CY 1) (CH 1)))
		)
		(and
			(= (PY 2) (- (CY 1) (PH 2)))
			(> (PX 2) (- (CX 1) (PW 2)))
			(< (PX 2) (+ (CX 1) (CW 1)))
		)
	)
)
(or
	(>= (CX 2) (+ (CX 1) (CW 1)))
	(>= (CY 2) (+ (CY 1) (CH 1)))
	(<= (CX 2) (- (CX 1) (CW 2)))
	(<= (CY 2) (- (CY 1) (CH 2)))
)
(or
	(>= (CX 3) (+ (CX 1) (CW 1)))
	(>= (CY 3) (+ (CY 1) (CH 1)))
	(<= (CX 3) (- (CX 1) (CW 3)))
	(<= (CY 3) (- (CY 1) (CH 3)))
)
(or
	(>= (CX 4) (+ (CX 1) (CW 1)))
	(>= (CY 4) (+ (CY 1) (CH 1)))
	(<= (CX 4) (- (CX 1) (CW 4)))
	(<= (CY 4) (- (CY 1) (CH 4)))
)
(or
	(>= (CX 5) (+ (CX 1) (CW 1)))
	(>= (CY 5) (+ (CY 1) (CH 1)))
	(<= (CX 5) (- (CX 1) (CW 5)))
	(<= (CY 5) (- (CY 1) (CH 5)))
)
(or
	(>= (CX 6) (+ (CX 1) (CW 1)))
	(>= (CY 6) (+ (CY 1) (CH 1)))
	(<= (CX 6) (- (CX 1) (CW 6)))
	(<= (CY 6) (- (CY 1) (CH 6)))
)
(or
	(>= (CX 7) (+ (CX 1) (CW 1)))
	(>= (CY 7) (+ (CY 1) (CH 1)))
	(<= (CX 7) (- (CX 1) (CW 7)))
	(<= (CY 7) (- (CY 1) (CH 7)))
)
(or
	(>= (PX 0) (+ (CX 1) (CW 1)))
	(>= (PY 0) (+ (CY 1) (CH 1)))
	(<= (PX 0) (- (CX 1) (PW 0)))
	(<= (PY 0) (- (CY 1) (PH 0)))
)
(or
	(>= (PX 1) (+ (CX 1) (CW 1)))
	(>= (PY 1) (+ (CY 1) (CH 1)))
	(<= (PX 1) (- (CX 1) (PW 1)))
	(<= (PY 1) (- (CY 1) (PH 1)))
)
(or
	(>= (PX 2) (+ (CX 1) (CW 1)))
	(>= (PY 2) (+ (CY 1) (CH 1)))
	(<= (PX 2) (- (CX 1) (PW 2)))
	(<= (PY 2) (- (CY 1) (PH 2)))
)
(<= (+ (CX 1) (CW 1)) SW)
(<= (+ (CY 1) (CH 1)) SH)
(>= (CX 1) 0)
(>= (CY 1) 0)
(or
	(and
		(= (CW 1) 12)
		(= (CH 1) 6)
	)
	(and
		(= (CW 1) 6)
		(= (CH 1) 12)
	)
)
(or
	(or
		(and
			(= (PX 0) (+ (CX 2) (CW 2)))
			(> (PY 0) (- (CY 2) (PH 0)))
			(< (PY 0) (+ (CY 2) (CH 2)))
		)
		(and
			(= (PY 0) (+ (CY 2) (CH 2)))
			(> (PX 0) (- (CX 2) (PW 0)))
			(< (PX 0) (+ (CX 2) (CW 2)))
		)
		(and
			(= (PX 0) (- (CX 2) (PW 0)))
			(> (PY 0) (- (CY 2) (PH 0)))
			(< (PY 0) (+ (CY 2) (CH 2)))
		)
		(and
			(= (PY 0) (- (CY 2) (PH 0)))
			(> (PX 0) (- (CX 2) (PW 0)))
			(< (PX 0) (+ (CX 2) (CW 2)))
		)
	)
	(or
		(and
			(= (PX 1) (+ (CX 2) (CW 2)))
			(> (PY 1) (- (CY 2) (PH 1)))
			(< (PY 1) (+ (CY 2) (CH 2)))
		)
		(and
			(= (PY 1) (+ (CY 2) (CH 2)))
			(> (PX 1) (- (CX 2) (PW 1)))
			(< (PX 1) (+ (CX 2) (CW 2)))
		)
		(and
			(= (PX 1) (- (CX 2) (PW 1)))
			(> (PY 1) (- (CY 2) (PH 1)))
			(< (PY 1) (+ (CY 2) (CH 2)))
		)
		(and
			(= (PY 1) (- (CY 2) (PH 1)))
			(> (PX 1) (- (CX 2) (PW 1)))
			(< (PX 1) (+ (CX 2) (CW 2)))
		)
	)
	(or
		(and
			(= (PX 2) (+ (CX 2) (CW 2)))
			(> (PY 2) (- (CY 2) (PH 2)))
			(< (PY 2) (+ (CY 2) (CH 2)))
		)
		(and
			(= (PY 2) (+ (CY 2) (CH 2)))
			(> (PX 2) (- (CX 2) (PW 2)))
			(< (PX 2) (+ (CX 2) (CW 2)))
		)
		(and
			(= (PX 2) (- (CX 2) (PW 2)))
			(> (PY 2) (- (CY 2) (PH 2)))
			(< (PY 2) (+ (CY 2) (CH 2)))
		)
		(and
			(= (PY 2) (- (CY 2) (PH 2)))
			(> (PX 2) (- (CX 2) (PW 2)))
			(< (PX 2) (+ (CX 2) (CW 2)))
		)
	)
)
(or
	(>= (CX 3) (+ (CX 2) (CW 2)))
	(>= (CY 3) (+ (CY 2) (CH 2)))
	(<= (CX 3) (- (CX 2) (CW 3)))
	(<= (CY 3) (- (CY 2) (CH 3)))
)
(or
	(>= (CX 4) (+ (CX 2) (CW 2)))
	(>= (CY 4) (+ (CY 2) (CH 2)))
	(<= (CX 4) (- (CX 2) (CW 4)))
	(<= (CY 4) (- (CY 2) (CH 4)))
)
(or
	(>= (CX 5) (+ (CX 2) (CW 2)))
	(>= (CY 5) (+ (CY 2) (CH 2)))
	(<= (CX 5) (- (CX 2) (CW 5)))
	(<= (CY 5) (- (CY 2) (CH 5)))
)
(or
	(>= (CX 6) (+ (CX 2) (CW 2)))
	(>= (CY 6) (+ (CY 2) (CH 2)))
	(<= (CX 6) (- (CX 2) (CW 6)))
	(<= (CY 6) (- (CY 2) (CH 6)))
)
(or
	(>= (CX 7) (+ (CX 2) (CW 2)))
	(>= (CY 7) (+ (CY 2) (CH 2)))
	(<= (CX 7) (- (CX 2) (CW 7)))
	(<= (CY 7) (- (CY 2) (CH 7)))
)
(or
	(>= (PX 0) (+ (CX 2) (CW 2)))
	(>= (PY 0) (+ (CY 2) (CH 2)))
	(<= (PX 0) (- (CX 2) (PW 0)))
	(<= (PY 0) (- (CY 2) (PH 0)))
)
(or
	(>= (PX 1) (+ (CX 2) (CW 2)))
	(>= (PY 1) (+ (CY 2) (CH 2)))
	(<= (PX 1) (- (CX 2) (PW 1)))
	(<= (PY 1) (- (CY 2) (PH 1)))
)
(or
	(>= (PX 2) (+ (CX 2) (CW 2)))
	(>= (PY 2) (+ (CY 2) (CH 2)))
	(<= (PX 2) (- (CX 2) (PW 2)))
	(<= (PY 2) (- (CY 2) (PH 2)))
)
(<= (+ (CX 2) (CW 2)) SW)
(<= (+ (CY 2) (CH 2)) SH)
(>= (CX 2) 0)
(>= (CY 2) 0)
(or
	(and
		(= (CW 2) 10)
		(= (CH 2) 7)
	)
	(and
		(= (CW 2) 7)
		(= (CH 2) 10)
	)
)
(or
	(or
		(and
			(= (PX 0) (+ (CX 3) (CW 3)))
			(> (PY 0) (- (CY 3) (PH 0)))
			(< (PY 0) (+ (CY 3) (CH 3)))
		)
		(and
			(= (PY 0) (+ (CY 3) (CH 3)))
			(> (PX 0) (- (CX 3) (PW 0)))
			(< (PX 0) (+ (CX 3) (CW 3)))
		)
		(and
			(= (PX 0) (- (CX 3) (PW 0)))
			(> (PY 0) (- (CY 3) (PH 0)))
			(< (PY 0) (+ (CY 3) (CH 3)))
		)
		(and
			(= (PY 0) (- (CY 3) (PH 0)))
			(> (PX 0) (- (CX 3) (PW 0)))
			(< (PX 0) (+ (CX 3) (CW 3)))
		)
	)
	(or
		(and
			(= (PX 1) (+ (CX 3) (CW 3)))
			(> (PY 1) (- (CY 3) (PH 1)))
			(< (PY 1) (+ (CY 3) (CH 3)))
		)
		(and
			(= (PY 1) (+ (CY 3) (CH 3)))
			(> (PX 1) (- (CX 3) (PW 1)))
			(< (PX 1) (+ (CX 3) (CW 3)))
		)
		(and
			(= (PX 1) (- (CX 3) (PW 1)))
			(> (PY 1) (- (CY 3) (PH 1)))
			(< (PY 1) (+ (CY 3) (CH 3)))
		)
		(and
			(= (PY 1) (- (CY 3) (PH 1)))
			(> (PX 1) (- (CX 3) (PW 1)))
			(< (PX 1) (+ (CX 3) (CW 3)))
		)
	)
	(or
		(and
			(= (PX 2) (+ (CX 3) (CW 3)))
			(> (PY 2) (- (CY 3) (PH 2)))
			(< (PY 2) (+ (CY 3) (CH 3)))
		)
		(and
			(= (PY 2) (+ (CY 3) (CH 3)))
			(> (PX 2) (- (CX 3) (PW 2)))
			(< (PX 2) (+ (CX 3) (CW 3)))
		)
		(and
			(= (PX 2) (- (CX 3) (PW 2)))
			(> (PY 2) (- (CY 3) (PH 2)))
			(< (PY 2) (+ (CY 3) (CH 3)))
		)
		(and
			(= (PY 2) (- (CY 3) (PH 2)))
			(> (PX 2) (- (CX 3) (PW 2)))
			(< (PX 2) (+ (CX 3) (CW 3)))
		)
	)
)
(or
	(>= (CX 4) (+ (CX 3) (CW 3)))
	(>= (CY 4) (+ (CY 3) (CH 3)))
	(<= (CX 4) (- (CX 3) (CW 4)))
	(<= (CY 4) (- (CY 3) (CH 4)))
)
(or
	(>= (CX 5) (+ (CX 3) (CW 3)))
	(>= (CY 5) (+ (CY 3) (CH 3)))
	(<= (CX 5) (- (CX 3) (CW 5)))
	(<= (CY 5) (- (CY 3) (CH 5)))
)
(or
	(>= (CX 6) (+ (CX 3) (CW 3)))
	(>= (CY 6) (+ (CY 3) (CH 3)))
	(<= (CX 6) (- (CX 3) (CW 6)))
	(<= (CY 6) (- (CY 3) (CH 6)))
)
(or
	(>= (CX 7) (+ (CX 3) (CW 3)))
	(>= (CY 7) (+ (CY 3) (CH 3)))
	(<= (CX 7) (- (CX 3) (CW 7)))
	(<= (CY 7) (- (CY 3) (CH 7)))
)
(or
	(>= (PX 0) (+ (CX 3) (CW 3)))
	(>= (PY 0) (+ (CY 3) (CH 3)))
	(<= (PX 0) (- (CX 3) (PW 0)))
	(<= (PY 0) (- (CY 3) (PH 0)))
)
(or
	(>= (PX 1) (+ (CX 3) (CW 3)))
	(>= (PY 1) (+ (CY 3) (CH 3)))
	(<= (PX 1) (- (CX 3) (PW 1)))
	(<= (PY 1) (- (CY 3) (PH 1)))
)
(or
	(>= (PX 2) (+ (CX 3) (CW 3)))
	(>= (PY 2) (+ (CY 3) (CH 3)))
	(<= (PX 2) (- (CX 3) (PW 2)))
	(<= (PY 2) (- (CY 3) (PH 2)))
)
(<= (+ (CX 3) (CW 3)) SW)
(<= (+ (CY 3) (CH 3)) SH)
(>= (CX 3) 0)
(>= (CY 3) 0)
(or
	(and
		(= (CW 3) 18)
		(= (CH 3) 5)
	)
	(and
		(= (CW 3) 5)
		(= (CH 3) 18)
	)
)
(or
	(or
		(and
			(= (PX 0) (+ (CX 4) (CW 4)))
			(> (PY 0) (- (CY 4) (PH 0)))
			(< (PY 0) (+ (CY 4) (CH 4)))
		)
		(and
			(= (PY 0) (+ (CY 4) (CH 4)))
			(> (PX 0) (- (CX 4) (PW 0)))
			(< (PX 0) (+ (CX 4) (CW 4)))
		)
		(and
			(= (PX 0) (- (CX 4) (PW 0)))
			(> (PY 0) (- (CY 4) (PH 0)))
			(< (PY 0) (+ (CY 4) (CH 4)))
		)
		(and
			(= (PY 0) (- (CY 4) (PH 0)))
			(> (PX 0) (- (CX 4) (PW 0)))
			(< (PX 0) (+ (CX 4) (CW 4)))
		)
	)
	(or
		(and
			(= (PX 1) (+ (CX 4) (CW 4)))
			(> (PY 1) (- (CY 4) (PH 1)))
			(< (PY 1) (+ (CY 4) (CH 4)))
		)
		(and
			(= (PY 1) (+ (CY 4) (CH 4)))
			(> (PX 1) (- (CX 4) (PW 1)))
			(< (PX 1) (+ (CX 4) (CW 4)))
		)
		(and
			(= (PX 1) (- (CX 4) (PW 1)))
			(> (PY 1) (- (CY 4) (PH 1)))
			(< (PY 1) (+ (CY 4) (CH 4)))
		)
		(and
			(= (PY 1) (- (CY 4) (PH 1)))
			(> (PX 1) (- (CX 4) (PW 1)))
			(< (PX 1) (+ (CX 4) (CW 4)))
		)
	)
	(or
		(and
			(= (PX 2) (+ (CX 4) (CW 4)))
			(> (PY 2) (- (CY 4) (PH 2)))
			(< (PY 2) (+ (CY 4) (CH 4)))
		)
		(and
			(= (PY 2) (+ (CY 4) (CH 4)))
			(> (PX 2) (- (CX 4) (PW 2)))
			(< (PX 2) (+ (CX 4) (CW 4)))
		)
		(and
			(= (PX 2) (- (CX 4) (PW 2)))
			(> (PY 2) (- (CY 4) (PH 2)))
			(< (PY 2) (+ (CY 4) (CH 4)))
		)
		(and
			(= (PY 2) (- (CY 4) (PH 2)))
			(> (PX 2) (- (CX 4) (PW 2)))
			(< (PX 2) (+ (CX 4) (CW 4)))
		)
	)
)
(or
	(>= (CX 5) (+ (CX 4) (CW 4)))
	(>= (CY 5) (+ (CY 4) (CH 4)))
	(<= (CX 5) (- (CX 4) (CW 5)))
	(<= (CY 5) (- (CY 4) (CH 5)))
)
(or
	(>= (CX 6) (+ (CX 4) (CW 4)))
	(>= (CY 6) (+ (CY 4) (CH 4)))
	(<= (CX 6) (- (CX 4) (CW 6)))
	(<= (CY 6) (- (CY 4) (CH 6)))
)
(or
	(>= (CX 7) (+ (CX 4) (CW 4)))
	(>= (CY 7) (+ (CY 4) (CH 4)))
	(<= (CX 7) (- (CX 4) (CW 7)))
	(<= (CY 7) (- (CY 4) (CH 7)))
)
(or
	(>= (PX 0) (+ (CX 4) (CW 4)))
	(>= (PY 0) (+ (CY 4) (CH 4)))
	(<= (PX 0) (- (CX 4) (PW 0)))
	(<= (PY 0) (- (CY 4) (PH 0)))
)
(or
	(>= (PX 1) (+ (CX 4) (CW 4)))
	(>= (PY 1) (+ (CY 4) (CH 4)))
	(<= (PX 1) (- (CX 4) (PW 1)))
	(<= (PY 1) (- (CY 4) (PH 1)))
)
(or
	(>= (PX 2) (+ (CX 4) (CW 4)))
	(>= (PY 2) (+ (CY 4) (CH 4)))
	(<= (PX 2) (- (CX 4) (PW 2)))
	(<= (PY 2) (- (CY 4) (PH 2)))
)
(<= (+ (CX 4) (CW 4)) SW)
(<= (+ (CY 4) (CH 4)) SH)
(>= (CX 4) 0)
(>= (CY 4) 0)
(or
	(and
		(= (CW 4) 20)
		(= (CH 4) 4)
	)
	(and
		(= (CW 4) 4)
		(= (CH 4) 20)
	)
)
(or
	(or
		(and
			(= (PX 0) (+ (CX 5) (CW 5)))
			(> (PY 0) (- (CY 5) (PH 0)))
			(< (PY 0) (+ (CY 5) (CH 5)))
		)
		(and
			(= (PY 0) (+ (CY 5) (CH 5)))
			(> (PX 0) (- (CX 5) (PW 0)))
			(< (PX 0) (+ (CX 5) (CW 5)))
		)
		(and
			(= (PX 0) (- (CX 5) (PW 0)))
			(> (PY 0) (- (CY 5) (PH 0)))
			(< (PY 0) (+ (CY 5) (CH 5)))
		)
		(and
			(= (PY 0) (- (CY 5) (PH 0)))
			(> (PX 0) (- (CX 5) (PW 0)))
			(< (PX 0) (+ (CX 5) (CW 5)))
		)
	)
	(or
		(and
			(= (PX 1) (+ (CX 5) (CW 5)))
			(> (PY 1) (- (CY 5) (PH 1)))
			(< (PY 1) (+ (CY 5) (CH 5)))
		)
		(and
			(= (PY 1) (+ (CY 5) (CH 5)))
			(> (PX 1) (- (CX 5) (PW 1)))
			(< (PX 1) (+ (CX 5) (CW 5)))
		)
		(and
			(= (PX 1) (- (CX 5) (PW 1)))
			(> (PY 1) (- (CY 5) (PH 1)))
			(< (PY 1) (+ (CY 5) (CH 5)))
		)
		(and
			(= (PY 1) (- (CY 5) (PH 1)))
			(> (PX 1) (- (CX 5) (PW 1)))
			(< (PX 1) (+ (CX 5) (CW 5)))
		)
	)
	(or
		(and
			(= (PX 2) (+ (CX 5) (CW 5)))
			(> (PY 2) (- (CY 5) (PH 2)))
			(< (PY 2) (+ (CY 5) (CH 5)))
		)
		(and
			(= (PY 2) (+ (CY 5) (CH 5)))
			(> (PX 2) (- (CX 5) (PW 2)))
			(< (PX 2) (+ (CX 5) (CW 5)))
		)
		(and
			(= (PX 2) (- (CX 5) (PW 2)))
			(> (PY 2) (- (CY 5) (PH 2)))
			(< (PY 2) (+ (CY 5) (CH 5)))
		)
		(and
			(= (PY 2) (- (CY 5) (PH 2)))
			(> (PX 2) (- (CX 5) (PW 2)))
			(< (PX 2) (+ (CX 5) (CW 5)))
		)
	)
)
(or
	(>= (CX 6) (+ (CX 5) (CW 5)))
	(>= (CY 6) (+ (CY 5) (CH 5)))
	(<= (CX 6) (- (CX 5) (CW 6)))
	(<= (CY 6) (- (CY 5) (CH 6)))
)
(or
	(>= (CX 7) (+ (CX 5) (CW 5)))
	(>= (CY 7) (+ (CY 5) (CH 5)))
	(<= (CX 7) (- (CX 5) (CW 7)))
	(<= (CY 7) (- (CY 5) (CH 7)))
)
(or
	(>= (PX 0) (+ (CX 5) (CW 5)))
	(>= (PY 0) (+ (CY 5) (CH 5)))
	(<= (PX 0) (- (CX 5) (PW 0)))
	(<= (PY 0) (- (CY 5) (PH 0)))
)
(or
	(>= (PX 1) (+ (CX 5) (CW 5)))
	(>= (PY 1) (+ (CY 5) (CH 5)))
	(<= (PX 1) (- (CX 5) (PW 1)))
	(<= (PY 1) (- (CY 5) (PH 1)))
)
(or
	(>= (PX 2) (+ (CX 5) (CW 5)))
	(>= (PY 2) (+ (CY 5) (CH 5)))
	(<= (PX 2) (- (CX 5) (PW 2)))
	(<= (PY 2) (- (CY 5) (PH 2)))
)
(<= (+ (CX 5) (CW 5)) SW)
(<= (+ (CY 5) (CH 5)) SH)
(>= (CX 5) 0)
(>= (CY 5) 0)
(or
	(and
		(= (CW 5) 10)
		(= (CH 5) 6)
	)
	(and
		(= (CW 5) 6)
		(= (CH 5) 10)
	)
)
(or
	(or
		(and
			(= (PX 0) (+ (CX 6) (CW 6)))
			(> (PY 0) (- (CY 6) (PH 0)))
			(< (PY 0) (+ (CY 6) (CH 6)))
		)
		(and
			(= (PY 0) (+ (CY 6) (CH 6)))
			(> (PX 0) (- (CX 6) (PW 0)))
			(< (PX 0) (+ (CX 6) (CW 6)))
		)
		(and
			(= (PX 0) (- (CX 6) (PW 0)))
			(> (PY 0) (- (CY 6) (PH 0)))
			(< (PY 0) (+ (CY 6) (CH 6)))
		)
		(and
			(= (PY 0) (- (CY 6) (PH 0)))
			(> (PX 0) (- (CX 6) (PW 0)))
			(< (PX 0) (+ (CX 6) (CW 6)))
		)
	)
	(or
		(and
			(= (PX 1) (+ (CX 6) (CW 6)))
			(> (PY 1) (- (CY 6) (PH 1)))
			(< (PY 1) (+ (CY 6) (CH 6)))
		)
		(and
			(= (PY 1) (+ (CY 6) (CH 6)))
			(> (PX 1) (- (CX 6) (PW 1)))
			(< (PX 1) (+ (CX 6) (CW 6)))
		)
		(and
			(= (PX 1) (- (CX 6) (PW 1)))
			(> (PY 1) (- (CY 6) (PH 1)))
			(< (PY 1) (+ (CY 6) (CH 6)))
		)
		(and
			(= (PY 1) (- (CY 6) (PH 1)))
			(> (PX 1) (- (CX 6) (PW 1)))
			(< (PX 1) (+ (CX 6) (CW 6)))
		)
	)
	(or
		(and
			(= (PX 2) (+ (CX 6) (CW 6)))
			(> (PY 2) (- (CY 6) (PH 2)))
			(< (PY 2) (+ (CY 6) (CH 6)))
		)
		(and
			(= (PY 2) (+ (CY 6) (CH 6)))
			(> (PX 2) (- (CX 6) (PW 2)))
			(< (PX 2) (+ (CX 6) (CW 6)))
		)
		(and
			(= (PX 2) (- (CX 6) (PW 2)))
			(> (PY 2) (- (CY 6) (PH 2)))
			(< (PY 2) (+ (CY 6) (CH 6)))
		)
		(and
			(= (PY 2) (- (CY 6) (PH 2)))
			(> (PX 2) (- (CX 6) (PW 2)))
			(< (PX 2) (+ (CX 6) (CW 6)))
		)
	)
)
(or
	(>= (CX 7) (+ (CX 6) (CW 6)))
	(>= (CY 7) (+ (CY 6) (CH 6)))
	(<= (CX 7) (- (CX 6) (CW 7)))
	(<= (CY 7) (- (CY 6) (CH 7)))
)
(or
	(>= (PX 0) (+ (CX 6) (CW 6)))
	(>= (PY 0) (+ (CY 6) (CH 6)))
	(<= (PX 0) (- (CX 6) (PW 0)))
	(<= (PY 0) (- (CY 6) (PH 0)))
)
(or
	(>= (PX 1) (+ (CX 6) (CW 6)))
	(>= (PY 1) (+ (CY 6) (CH 6)))
	(<= (PX 1) (- (CX 6) (PW 1)))
	(<= (PY 1) (- (CY 6) (PH 1)))
)
(or
	(>= (PX 2) (+ (CX 6) (CW 6)))
	(>= (PY 2) (+ (CY 6) (CH 6)))
	(<= (PX 2) (- (CX 6) (PW 2)))
	(<= (PY 2) (- (CY 6) (PH 2)))
)
(<= (+ (CX 6) (CW 6)) SW)
(<= (+ (CY 6) (CH 6)) SH)
(>= (CX 6) 0)
(>= (CY 6) 0)
(or
	(and
		(= (CW 6) 8)
		(= (CH 6) 6)
	)
	(and
		(= (CW 6) 6)
		(= (CH 6) 8)
	)
)
(or
	(or
		(and
			(= (PX 0) (+ (CX 7) (CW 7)))
			(> (PY 0) (- (CY 7) (PH 0)))
			(< (PY 0) (+ (CY 7) (CH 7)))
		)
		(and
			(= (PY 0) (+ (CY 7) (CH 7)))
			(> (PX 0) (- (CX 7) (PW 0)))
			(< (PX 0) (+ (CX 7) (CW 7)))
		)
		(and
			(= (PX 0) (- (CX 7) (PW 0)))
			(> (PY 0) (- (CY 7) (PH 0)))
			(< (PY 0) (+ (CY 7) (CH 7)))
		)
		(and
			(= (PY 0) (- (CY 7) (PH 0)))
			(> (PX 0) (- (CX 7) (PW 0)))
			(< (PX 0) (+ (CX 7) (CW 7)))
		)
	)
	(or
		(and
			(= (PX 1) (+ (CX 7) (CW 7)))
			(> (PY 1) (- (CY 7) (PH 1)))
			(< (PY 1) (+ (CY 7) (CH 7)))
		)
		(and
			(= (PY 1) (+ (CY 7) (CH 7)))
			(> (PX 1) (- (CX 7) (PW 1)))
			(< (PX 1) (+ (CX 7) (CW 7)))
		)
		(and
			(= (PX 1) (- (CX 7) (PW 1)))
			(> (PY 1) (- (CY 7) (PH 1)))
			(< (PY 1) (+ (CY 7) (CH 7)))
		)
		(and
			(= (PY 1) (- (CY 7) (PH 1)))
			(> (PX 1) (- (CX 7) (PW 1)))
			(< (PX 1) (+ (CX 7) (CW 7)))
		)
	)
	(or
		(and
			(= (PX 2) (+ (CX 7) (CW 7)))
			(> (PY 2) (- (CY 7) (PH 2)))
			(< (PY 2) (+ (CY 7) (CH 7)))
		)
		(and
			(= (PY 2) (+ (CY 7) (CH 7)))
			(> (PX 2) (- (CX 7) (PW 2)))
			(< (PX 2) (+ (CX 7) (CW 7)))
		)
		(and
			(= (PX 2) (- (CX 7) (PW 2)))
			(> (PY 2) (- (CY 7) (PH 2)))
			(< (PY 2) (+ (CY 7) (CH 7)))
		)
		(and
			(= (PY 2) (- (CY 7) (PH 2)))
			(> (PX 2) (- (CX 7) (PW 2)))
			(< (PX 2) (+ (CX 7) (CW 7)))
		)
	)
)
(or
	(>= (PX 0) (+ (CX 7) (CW 7)))
	(>= (PY 0) (+ (CY 7) (CH 7)))
	(<= (PX 0) (- (CX 7) (PW 0)))
	(<= (PY 0) (- (CY 7) (PH 0)))
)
(or
	(>= (PX 1) (+ (CX 7) (CW 7)))
	(>= (PY 1) (+ (CY 7) (CH 7)))
	(<= (PX 1) (- (CX 7) (PW 1)))
	(<= (PY 1) (- (CY 7) (PH 1)))
)
(or
	(>= (PX 2) (+ (CX 7) (CW 7)))
	(>= (PY 2) (+ (CY 7) (CH 7)))
	(<= (PX 2) (- (CX 7) (PW 2)))
	(<= (PY 2) (- (CY 7) (PH 2)))
)
(<= (+ (CX 7) (CW 7)) SW)
(<= (+ (CY 7) (CH 7)) SH)
(>= (CX 7) 0)
(>= (CY 7) 0)
(or
	(and
		(= (CW 7) 10)
		(= (CH 7) 8)
	)
	(and
		(= (CW 7) 8)
		(= (CH 7) 10)
	)
)
))
