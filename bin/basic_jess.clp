#comment single line
/*
	Comment Multiple Lines
*/

(printout t "Hello World!" crlf)
(printout t "This is my first program using JESS" crlf crlf)

/* bind ?[variable_name][value] */

(bind ?number 100)
(bind ?string "String")

(bind ?name "")

/* (read) untuk scan satu kata, (readline) untuk scan satu baris */
(printout t "Input name: ")
(bind ?name (readline))

(printout t "Your name is : " ?name crlf crlf)

(printout t "Input age: ")
(bind ?age (read))

(printout t "Your age is : " ?age crlf crlf)

(bind ?number1 10)
(bind ?number2 100)
(printout t "Number Division : " (/ ?number1 (+ ?number1 ?number2)) crlf crlf)

(
    if (> ?number1 100) then
		(printout t "Variable number1 larger than 1" crlf crlf)
	elif(eq ?number1 10) then
	    (printout t "Variable number1 is 10" crlf crlf) 
    else then
	    (printout t "Variable number1 is lower" crlf crlf)    
)

(bind ?x 0)
(while (< ?x 10)
	(printout t "X " ?x crlf crlf)
    /*(++?x)*/
    (bind ?x (+ ?x 1))    
)

(for (bind ?i 0) (< ?i 10) (++ ?i)
	(printout t "I " ?i crlf crlf)    
)