(deftemplate coin (slot ctype))
(deftemplate change (multislot remaining))
(deftemplate product (slot name) (multislot price))

(deffacts products
  (product (name CocaCola) (price R8 50c))
  (product (name Orange) (price R10 0c))
  (product (name Sweets) (price R12 50c))
  (product (name Chocolate) (price R15 0c)))
			
(defrule make-twenty-cents
		(coin (ctype 10c))
		(coin (ctype 10c))
	=>
		(assert (coin
			(ctype 20c)))
			
(defrule make-fifty-cents
		(coin (ctype 20c))
		(coin (ctype 20c))
		(coin (ctype 10c))
	=>
		(assert (coin
			(ctype 50c)))
			
(defrule make-one-rand
		(coin (ctype 50c))
		(coin (ctype 50c))
	=>
		(assert (coin
			(ctype R1)))
			
(defrule make-two-rand
		(coin (ctype R1))
		(coin (ctype R1))
	=>
		(assert (coin
			(ctype R2)))
			
(defrule make-five-rand
		(coin (ctype R1))
		(coin (ctype R2))
		(coin (ctype R2))
	=>
		(assert (coin
			(ctype R5)))


defrule CocaCola-no-change 
		(coin (ctype R1))
		(coin (ctype R2))
		(coin (ctype R5))
		(coin (ctype 50c))
	=>
		(assert (change
			(remaining R0 0c)))
			
(defrule CocaCola-ten-change 
		(coin (ctype R1))
		(coin (ctype R2))
		(coin (ctype R5))
		(coin (ctype 20c))
		(coin (ctype 20c))
		(coin (ctype 20c))
	=>
		(assert (change
			(remaining R0 10c)))

(defrule CocaCola-fifty-change 
		(coin (ctype R2))
		(coin (ctype R2))
		(coin (ctype R5))
	=>
		(assert (change
			(remaining R0 50c)))

(defrule CocaCola-one-fifty-change 
		(coin (ctype R5))
		(coin (ctype R5))
	=>
		(assert (change
			(remaining R1 50c)))

			

			
			
