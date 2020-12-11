qNum& = 0       ' Total number of answered questions
answers$ = ""   ' Unique answers given by a group
groupNum% = 0   ' Count groups for debug messages


' Intersect existing answers with a new person's
SUB addToQuestions (person$, firstPerson%)
    SHARED answers$

    IF firstPerson% = 1 THEN
        ' Populate answers set
        answers$ = person$
    ELSE
        ' Intersect with existing set
        newans$ = ""
        FOR i=1 TO LEN(answers$)
            char$ = MID$(answers$, i, 1)
            idx% = INSTR(person$, char$)

            IF idx% <> 0 THEN
                newans$ = newans$ + char$
            END IF
        NEXT i
        answers$ = newans$
    END IF
END SUB


' Reset answers string and increase total questions counter
SUB nextGroup
    SHARED qNum&
    SHARED groupNum%
    SHARED answers$

    groupNum% = groupNum% + 1
    PRINT "Parsing group number:", groupNum%

    qNum& = qNum& + LEN(answers$)
    PRINT "Answers:", answers$, "LEN:", LEN(answers$)
    PRINT "Tot q. Num.:", qNum&

    answers$ = ""
END SUB


OPEN "inCLRF" FOR INPUT AS 1
firstPerson% = 1    ' The first person defines the first set for the intersections

DO WHILE NOT EOF(1)
    INPUT #1, l$

    IF l$ = "" THEN
        nextGroup
        firstPerson% = 1

        ' INPUT "Proceed"; tmp$
        ' IF tmp$ = "q" THEN GOTO 500
    ELSE
        addToQuestions l$, firstPerson%
        firstPerson% = 0
    END IF
LOOP

500 PRINT "Total number of questions:", qNum&
