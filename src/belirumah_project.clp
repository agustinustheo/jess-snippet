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
    
    	(cls)
    	(bind ?choice 0)
    )
    
    (if (eq ?choice 2) then
    
    	(cls)
    	(bind ?choice 0)
    )
    
    (if (eq ?choice 3) then
    
    	(cls)
    	(bind ?choice 0)
    )
    
    (if (eq ?choice 4) then
    
    	(cls)
    	(bind ?choice 0)
    )
    
    (if (eq ?choice 5) then
    
    	(cls)
    	(bind ?choice 0)
    )
)