(deftemplate Mahasiswa
	(slot Name)    
    (slot Age)
    (slot Degree)
)

(bind ?choice 0)

(while (neq ?choice 4)
    (printout t "Student Data Facts" crlf)
    (printout t "-----------------" crlf)
    (facts)
    (printout t "-----------------" crlf crlf crlf)
	(printout t "1. Insert" crlf)
	(printout t "2. Update" crlf)
	(printout t "3. Delete" crlf)
	(printout t "4. Exit" crlf)
    (printout t "Choose : ")
    (bind ?choice (read))
    
    (if (eq ?choice 1) then
    	(bind ?name "")
        
        (while (or
                	(< (str-length ?name) 5)
                	(> (str-length ?name) 20)
                )
            (printout t "Input Name [5..20] : ")
            (bind ?name (readline))
        )   
        
        (bind ?age "")
        (bind ?flag FALSE)
        
        (while (eq ?flag FALSE)
            (printout t "Input Age [Must be numeric] : ")
            (bind ?age (read))
            
            (if (numberp ?age FALSE) then
            	(bind ?flag TRUE)    
            )
        )
        
    	(bind ?degree "")
        
        (while (and
                	(neq ?degree "IT")
                	(neq ?degree "CS")
                )
            (printout t "Input Degree [IT/CS] : ")
            (bind ?degree (readline))
        )   
        
        (assert (Mahasiswa (Name ?name) (Age ?age) (Degree ?degree)))
    )
    
    (if (eq ?choice 2) then
        (bind ?changenum "")
        (bind ?flagg FALSE)
        
        (while (eq ?flagg FALSE)
            (printout t "Input Fact Index [Must be numeric] : ")
            (bind ?changenum (read))
            
            (if (numberp ?changenum FALSE) then
            	(bind ?flagg TRUE)    
            )
        )
        
    	(bind ?name "")
        
        (while (or
                	(< (str-length ?name) 5)
                	(> (str-length ?name) 20)
                )
            (printout t "Input Name [5..20] : ")
            (bind ?name (readline))
        )   
        
        (bind ?age "")
        (bind ?flag FALSE)
        
        (while (eq ?flag FALSE)
            (printout t "Input Age [Must be numeric] : ")
            (bind ?age (read))
            
            (if (numberp ?age FALSE) then
            	(bind ?flag TRUE)    
            )
        )
        
    	(bind ?degree "")
        
        (while (and
                	(neq ?degree "IT")
                	(neq ?degree "CS")
                )
            (printout t "Input Degree [IT/CS] : ")
            (bind ?degree (readline))
        )   
        
        (modify ?changenum (Name ?name) (Age ?age) (Degree ?degree))
    )
    
    (if (eq ?choice 3) then
        (bind ?changenum "")
        (bind ?flagg FALSE)
        
        (while (eq ?flagg FALSE)
            (printout t "Input Fact Index [Must be numeric] : ")
            (bind ?changenum (read))
            
            (if (numberp ?changenum FALSE) then
            	(bind ?flagg TRUE)    
            )
        )
        
        (retract ?changenum)
    )
)