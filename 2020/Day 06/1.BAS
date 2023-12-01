qNum& = 0       ' Total number of answered questions
answers$ = ""   ' Unique answers given by a group
groupNum% = 0   ' Count groups for debug messages


' Add person's answers to list if not already present
SUB addToQuestions (person$)
    SHARED answers$

    FOR i=1 TO LEN(person$)
        char$ = MID$(person$, i, 1)
        idx% = INSTR(answers$, char$)

        IF idx% = 0 THEN
            answers$ = answers$ + char$
        END IF
    NEXT i
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

DO WHILE NOT EOF(1)
    INPUT #1, l$

    IF l$ = "" THEN
        nextGroup
        'INPUT "Proceed"; tmp$
        'IF tmp$ = "q" THEN GOTO 500
    ELSE
        addToQuestions(l$)
    END IF
LOOP

500 PRINT "Total number of questions:", qNum&
