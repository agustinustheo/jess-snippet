(deftemplate house
    (slot type)
    (slot room)
    (slot price)
    (slot location)
)

(deftemplate housegarage
    (slot type)
    (slot room)
    (slot price)
    (slot location)
    (slot garage)
)

(deffacts house
	(house (type "Cottage") (room 3) (price 7500) (location "South Jakarta")) 
	(house (type "Light House") (room 3) (price 25000) (location "South Jakarta")) 
	(house (type "Skyscraper") (room 4) (price 100000) (location "West Jakarta")) 
	(house (type "Cottage") (room 2) (price 5000) (location "North Jakarta")) 
	(house (type "Light House") (room 3) (price 10000) (location "West Jakarta"))  
    
	(housegarage (type "Cottage") (room 3) (price 30000) (location "West Jakarta") (garage 2)) 
	(housegarage (type "Light House") (room 2) (price 7500) (location "South Jakarta") (garage 2)) 
	(housegarage (type "Cottage") (room 3) (price 4500) (location "North Jakarta") (garage 1)) 
	(housegarage (type "Skyscraper") (room 5) (price 175000) (location "South Jakarta") (garage 3)) 
	(housegarage (type "Light House") (room 4) (price 7500) (location "West Jakarta") (garage 1))    
)

(reset)

(deffunction menu()
	(printout t "================" crlf)
	(printout t "|| Beli Rumah ||" crlf)
	(printout t "================" crlf)
	(printout t "1. View House" crlf)
	(printout t "2. Add a New House" crlf)
	(printout t "3. Update House Detail" crlf)
	(printout t "4. Delete House" crlf)
	(printout t "5. Search Match" crlf)
	(printout t "6. Exit" crlf)
)

(deffunction menu2()
	(printout t "List of house to be viewed" crlf)
	(printout t "================================" crlf)
	(printout t "1. House with Garage" crlf)
	(printout t "2. House without Garage" crlf)
)

(deffunction menu3()
	(printout t "Type of houses to be added" crlf)
	(printout t "================================" crlf)
	(printout t "1. House with Garage" crlf)
	(printout t "2. House without Garage" crlf)
)

(deffunction menu4()
	(printout t "Type of houses to be updated" crlf)
	(printout t "================================" crlf)
	(printout t "1. House with Garage" crlf)
	(printout t "2. House without Garage" crlf)
)

(deffunction addhouse()
	(bind ?type "")
	(bind ?room "")
	(bind ?price "")
	(bind ?location "")    
    
    (while (and
            	(neq ?type "Cottage"),
            	(neq ?type "Light House"),
            	(neq ?type "Skyscraper")
            )
        (printout t "Input house type [Cottage | Light House | Skyscraper](CASE-SENSITIVE): ")
        (bind ?type (readline))
    )  
    
    (bind ?flag1 FALSE)
    (while (or
            	(eq ?flag1 FALSE)
	            (or
	            	(< ?room 1)
	            	(> ?room 5)
                )
            )
        (printout t "Input room number [1 - 5]: ")
        (bind ?room (read))
        
        (if (numberp ?room TRUE) then
        	(bind ?flag1 TRUE)  
        )
    )
    
    (bind ?flag2 FALSE)
    (while (or
            	(eq ?flag2 FALSE)
            	(or
	            	(< ?price 1000)
	            	(> ?price 50000)
	            )
            )
        (printout t "Input house price [1000 - 50000] (dollars): ")
        (bind ?price (read))
        
        (if (numberp ?price TRUE) then
        	(bind ?flag2 TRUE)    
        )
    )
    
    (while (and
            	(neq ?location "West Jakarta"),
            	(neq ?location "North Jakarta"),
            	(neq ?location "South Jakarta")
            )
        (printout t "Input house location [West Jakarta | North Jakarta | South Jakarta](CASE-SENSITIVE): ")
        (bind ?location (readline))
    )
    
    (assert (house (type ?type) (room ?room) (price ?price) (location ?location)))
)

(deffunction addhousegarage()
	(bind ?type "")
	(bind ?room "")
	(bind ?price "")
	(bind ?location "")   
	(bind ?garage "")  
    
    (while (and
            	(neq ?type "Cottage"),
            	(neq ?type "Light House"),
            	(neq ?type "Skyscraper")
            )
        (printout t "Input house type [Cottage | Light House | Skyscraper](CASE-SENSITIVE): ")
        (bind ?type (readline))
    )  
    
    (bind ?flag1 FALSE)
    (while (or
            	(eq ?flag1 FALSE)
            	(or
	            	(< ?room 1)
	            	(> ?room 5)
	            )
            )
        (printout t "Input room number [1 - 5]: ")
        (bind ?room (read))
        
        (if (numberp ?room TRUE) then
        	(bind ?flag1 TRUE)   
        )
    )
    
    (bind ?flag2 FALSE)
    (while (or
            	(eq ?flag2 FALSE)
            	(or
	            	(< ?price 1000)
	            	(> ?price 50000)
	            )
            )
        (printout t "Input house price [1000 - 50000] (dollars): ")
        (bind ?price (read))
        
        (if (numberp ?price TRUE) then
        	(bind ?flag2 TRUE)    
        )
    )
    
    (while (and
            	(neq ?location "West Jakarta"),
            	(neq ?location "North Jakarta"),
            	(neq ?location "South Jakarta")
            )
        (printout t "Input house location [West Jakarta | North Jakarta | South Jakarta](CASE-SENSITIVE): ")
        (bind ?location (readline))
    )
    
    (bind ?flag3 FALSE)
    (while (or
            	(eq ?flag3 FALSE)
            	(or
	            	(< ?garage 1)
	            	(> ?garage 5)
	            )
            )
        (printout t "Input garage number [1 - 5]: ")
        (bind ?garage (read))
        
        (if (numberp ?garage FALSE) then
        	(bind ?flag3 TRUE)    
        )
    )
    
    (assert (housegarage (type ?type) (room ?room) (price ?price) (location ?location) (garage ?garage)))
)


(deffunction updatehouse()
    (bind ?chooseindex "")
    (bind ?flagg FALSE)
    
    (while (or
            	(eq ?flagg FALSE)
            	(or
	            	(< ?chooseindex 0)
	            	(> ?chooseindex 5)
	            )
            )
        (printout t "Which house to be updated[1..x | 0 back to main menu]: ")
        (bind ?chooseindex (read))
        
        (if (numberp ?chooseindex TRUE) then
        	(bind ?flagg TRUE)    
        )
    )
    
    (if (neq ?chooseindex 0) then
		(bind ?type "")
		(bind ?room "")
		(bind ?price "")
		(bind ?location "")    
	    
	    (while (and
	            	(neq ?type "Cottage"),
	            	(neq ?type "Light House"),
	            	(neq ?type "Skyscraper")
	            )
	        (printout t "Input house type [Cottage | Light House | Skyscraper](CASE-SENSITIVE): ")
	        (bind ?type (readline))
	    )  
	    
	    (bind ?flag1 FALSE)
	    (while (or
	            	(eq ?flag1 FALSE)
		            (or
		            	(< ?room 1)
		            	(> ?room 5)
	                )
	            )
	        (printout t "Input room number [1 - 5]: ")
	        (bind ?room (read))
	        
	        (if (numberp ?room TRUE) then
	        	(bind ?flag1 TRUE)  
	        )
	    )
	    
	    (bind ?flag2 FALSE)
	    (while (or
	            	(eq ?flag2 FALSE)
	            	(or
		            	(< ?price 1000)
		            	(> ?price 50000)
		            )
	            )
	        (printout t "Input house price [1000 - 50000] (dollars): ")
	        (bind ?price (read))
	        
	        (if (numberp ?price TRUE) then
	        	(bind ?flag2 TRUE)    
	        )
	    )
	    
	    (while (and
	            	(neq ?location "West Jakarta"),
	            	(neq ?location "North Jakarta"),
	            	(neq ?location "South Jakarta")
	            )
	        (printout t "Input house location [West Jakarta | North Jakarta | South Jakarta](CASE-SENSITIVE): ")
	        (bind ?location (readline))
	    )
	    
	    (modify ?chooseindex (type ?type) (room ?room) (price ?price) (location ?location))
    )
)

(deffunction updatehousegarage()
    (bind ?chooseindex "")
    (bind ?flagg FALSE)
    
    (while (or
            	(eq ?flagg FALSE)
            	(or
	            	(< ?chooseindex 0)
	            	(> ?chooseindex 5)
	            )
            )
        (printout t "Which house to be updated[1..x | 0 back to main menu]: ")
        (bind ?chooseindex (read))
        
        (if (numberp ?chooseindex TRUE) then
        	(bind ?flagg TRUE)    
        )
    )
    
    (if (neq ?chooseindex 0) then
		(bind ?type "")
		(bind ?room "")
		(bind ?price "")
		(bind ?location "")   
		(bind ?garage "")  
	    
	    (while (and
	            	(neq ?type "Cottage"),
	            	(neq ?type "Light House"),
	            	(neq ?type "Skyscraper")
	            )
	        (printout t "Input house type [Cottage | Light House | Skyscraper](CASE-SENSITIVE): ")
	        (bind ?type (readline))
	    )  
	    
	    (bind ?flag1 FALSE)
	    (while (or
	            	(eq ?flag1 FALSE)
	            	(or
		            	(< ?room 1)
		            	(> ?room 5)
		            )
	            )
	        (printout t "Input room number [1 - 5]: ")
	        (bind ?room (read))
	        
	        (if (numberp ?room TRUE) then
	        	(bind ?flag1 TRUE)   
	        )
	    )
	    
	    (bind ?flag2 FALSE)
	    (while (or
	            	(eq ?flag2 FALSE)
	            	(or
		            	(< ?price 1000)
		            	(> ?price 50000)
		            )
	            )
	        (printout t "Input house price [1000 - 50000] (dollars): ")
	        (bind ?price (read))
	        
	        (if (numberp ?price TRUE) then
	        	(bind ?flag2 TRUE)    
	        )
	    )
	    
	    (while (and
	            	(neq ?location "West Jakarta"),
	            	(neq ?location "North Jakarta"),
	            	(neq ?location "South Jakarta")
	            )
	        (printout t "Input house location [West Jakarta | North Jakarta | South Jakarta](CASE-SENSITIVE): ")
	        (bind ?location (readline))
	    )
	    
	    (bind ?flag3 FALSE)
	    (while (or
	            	(eq ?flag3 FALSE)
	            	(or
		            	(< ?garage 1)
		            	(> ?garage 5)
		            )
	            )
	        (printout t "Input garage number [1 - 5]: ")
	        (bind ?garage (read))
	        
	        (if (numberp ?garage FALSE) then
	        	(bind ?flag3 TRUE)    
	        )
	    )
	    
	    (modify ?chooseindex (type ?type) (room ?room) (price ?price) (location ?location) (garage ?garage))
	)
)

(deffunction deletehouse()
    (bind ?chooseindex "")
    (bind ?flagg FALSE)
    
    (while (or
            	(eq ?flagg FALSE)
            	(or
	            	(< ?chooseindex 0)
	            	(> ?chooseindex 5)
	            )
            )
        (printout t "Which house to be updated[1..x | 0 back to main menu]: ")
        (bind ?chooseindex (read))
        
        (if (numberp ?chooseindex TRUE) then
        	(bind ?flagg TRUE)    
        )
    )
    
    (if (neq ?chooseindex 0) then
		(retract ?chooseindex)
	)
)

(deffunction deletehousegarage()
    (bind ?chooseindex "")
    (bind ?flagg FALSE)
    
    (while (or
            	(eq ?flagg FALSE)
            	(or
	            	(< ?chooseindex 0)
	            	(> ?chooseindex 5)
	            )
            )
        (printout t "Which house to be updated[1..x | 0 back to main menu]: ")
        (bind ?chooseindex (read))
        
        (if (numberp ?chooseindex TRUE) then
        	(bind ?flagg TRUE)    
        )
    )
    
    (if (neq ?chooseindex 0) then
		(retract ?chooseindex)
	)
)

(defrule printhouse
	(house (type ?t) (room ?r) (price ?p) (location ?l))
    =>
    (printout t "1. " ?t " " ?r " " ?p " " ?l crlf)
)

(defrule printhousegarage
	(housegarage (type ?t) (room ?r) (price ?p) (location ?l) (garage ?g))
    =>
    (printout t "1. " ?t " " ?r " " ?p " " ?l " " ?g crlf)
)

(deffunction cls()
	(for (bind ?i 0) (<= ?i 30) (++ ?i)
    	(printout t crlf)
    )    
)

(bind ?choice 0)

(while (neq ?choice 6)
    (menu)
    (while (or
            	(> ?choice 6)
            	(< ?choice 1)
            )
		(printout t ">> Input [1-6]: ")
        (bind ?choice (read))
    )
    
    (if (eq ?choice 1) then
        
        (bind ?innerchoice -1)
        (cls)
    	(menu2)
    	
        (while (or
            	(< ?innerchoice 0)
            	(> ?innerchoice 2)
            )
			(printout t ">> Choose [1..2 | 0 back to main menu]: ")
	        (bind ?innerchoice (read))
    	)    
        
        (if (neq ?innerchoice 0) then
    	   (if (eq ?innerchoice 1) then
        		(run)
            )
    	   (if (eq ?innerchoice 2) then
        		(run)
            )
			(printout t "Press Enter to Continue..")
            (readline)
        )
     
        (cls)
    	(bind ?choice 0)
    )
    
    (if (eq ?choice 2) then
        
        (bind ?innerchoice -1)
        (cls)
    	(menu3)
    	
        (while (or
            	(< ?innerchoice 0)
            	(> ?innerchoice 2)
            )
			(printout t ">> Choose [1..2 | 0 back to main menu]: ")
	        (bind ?innerchoice (read))
    	)    
        
        (if (neq ?innerchoice 0) then
    	   (if (eq ?innerchoice 1) then
        		(addhousegarage)
            )
    	   (if (eq ?innerchoice 2) then
        		(addhouse)
            )
			(printout t "Press Enter to Continue..")
            (readline)
        )
     
        (cls)
    	(bind ?choice 0)
    )
    
    (if (eq ?choice 3) then
        
        (bind ?innerchoice -1)
        (cls)
    	(menu4)
    	
        (while (or
            	(< ?innerchoice 0)
            	(> ?innerchoice 2)
            )
			(printout t ">> Choose [1..2 | 0 back to main menu]: ")
	        (bind ?innerchoice (read))
    	)    
        
        (if (neq ?innerchoice 0) then
    	   (if (eq ?innerchoice 1) then
        		(updatehousegarage)
            )
    	   (if (eq ?innerchoice 2) then
        		(updatehouse)
            )
			(printout t "Press Enter to Continue..")
            (readline)
        )
        
    	(cls)
    	(bind ?choice 0)
    )
    
    (if (eq ?choice 4) then
        
        (bind ?innerchoice -1)
        (cls)
    	(menu4)
    	
        (while (or
            	(< ?innerchoice 0)
            	(> ?innerchoice 2)
            )
			(printout t ">> Choose [1..2 | 0 back to main menu]: ")
	        (bind ?innerchoice (read))
    	)    
        
        (if (neq ?innerchoice 0) then
    	   (if (eq ?innerchoice 1) then
        		(deletehousegarage)
            )
    	   (if (eq ?innerchoice 2) then
        		(deletehouse)
            )
			(printout t "Press Enter to Continue..")
            (readline)
        )
        
    	(cls)
    	(bind ?choice 0)
    )
    
    (if (eq ?choice 5) then
    
    	(cls)
    	(bind ?choice 0)
    )
)