(deftemplate coin (slot ctype))
(deftemplate change (slot remaining))
(deftemplate price (multislot rand cent))

(deftemplate product (slot name) (multislot rand cent))

(deffacts products
  (product (name Cola) (rand 8 cent 50))
  (product (name Orange) (rand 10 cent 0))
  (product (name Sweets) (rand 12 cent 50))
  (product (name Chocolate) (rand 15 cent 0)))
			
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
			