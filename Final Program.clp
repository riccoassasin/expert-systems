(deftemplate Product1 (slot Sweets))
(deftemplate Product2 (slot Chocolate))
(deftemplate Product3 (slot Orange))
(deftemplate Product4 (slot Cola))
		
(deffunction TotalPay (?Price)
        (while (> ?Price 0)
		(bind ?AmountPaid (read))
		(if (eq ?AmountPaid 5) then (bind ?Price (- ?Price 5.00)))
		(if (eq ?AmountPaid 2) then (bind ?Price (- ?Price 2.00)))
		(if (eq ?AmountPaid 1) then (bind ?Price (- ?Price 1.00)))
		(if (eq ?AmountPaid 0.50) then (bind ?Price (- ?Price 0.50)))
		(if (eq ?AmountPaid 0.20) then (bind ?Price (- ?Price 0.20)))
		(if (eq ?AmountPaid 0.10) then (bind ?Price (- ?Price 0.10)))
		(if (> ?Price 0) then (printout t "You still need to pay :R " ?Price crlf
		                                      "Please enter an amount to pay: (Only R5 , R2, R1, c50, c20, c10)" crlf
		                                      "Amount:R "))
	    (if (< ?Price 0) then (printout t "Your Change is: R " (* ?Price -1) crlf ))))

(deffunction Prices()	
    (bind ?Num (read))	
	(if(eq ?Num 1) then (bind ?Price 12.50))
	(if(eq ?Num 2) then (bind ?Price 15.00))
	(if(eq ?Num 3) then (bind ?Price 10.00))
	(if(eq ?Num 4) then (bind ?Price 8.50))
	(printout t "The price for your item is: R " ?Price crlf
	            "Please enter an amount to pay: (Only R5 , R2, R1, c50, c20, c10)" crlf
                "Amount:R ")
    (TotalPay ?Price))

(deffunction Products()
    (printout t "Please choose one of the following: (Type in a number from 1-4)" crlf
	             "1. Sweets" crlf
		     "2. Chocolate" crlf
                     "3. Orange"crlf
                     "4. Cola" crlf
		     "item Number:" )
		      (Prices))		

(deffacts ProductPrice
          (Product1 (Sweets 12.50))
          (Product2 (Chocolate 15.00))
          (Product3 (Orange 10.00))
          (Product4 (Cola 8.50)))
		  
(defrule AskUser 
         (Product1(Sweets 12.50))
         (Product2 (Chocolate 15.00))
         (Product3 (Orange 10.00))
         (Product4 (Cola 8.50))
=>        
        (Products))	
