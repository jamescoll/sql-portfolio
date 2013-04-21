--Number 1
CREATE OR REPLACE PROCEDURE myFor 
IS counter NUMBER;
BEGIN
FOR counter IN 1..100
LOOP
DBMS_OUTPUT.PUT_LINE('Index value is: ' || counter);
END LOOP;
END myFor;
--Output: PL/SQL Procedure Created.
BEGIN
myFor;
END;
/
/*Output
Index value is 1
Index value is 2
....
Index value is 100
*/


--Number 2
CREATE OR REPLACE PROCEDURE nestFor 
IS counter NUMBER; innercounter NUMBER;
BEGIN
FOR counter IN 1..10
LOOP
	FOR innercounter IN 1..10
	LOOP
	DBMS_OUTPUT.PUT_LINE(counter || '.' || innercounter);
	END LOOP;
END LOOP;
END nestFor;
--Output: PL/SQL Procedure Created.
BEGIN
nestFor;
END;
/

/*Output
1.1
1.2
....
10.10
*/

--Number 3
CREATE OR REPLACE PROCEDURE PrintNotPrime 
IS a NUMBER(3); b NUMBER(3);
BEGIN
a := 2;
LOOP
	b := 2;
	LOOP
	    	exit WHEN((mod(a,b)=0) or (b = a));
		b := b + 1;
	END LOOP;
IF (b != a) THEN
	DBMS_OUTPUT.PUT_LINE(a || ' is not prime');
END IF;
a := a + 1;
exit WHEN a = 31;
END LOOP;
END PrintNotPrime;
--Output: PL/SQL Procedure Created.
BEGIN
PrintNotPrime;
END;
/

/*Output
4 is not prime
6 is not prime
8 is not prime
....
28 is not prime
30 is not prime
*/



--Number 4 

CREATE SEQUENCE empid_seq

START WITH 400
INCREMENT BY 1;
 

--Output: Sequence created.
CREATE OR REPLACE TRIGGER empid_trig

BEFORE INSERT ON employee

FOR EACH ROW
BEGIN

SELECT empid_seq.nextval INTO :new.EMP_ID FROM DUAL;

END;

/
 
--Output: Trigger created.

INSERT INTO EMPLOYEE (FNAME, LNAME, MANAGER_EMP_ID) VALUES ('Karl', 'Marks', 304);
 


--Output: 1 row created.

SELECT * FROM EMPLOYEE;
/*Output


	EMP_ID FNAME		LNAME	         MANAGER_EMP_ID
-------------- ---------------- ---------------- --------------
	   302 Mila             Freeman                     305
	   400 Karl             Marks                       400
           305 Stewart          Fulbright		    305
           306 Harold           Potter                      304
           304 Reno             Lopez                       304
           300 Jason            Chase                       304
           301 James            Mason   		    304
           303 Michael          Berry                       305

8 rows selected.

*/

--Number 5
--First create new column for Salary and then populate the salary column (not shown)
CREATE OR REPLACE TRIGGER empsal_trig

AFTER INSERT ON employee

FOR EACH ROW
BEGIN
IF :new.SALARY>100000 THEN
	 DBMS_OUTPUT.PUT_LINE('Employee: ' || :new.EMP_ID ||' has salary ' || :new.SALARY);
END IF;

END;
--Output: Trigger created.
--Try an insert with salary above 100000
INSERT INTO EMPLOYEE(FNAME, LNAME, MANAGER_EMP_ID, SALARY) VALUES ('Vlad', 'Lenin', 304, 110000);
/*Output:
Employee: 401 has salary 110000

1 row created.
*/
--Try an insert with salary below 100000
INSERT INTO EMPLOYEE(FNAME, LNAME, MANAGER_EMP_ID, SALARY) VALUES ('Leo', 'Trots', 304, 90000);
/*Output:
1 row created.
*/

--Number 6 
DECLARE 
	counter NUMBER;
	manempid NUMBER;
	salary NUMBER;
	refval NUMBER;
BEGIN
--start cont
FOR counter IN 1..1000
LOOP
	refval := 2;
	--we will select the manager emp id using a simple mod
	IF (mod(counter, refval)=0) THEN
	manempid := 304;
	ELSE 
	manempid := 305;	
	END IF;
	--we will make a larger large of salaries using the same technique
	refval := 5;	
	IF (mod(counter, refval)=0) THEN
	salary := 75000;
	ELSIF (mod(counter, refval)=1) THEN
	salary := 80000; 
	ELSIF (mod(counter, refval)=2) THEN
	salary := 90000; 
	ELSIF (mod(counter, refval)=3) THEN
	salary := 100000; 
	ELSIF (mod(counter, refval)=4) THEN
	salary := 110000; 
	END IF;
	--we are not required to enter difference name values
	INSERT INTO EMPLOYEE(FNAME, LNAME, MANAGER_EMP_ID, SALARY) VALUES ('Bob', 'Jones', manempid, salary);
END LOOP;
END;
/

--Output: PL/SQL Procedure Created.
--EMPLOYEE TABLE NOW HAS 1008 ROWS.

--Number 7 
DECLARE
	salary_over_90000 EXCEPTION;
	CURSOR empcur IS SELECT FNAME, LNAME, SALARY FROM EMPLOYEE;
	v_employee_row empcur%ROWTYPE;
BEGIN
OPEN empcur;
FETCH empcur INTO v_employee_row;
WHILE empcur%FOUND 
LOOP
IF v_employee_row.SALARY<20000 THEN
	RAISE_APPLICATION_ERROR(-20000, 'Salary Lower Than 20000');
END IF;
IF v_employee_row.SALARY>90000 THEN
	RAISE salary_over_90000;
END IF;
FETCH empcur INTO v_employee_row;
END LOOP;
CLOSE empcur;

EXCEPTION  
	WHEN salary_over_90000 THEN
	DBMS_OUTPUT.PUT_LINE('Employee Salary over 90000 detected.');
	RAISE;
END;
/
--We would expect an error on output
/*Output
DECLARE
*
ERROR at Line 1:
ORA-06510:PL/SQL: unhandled user-defined exception
ORA-06512: at line 23
*/



--Number 8
DECLARE
myNum NUMBER; 
BEGIN
	--No employee with ID 14000 exists - this will throw a no data found exception
	SELECT salary INTO myNum FROM EMPLOYEE WHERE EMP_ID = 14000; 
EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE('Data not found!');
END;
/
/*Output
Data not found!

PL/SQL procedure successful
*/
