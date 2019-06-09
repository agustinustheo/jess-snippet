(deftemplate movie
    (slot title)
    (slot genre)
    (slot price)
)

(deffacts Listofmovies
    (movie (title "Conjuring")(genre "Horror")(price 43000))
    (movie (title "Avengers")(genre "Action")(price 50000))   
)

(deffunction menu1()
    (bind ?newtitle "")
    (while (or (< (str-length ?newtitle) 5)(> (str-length ?newtitle) 30))
	    (printout t "Insert Movie Title" crlf)
	    (printout t "> ")  
        (bind ?newtitle (readline))
    )
    
    (bind ?newgenre "")
    (while (and (neq ?newgenre "Horror") (neq ?newgenre "Action") (neq ?newgenre "Comedy") (neq ?newgenre "Drama") (neq ?newgenre "Thriller"))
	    (printout t "Insert Movie Genre" crlf)
	    (printout t "> ")  
        (bind ?newgenre (readline))
    )
    
    (bind ?newprice 0)
    (while (or (< ?newprice 50000)(> ?newprice 100000))
	    (printout t "Insert Movie Price" crlf)
	    (printout t "> ")  
        (bind ?newprice (read))
    )
    
    (assert (movie (title ?newtitle) (genre ?newgenre) (price ?newprice)))
    
)

(deffunction menu2()
    
    (reset) (facts)
    (printout t "=========================" crlf)
    (bind ?idx 0)
    (while (or (< ?idx 1) (> ?idx ?moviecount))
    	(printout t "Rent which movie?")
    	(printout t "> ")
    	(bind ?idx (read))
    	(retract (- ?idx 1)) 
    )
)

(deffunction menu()
    (reset)
    (facts)
    (printout t "=========================" crlf)
    (printout t "1. Insert Movie" crlf)
	(printout t "2. Rent Movie" crlf)
	(printout t "3. Exit" crlf)
	(printout t ">> ")

)

(defglobal 
    ?*moviecount* = 5
    ?*exit* = 0
    )

(while (neq ?*exit* 1)
    (bind ?choice 0)
    (menu)
    (bind ?choice (read))
    (if (eq ?choice 1) then
        (menu1)
        (+ ?*moviecount* 1)
    elif (eq ?choice 2) then
    	(menu2)
        (- ?*moviecount* 1)
    elif (eq ?choice 3) then 
    	(bind ?*exit* 1)
    )
)


