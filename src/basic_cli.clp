(defglobal ?*name* = "")
(defglobal ?*major* = "")

(deffunction menu()
	(printout t "1. Input Student" crlf)
	(printout t "2. See Student" crlf)
	(printout t "3. Exit" crlf)
	(printout t ">> ")    
)

(deffunction menu1()
    (while (or 
            	(< (str-length ?name) 3)
            	(> (str-length ?name) 20)
            )
		(printout t "Input name: ")
		(bind ?name (readline))  
    ) 
    (while (and 
	            (neq ?major "IT")
	            (neq ?major "SI")
	            (neq ?major "CE")
            )
		(printout t "Input major: ")
		(bind ?major (readline))  
    )
)

(deffunction menu2()
	(printout t "Student Name: " ?name crlf)
	(printout t "Student Major: " ?major crlf)
)

(bind ?choose 0)

(while (<> ?choose 3)
	(menu)
	(bind ?choose (read))
    (if (eq ?choose 1) then
        (menu1)
    )
    (if (eq ?choose 2) then
        (menu2)
    )
)