(defglobal 
    ?*countHouse* = 1
    ?*countHouseGarage* = 1
)

(deftemplate House
    (slot type)
    (slot room)
    (slot price)
    (slot location)
)

(deftemplate HouseGarage
	(slot type)
    (slot room)
    (slot price)
    (slot location)
    (slot garage)
)

(deffacts HouseFact
	(House (type "Cottage") (room 3) (price 7500) (location "South Jakarta")) 
	(House (type "Light House") (room 3) (price 25000) (location "South Jakarta")) 
	(House (type "Skyscraper") (room 4) (price 100000) (location "West Jakarta")) 
	(House (type "Cottage") (room 2) (price 5000) (location "North Jakarta")) 
	(House (type "Light House") (room 3) (price 10000) (location "West Jakarta"))  
)

(deffacts HouseGarageFact
    (HouseGarage (type "Cottage") (room 3) (price 30000) (location "West Jakarta") (garage 2)) 
	(HouseGarage (type "Light House") (room 2) (price 7500) (location "South Jakarta") (garage 2)) 
	(HouseGarage (type "Cottage") (room 3) (price 4500) (location "North Jakarta") (garage 1)) 
	(HouseGarage (type "Skyscraper") (room 5) (price 175000) (location "South Jakarta") (garage 3)) 
	(HouseGarage (type "Light House") (room 4) (price 7500) (location "West Jakarta") (garage 1))	
)

(defquery getHouseGarage
    "query to view house WITH garage"
    (HouseGarage (type ?type) (room ?room) (price ?price) (location ?location) (garage ?garage))
)

(defquery getHouse
    "query to view house WITHOUT garage"
    (House (type ?type) (room ?room) (price ?price) (location ?location))
)

;INSERT DEFRULE HERE
;//

; TODO LIST : 
; menu5 function !!important!!
; numeric validation error fix --> see comment above addHouseGarage method
; numeric validation add --> ALL menu that has '0 to return to main menu'
; numeric validation + 0 to main menu --> update and delete house method

(deffunction cls()
	(for (bind ?i 0) (<= ?i 30) (++ ?i)
    	(printout t crlf)
    )    
)

;NUMBER & <> VALIDATION ON ADDHOUSE STILL BUGGY
;TRY INPUT : Q, 3, Q --> ERROR
(deffunction addHouseGarage()
    (bind ?type "")
    (while (and (neq ?type "Cottage") (neq ?type "Light House") (neq ?type "Skyscraper"))
        (printout t "Input house type [Cottage | Light House | Skyscraper](CASE-SENSITIVE): ")
        (bind ?type (readline))
    )
    (bind ?flag1 FALSE)
    (bind ?room "0")
    (while (or(eq ?flag1 FALSE)(or(< ?room 1)(> ?room 5)))
        (printout t "Input room number [1 - 5]: ")
        (bind ?room (read))
        (if (numberp ?room TRUE) then
        	(bind ?flag1 TRUE) 
            else then
            	(bind ?room 0) 
        )
    )
    (bind ?flag2 FALSE)
    (bind ?price "0")
    (while (or(eq ?flag2 FALSE)(or(< ?price 1000)(> ?price 50000)))
        (printout t "Input house price [1000 - 50000] (dollars): ")
        (bind ?price (read))
        (if (numberp ?price TRUE) then
        	(bind ?flag2 TRUE)  
            else then
            	(bind ?price 0)
        )
    )
    (bind ?location "")
    (while (and (neq ?location "West Jakarta") (neq ?location "North Jakarta") (neq ?location "South Jakarta"))
        (printout t "Input house location [West Jakarta | North Jakarta | South Jakarta](CASE-SENSITIVE): ")
        (bind ?location (readline))
    )
    (bind ?flag3 FALSE)
    (bind ?garage "0")
    (while (or(eq ?flag3 FALSE)(or(< ?garage 1)(> ?garage 5)))
        (printout t "Input garage number [1 - 5]: ")
        (bind ?garage (read))
        (if (numberp ?garage TRUE) then
        	(bind ?flag3 TRUE)  
            else then
            	(bind ?garage 0)
        )
    )
    (assert (HouseGarage (type ?type) (room ?room) (price ?price) (location ?location) (garage ?garage)))
)

(deffunction addHouse()
    (bind ?type "")
    (while (and (neq ?type "Cottage") (neq ?type "Light House") (neq ?type "Skyscraper"))
        (printout t "Input house type [Cottage | Light House | Skyscraper](CASE-SENSITIVE): ")
        (bind ?type (readline))
    )
    (bind ?flag1 FALSE)
    (bind ?room "0")
    (while (or(eq ?flag1 FALSE)(or(< ?room 1)(> ?room 5)))
        (printout t "Input room number [1 - 5]: ")
        (bind ?room (read))
        (if (numberp ?room TRUE) then
        	(bind ?flag1 TRUE) 
            else then
            	(bind ?room 0)  
        )
    )
    (bind ?flag2 FALSE)
    (bind ?price "0")
    (while (or(eq ?flag2 FALSE)(or(< ?price 1000)(> ?price 50000)))
        (printout t "Input house price [1000 - 50000] (dollars): ")
        (bind ?price (read))
        (if (numberp ?price TRUE) then
        	(bind ?flag2 TRUE)
            else then
            	(bind ?price 0)  
        )
    )
    (bind ?location "")
    (while (and (neq ?location "West Jakarta") (neq ?location "North Jakarta") (neq ?location "South Jakarta"))
        (printout t "Input house location [West Jakarta | North Jakarta | South Jakarta](CASE-SENSITIVE): ")
        (bind ?location (readline))
    )
    (assert (House (type ?type) (room ?room) (price ?price) (location ?location)))
)

(deffunction updateHouseGarage(?indexUpdate)
    (bind ?type "")
    (while (and (neq ?type "Cottage") (neq ?type "Light House") (neq ?type "Skyscraper"))
        (printout t "Input house type [Cottage | Light House | Skyscraper](CASE-SENSITIVE): ")
        (bind ?type (readline))
    )
    (bind ?flag1 FALSE)
    (bind ?room "0")
    (while (or(eq ?flag1 FALSE)(or(< ?room 1)(> ?room 5)))
        (printout t "Input room number [1 - 5]: ")
        (bind ?room (read))
        (if (numberp ?room TRUE) then
        	(bind ?flag1 TRUE)  
        )
    )
    (bind ?flag2 FALSE)
    (bind ?price "0")
    (while (or(eq ?flag2 FALSE)(or(< ?price 1000)(> ?price 50000)))
        (printout t "Input house price [1000 - 50000] (dollars): ")
        (bind ?price (read))
        (if (numberp ?price TRUE) then
        	(bind ?flag2 TRUE)  
        )
    )
    (bind ?location "")
    (while (and (neq ?location "West Jakarta") (neq ?location "North Jakarta") (neq ?location "South Jakarta"))
        (printout t "Input house location [West Jakarta | North Jakarta | South Jakarta](CASE-SENSITIVE): ")
        (bind ?location (readline))
    )
    (bind ?flag3 FALSE)
    (bind ?garage "0")
    (while (or(eq ?flag3 FALSE)(or(< ?garage 1)(> ?garage 5)))
        (printout t "Input garage number [1 - 5]: ")
        (bind ?garage (read))
        (if (numberp ?garage TRUE) then
        	(bind ?flag3 TRUE)  
        )
    )
    (bind ?loopCount 0)
    (bind ?get (run-query getHouseGarage))
    (while (neq ?loopCount ?indexUpdate)
        (++ ?loopCount)
        (bind ?token (call ?get next))
        (bind ?fact (call ?token fact 1))
        (if (eq ?loopCount ?indexUpdate) then
            (modify ?fact (type ?type) (room ?room) (price ?price) (location ?location) (garage ?garage))
        )
    )
)

(deffunction updateHouse(?indexUpdate)
    (bind ?type "")
    (while (and (neq ?type "Cottage") (neq ?type "Light House") (neq ?type "Skyscraper"))
        (printout t "Input house type [Cottage | Light House | Skyscraper](CASE-SENSITIVE): ")
        (bind ?type (readline))
    )
    (bind ?flag1 FALSE)
    (bind ?room "0")
    (while (or(eq ?flag1 FALSE)(or(< ?room 1)(> ?room 5)))
        (printout t "Input room number [1 - 5]: ")
        (bind ?room (read))
        (if (numberp ?room TRUE) then
        	(bind ?flag1 TRUE)  
        )
    )
    (bind ?flag2 FALSE)
    (bind ?price "0")
    (while (or(eq ?flag2 FALSE)(or(< ?price 1000)(> ?price 50000)))
        (printout t "Input house price [1000 - 50000] (dollars): ")
        (bind ?price (read))
        (if (numberp ?price TRUE) then
        	(bind ?flag2 TRUE)  
        )
    )
    (bind ?location "")
    (while (and (neq ?location "West Jakarta") (neq ?location "North Jakarta") (neq ?location "South Jakarta"))
        (printout t "Input house location [West Jakarta | North Jakarta | South Jakarta](CASE-SENSITIVE): ")
        (bind ?location (readline))
    )
    (bind ?loopCount 0)
    (bind ?get (run-query getHouse))
    (while (neq ?loopCount ?indexUpdate)
        (++ ?loopCount)
        (bind ?token (call ?get next))
        (bind ?fact (call ?token fact 1))
        (if (eq ?loopCount ?indexUpdate) then
            (modify ?fact (type ?type) (room ?room) (price ?price) (location ?location))
        )
    )
)

(deffunction deleteHouseGarage(?indexDelete)
    (bind ?loopCount 0)
    (bind ?get (run-query getHouseGarage))
    (while (neq ?loopCount ?indexDelete)
        (++ ?loopCount)
        (bind ?token (call ?get next))
        (bind ?fact (call ?token fact 1))
        (if (eq ?loopCount ?indexDelete) then
            (retract ?fact)
        )
    )
)

(deffunction deleteHouse(?indexDelete)
    (bind ?loopCount 0)
    (bind ?get (run-query getHouse))
    (while (neq ?loopCount ?indexDelete)
        (++ ?loopCount)
        (bind ?token (call ?get next))
        (bind ?fact (call ?token fact 1))
        (if (eq ?loopCount ?indexDelete) then
            (retract ?fact)
        )
    )
)

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

(deffunction menu1()
    (printout t "List of house to be viewed" crlf)
	(printout t "================================" crlf)
	(printout t "1. House with Garage" crlf)
	(printout t "2. House without Garage" crlf)
    (bind ?innerchoice -1)
    (while (neq ?innerchoice 0)
        (printout t ">> Choose [1..2 | 0 back to main menu]: ")
        (bind ?innerchoice(read))
        (if (eq ?innerchoice 1) then
            (cls)
            ; (assert (viewHouseGarage))
            ; (run)
            (bind ?*countHouseGarage* 1)
            (bind ?get (run-query* getHouseGarage))
            (while (?get next)
                (printout t ?*countHouseGarage* ". " (?get getString type) " " (?get getInt room) " " (?get getInt price)" " (?get getString location) " " (?get getInt garage) crlf) 
                (++ ?*countHouseGarage*)   
            )
            (printout t "Press Enter to Continue...")
            (readline)
            (break)
            elif (eq ?innerchoice 2) then
                (cls)
                ; (assert (viewHouse))
                ; (run)
                (bind ?*countHouse* 1)
                (bind ?get (run-query* getHouse))
                (while (?get next)
                    (printout t ?*countHouse* ". " (?get getString type) " " (?get getInt room) " " (?get getInt price)" " (?get getString location)crlf)
                    (++ ?*countHouse*)   
                )
                (printout t "Press Enter to Continue...")
                (readline)
                (break)
        )
    )
)

(deffunction menu2()
    (printout t "Type of house to be added" crlf)
	(printout t "================================" crlf)
	(printout t "1. House with Garage" crlf)
	(printout t "2. House without Garage" crlf)
    (bind ?innerchoice -1)
    (while (neq ?innerchoice 0)
        (printout t ">> Choose [1..2 | 0 back to main menu]: ")
        (bind ?innerchoice(read))
        (if (eq ?innerchoice 1) then
            (cls)
            (addHouseGarage)
            (printout t "Press Enter to Continue...")
            (readline)
            (break)
            elif (eq ?innerchoice 2) then
                (cls)
                (addHouse)
                (printout t "Press Enter to Continue...")
                (readline)
                (break)
        )
    )   
)

(deffunction menu3()
    (printout t "Type of house to be updated" crlf)
	(printout t "================================" crlf)
	(printout t "1. House with Garage" crlf)
	(printout t "2. House without Garage" crlf)
    (bind ?innerchoice -1)
    (while (neq ?innerchoice 0)
        (printout t ">> Choose [1..2 | 0 back to main menu]: ")
        (bind ?innerchoice(read))
        (if (eq ?innerchoice 1) then
            (cls)
            (bind ?*countHouseGarage* 1)
            (bind ?get (run-query* getHouseGarage))
            (while (?get next)
                (printout t ?*countHouseGarage* ". " (?get getString type) " " (?get getInt room) " " (?get getInt price)" " (?get getString location) " " (?get getInt garage) crlf) 
                (++ ?*countHouseGarage*)   
            )
            ;VALIDATE WIP (numeric and if 0)
            (bind ?updtchoice -1)
            (while (neq ?updtchoice 0)
                (printout t "Which house to be updated[1.." (- ?*countHouseGarage* 1) " | 0 back to main menu]: ")
                (bind ?updtchoice(read))
                (if	(and (>= ?updtchoice 1)(<= ?updtchoice (- ?*countHouseGarage* 1)) ) then
		            (updateHouseGarage ?updtchoice)
		            (printout t "Press Enter to Continue...")
		            (readline)
		            (break)
                )
            )
            (break)
            elif (eq ?innerchoice 2) then
                (cls)
                (bind ?*countHouse* 1)
                (bind ?get (run-query* getHouse))
                (while (?get next)
                    (printout t ?*countHouse* ". " (?get getString type) " " (?get getInt room) " " (?get getInt price)" " (?get getString location) crlf) 
                    (++ ?*countHouse*)   
                )
                ;VALIDATE WIP (numeric and if 0)
                (bind ?updtchoice -1)
                (while (neq ?updtchoice 0)
                    (printout t "Which house to be deleted[1.." (- ?*countHouse* 1) " | 0 back to main menu]: ")
                    (bind ?updtchoice(read))
                	(if (and (>= ?updtchoice 1)(<= ?updtchoice (- ?*countHouse* 1)) ) then
		                (updateHouse ?updtchoice)
		                (printout t "Press Enter to Continue...")
		                (readline)
		                (break)
                    )
                )
                (break)
        )
    )   
    
)

(deffunction menu4()
    (printout t "Type of house to be deleted" crlf)
	(printout t "================================" crlf)
	(printout t "1. House with Garage" crlf)
	(printout t "2. House without Garage" crlf)
    (bind ?innerchoice -1)
    (while (neq ?innerchoice 0)
        (printout t ">> Choose [1..2 | 0 back to main menu]: ")
        (bind ?innerchoice(read))
        (if (eq ?innerchoice 1) then
            (cls)
            (bind ?*countHouseGarage* 1)
            (bind ?get (run-query* getHouseGarage))
            (while (?get next)
                (printout t ?*countHouseGarage* ". " (?get getString type) " " (?get getInt room) " " (?get getInt price)" " (?get getString location) " " (?get getInt garage) crlf) 
                (++ ?*countHouseGarage*)   
            )
            ;VALIDATE WIP (numeric and if 0)
            (bind ?delchoice -1)
            (while (neq ?delchoice 0)
                (printout t "Which house to be deleted[1.." (- ?*countHouseGarage* 1) " | 0 back to main menu]: ")
                (bind ?delchoice(read))
        		(if (and (>= ?delchoice 1) (<= ?delchoice (- ?*countHouseGarage* 1)) ) then
		            (deleteHouseGarage ?delchoice)
		            (printout t "Press Enter to Continue...")
		            (readline)
            		(break) 
                )
            )
            (break) 
            elif (eq ?innerchoice 2) then
                (cls)
                (bind ?*countHouse* 1)
                (bind ?get (run-query* getHouse))
                (while (?get next)
                    (printout t ?*countHouse* ". " (?get getString type) " " (?get getInt room) " " (?get getInt price)" " (?get getString location) crlf) 
                    (++ ?*countHouse*)   
                )
                ;VALIDATE WIP (numeric and if 0)
                (bind ?delchoice -1)
                (while (neq ?delchoice 0)
                    (printout t "Which house to be deleted[1.." (- ?*countHouse* 1) " | 0 back to main menu]: ")
                    (bind ?delchoice(read))
	                (if (and (>= ?delchoice 1)(<= ?delchoice (- ?*countHouse* 1)) ) then
		                (deleteHouse ?delchoice)
		                (printout t "Press Enter to Continue...")
		                (readline)
            			(break) 
	                )
                )
                (break)
        )
    )
)   

(deffunction menu5()
    ;
    (facts)
)

(reset)

(bind ?choice 0)
(while (neq ?choice 6)
    (cls)
    (menu)
    (printout t "Your Choice >>")
    (bind ?choice(read))
    (if (eq ?choice 1) then
        (cls)
        (menu1)
        elif (eq ?choice 2) then
            (cls)
            (menu2)
        elif (eq ?choice 3) then
            (cls)
            (menu3)
        elif (eq ?choice 4) then
            (cls)
            (menu4)
        elif (eq ?choice 5) then
            (cls)
        	(printout t "Type of house to be searched" crlf)
			(printout t "================================" crlf)
			(printout t "1. House with Garage" crlf)
			(printout t "2. House without Garage" crlf)
		    (bind ?innerchoice -1)
		    (while (neq ?innerchoice 0)
		        (printout t ">> Choose [1..2 | 0 back to main menu]: ")
		        (bind ?innerchoice(read))
		        (if (eq ?innerchoice 1) then
		            (run)
                	(new Template2)
		            (break) 
		            elif (eq ?innerchoice 2) then
		                (run)
                		(new Template)
		                (break)
		        )
		    )
    )
)