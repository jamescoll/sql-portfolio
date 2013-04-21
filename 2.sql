--Number 1
CONNECT jamescoll/password
--Output: Connected.
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE HelloWorldProc
IS
BEGIN
	DBMS_OUTPUT.PUT_LINE('Hello world');
END HelloWorldProc;
/
--Output: Procedure Created.
BEGIN
	HelloWorldProc();
END;
/
/*Output:
Hello world

PL/SQL procedure successfully completed.
*/

--Number 2
CONNECT jamescoll/password
--Output: Connected.
CREATE OR REPLACE PROCEDURE OutputNames (firstname IN VARCHAR2, surname IN VARCHAR2)
IS
BEGIN
	DBMS_OUTPUT.PUT_LINE('Firstname: ' || lower(firstname) || ' ' ||'Surname: ' || lower(surname) );
	DBMS_OUTPUT.PUT_LINE('Firstname: ' || upper(firstname) || ' ' ||'Surname: ' || upper(surname) );
	DBMS_OUTPUT.PUT_LINE('Firstname: ' || initcap(firstname) || ' ' ||'Surname: ' || initcap(surname) );
END OutputNames;
/
--Output: Procedure Created.
BEGIN
	OutputNames('James', 'Coll');
END;
/
/*Output
Firstname: james Surname: coll
Firstname: JAMES Surname: COLL
Firstname: James Surname: Coll

PL/SQL procedure successfully completed.
*/

--Number 3
CONNECT jamescoll/password
--Output: Connected
CREATE OR REPLACE PROCEDURE PrintName(fullname IN VARCHAR)
IS localvar NUMBER;
BEGIN
SELECT VSIZE(fullname) INTO localvar FROM DUAL;
DBMS_OUTPUT.PUT_LINE('Internal Size: ' || localvar);
DBMS_OUTPUT.PUT_LINE(TRIM(INITCAP(fullname)));
END PrintName;
/
--Output: Procedure Created.
BEGIN
	PrintName('    James Coll   ');
END;

/*Output
Internal Size: 20
James Coll

PL/SQL procedure successfully completed.
*/

--Number 4 
CREATE OR REPLACE PROCEDURE RemoveVowels (stringinput IN OUT VARCHAR)
IS 
BEGIN
SELECT(REPLACE(stringinput, 'a', '')) INTO stringinput FROM DUAL;
SELECT(REPLACE(stringinput, 'e', '')) INTO stringinput FROM DUAL;
SELECT(REPLACE(stringinput, 'i', '')) INTO stringinput FROM DUAL;
SELECT(REPLACE(stringinput, 'o', '')) INTO stringinput FROM DUAL;
SELECT(REPLACE(stringinput, 'u', '')) INTO stringinput FROM DUAL;
SELECT(REPLACE(stringinput, 'A', '')) INTO stringinput FROM DUAL;
SELECT(REPLACE(stringinput, 'E', '')) INTO stringinput FROM DUAL;
SELECT(REPLACE(stringinput, 'I', '')) INTO stringinput FROM DUAL;
SELECT(REPLACE(stringinput, 'O', '')) INTO stringinput FROM DUAL;
SELECT(REPLACE(stringinput, 'U', '')) INTO stringinput FROM DUAL;
DBMS_OUTPUT.PUT_LINE(stringinput);
END RemoveVowels;
/
--Output: Procedure Created.
DECLARE myvar VARCHAR(100) := 'The lazy brown hedgehog jumped quickly over the fox';
BEGIN
RemoveVowels(myvar);
END;
/
/*
Th lzy brwn hdghg jmpd qckly vr th fx

PL/SQL procedure successfully completed.
*/


--Number 5
CREATE OR REPLACE FUNCTION multTwo (input IN NUMBER)
RETURN NUMBER
IS multTwo NUMBER;
BEGIN
multTwo := input*2;
RETURN multTwo;
END multTwo;
--Output: Function Created.
SELECT multTwo(20) FROM DUAL;
/
/*Output
MULTTWO(20)
-----------
	40
*/


--Number 6
CREATE OR REPLACE FUNCTION AddFiveMinusOne (first IN NUMBER, second IN NUMBER, third IN NUMBER, fourth IN NUMBER, fifth IN NUMBER)
RETURN NUMBER
IS sumtotal NUMBER;
BEGIN
sumtotal := (first+second+third+fourth+fifth)-1;
RETURN sumtotal;
END AddFiveMinusOne;
--Output: Function Created.
SELECT AddFiveLessOne(1,2,3,4,5) FROM DUAL;
/*Output
ADDFIVEMINUSONE(1,2,3,4,5)
--------------------------
			14
*/

--Number 7
CREATE OR REPLACE PACKAGE overload_pkg AS
FUNCTION FunctionX(first IN NUMBER, second IN NUMBER) RETURN NUMBER;
FUNCTION FunctionX(first IN NUMBER, second IN NUMBER, third IN NUMBER) RETURN NUMBER;
FUNCTION FunctionX(first IN NUMBER, second IN NUMBER, third IN NUMBER, fourth IN NUMBER) RETURN NUMBER;
FUNCTION FunctionX(first IN NUMBER, second IN NUMBER, third IN NUMBER, fourth IN NUMBER, fifth IN NUMBER) RETURN NUMBER;
END;
/
--Body	  
CREATE OR REPLACE PACKAGE BODY overload_pkg AS
FUNCTION FunctionX (first IN NUMBER, second IN NUMBER)
RETURN NUMBER
IS sumtotal NUMBER;
BEGIN
sumtotal := (first+second)-1;
RETURN sumtotal;
END FunctionX;
FUNCTION FunctionX (first IN NUMBER, second IN NUMBER, third IN NUMBER)
RETURN NUMBER
IS sumtotal NUMBER;
BEGIN
sumtotal := (first+second+third)-1;
RETURN sumtotal;
END FunctionX;
FUNCTION FunctionX (first IN NUMBER, second IN NUMBER, third IN NUMBER, fourth IN NUMBER)
RETURN NUMBER
IS sumtotal NUMBER;
BEGIN
sumtotal := (first+second+third+fourth)-1;
RETURN sumtotal;
END FunctionX;
FUNCTION FunctionX (first IN NUMBER, second IN NUMBER, third IN NUMBER, fourth IN NUMBER, fifth IN NUMBER)
RETURN NUMBER
IS sumtotal NUMBER;
BEGIN
sumtotal := (first+second+third+fourth+fifth)-1;
RETURN sumtotal;
END FunctionX;
BEGIN -- Initialisation
DBMS_OUTPUT.PUT_LINE('Initialising package...');
END;
/
--Output - Package body created.

--Some test cases - see below for dbms_putline test output

SELECT overload_pkg.FunctionX(1,2) FROM DUAL;
/*
OVERLOAD_PKG.FUNCTIONx(1,2)
---------------------------
			2
*/

SELECT overload_pkg.FunctionX(1,2,3,4,5) FROM DUAL;
/*
OVERLOAD_PKG.FUNCTIONx(1,2,3,4,5)
---------------------------------
			       14
*/
--Using dbms_output.put_line to demonstrate
DECLARE
myVar NUMBER;
BEGIN
SELECT overload_pkg.FunctionX(1,2,3,4,5) INTO myVar FROM DUAL;
DBMS_OUTPUT.PUT_LINE('Answer is ' || myVar);
END;
/
/*Output
Answer is 14
*/
