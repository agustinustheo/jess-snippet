(deftemplate Mahasiswa
	(slot Nama)
    (slot Umur)
    (slot Jurusan)    
)

(bind ?choice 0)

(while (neq ?choice 4)
	(printout t crlf crlf crlf)
	(printout t "Data Mahasiswa yang Tersimpan" crlf)
	(printout t "-----------------------------" crlf)
    (facts)
	(printout t "-----------------------------" crlf crlf)
    (printout t "1. Insert" crlf)
    (printout t "2. Update" crlf)
    (printout t "3. Delete" crlf)
    (printout t "4. Exit" crlf)
    (printout t "Choose: ") 
    (bind ?choice (read))  
    
    (if (eq ?choice 1) then
        
        (bind ?name "")
        
        (while (or  
                	(< (str-length ?name) 5)
               		(> (str-length ?name) 20)
                )
    		(printout t "Input name [5..20]: ")
    		(bind ?name (readline))  
        )
        
        (bind ?umur "")
        (bind ?flag FALSE)
        
        (while (eq ?flag FALSE)
    		(printout t "Input umur [harus angka]: ")
    		(bind ?umur (read)) 
            
            (if (numberp ?umur TRUE) then
            	(bind ?flag TRUE)
            ) 
        )
        
        (bind ?jurusan "")
        
        (while (and  
                	(neq ?jurusan "IT")
               		(neq ?jurusan "CS")
                )
    		(printout t "Input jurusan [IT/CS]: ")
    		(bind ?jurusan (readline))
        )
        
        (assert (Mahasiswa (Nama ?name) (Umur ?umur) (Jurusan ?jurusan)))
    	
    elif (eq ?choice 2) then
        
        (bind ?changenum "")
        (bind ?flagg FALSE)
        
        (while (eq ?flagg FALSE)
    		(printout t "Mau ubah fact nomor berapa[harus angka]: ")
    		(bind ?changenum (read)) 
            
            (if (numberp ?changenum TRUE) then
            	(bind ?flagg TRUE)
            ) 
        )
        
        (bind ?name "")
        
        (while (or  
                	(< (str-length ?name) 5)
               		(> (str-length ?name) 20)
                )
    		(printout t "Input name [5..20]: ")
    		(bind ?name (readline))  
        )
        
        (bind ?umur "")
        (bind ?flag FALSE)
        
        (while (eq ?flag FALSE)
    		(printout t "Input umur [harus angka]: ")
    		(bind ?umur (read)) 
            
            (if (numberp ?umur TRUE) then
            	(bind ?flag TRUE)
            ) 
        )
        
        (bind ?jurusan "")
        
        (while (and  
                	(neq ?jurusan "IT")
               		(neq ?jurusan "CS")
                )
    		(printout t "Input jurusan [IT/CS]: ")
    		(bind ?jurusan (readline))
        )
        
        (modify ?changenum (Nama ?name) (Umur ?umur) (Jurusan ?jurusan))
        
    elif (eq ?choice 3) then
        
        (bind ?changenum "")
        (bind ?flagg FALSE)
        
        (while (eq ?flagg FALSE)
    		(printout t "Mau ubah fact nomor berapa[harus angka]: ")
    		(bind ?changenum (read)) 
            
            (if (numberp ?changenum TRUE) then
            	(bind ?flagg TRUE)
            ) 
        )
        
        (retract ?changenum)
    )
    
    
    
    
)