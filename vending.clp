(deftemplate coin (slot ctype))
(deftemplate change (slot remaining))
(deftemplate price (multislot rand cent))

(deftemplate product (slot name) (multislot price))

(deffacts products
  (product (name Cola) (price 8 50))
  (product (name Orange) (price 10 0))
  (product (name Sweets) (price 12 50))
  (product (name Chocolate) (price 15 0)))
			
(defrule 10c+10c=20c 
		(coin (ctype 10c))
		(coin (ctype 10c))
	=>
		(assert (coin
			(ctype 20c)))
			
(defrule 20c+20c+10c=50c 
		(coin (ctype 20c))
		(coin (ctype 20c))
		(coin (ctype 10c))
	=>
		(assert (coin
			(ctype 50c)))
			
(defrule 50c+50c=R1 
		(coin (ctype 50c))
		(coin (ctype 50c))
	=>
		(assert (coin
			(ctype R1)))
			
(defrule R1+R1=R2 
		(coin (ctype R1))
		(coin (ctype R1))
	=>
		(assert (coin
			(ctype R2)))
			
(defrule R1+R2+R2=R5 
		(coin (ctype R1))
		(coin (ctype R2))
		(coin (ctype R2))
	=>
		(assert (coin
			(ctype R5)))


defrule cola-no-change 
		(coin (ctype R1))
		(coin (ctype R2))
		(coin (ctype R5))
		(coin (ctype 50c))
	=>
		(assert (change
			(ctype 0c)))
			
(defrule cola-50c-change 
		(coin (ctype R2))
		(coin (ctype R2))
		(coin (ctype R5))
	=>
		(assert (change
			(ctype 50c)))

			

			
			