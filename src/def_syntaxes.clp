(deffunction fuck()
    (facts)
)

(defglobal ?*count* = 0)

(deftemplate person
    (slot name)
    (slot age)
    (slot gender)
)

(deftemplate senior
    (slot name)
    (slot age)
    (slot gender)
)

(deffacts inipeople
	(person (name "george w bush did")(age 911)(gender "male"))
    (person (name "pewdiepie")(age 29)(gender "male"))
    (person (name "gloria borger")(age 50)(gender "female"))
)

(reset)
(fuck)

(defrule viewrule
    (view ?g)
    (person (name ?n)(age ?a)(gender ?g))
    =>
	(bind ?*count* (+ ?*count* 1))
    (printout t ?*count* ". " ?n " " ?a " " ?g crlf)
    )

(defrule retractView
   	?view <- (view ?gender)
    =>
    (retract ?view)
)

(defrule insertPerson
    
    ?insert <- (insert ?name ?age&:(< ?age 25) ?gender)
    =>
    (assert (person(name ?name) (age ?age) (gender ?gender)))
    (retract ?insert)
)

(defrule insertSenior
    
    ?insert <- (insert ?name ?age&:(>= ?age 25) ?gender)
    =>
    (assert (senior(name ?name) (age ?age) (gender ?gender)))
    (retract ?insert)
)


(assert (view "male"))
(assert (insert "Bryan" 50 "male"))
(run)
(fuck)


