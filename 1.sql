--1. 
SET AUTOCOMMIT OFF;
SET TRANSACTION NAME 'first_update';
INSERT INTO CUSTOMER(CUST_NBR, FNAME, LNAME) VALUES (110, 'Tom', 'Smith');
INSERT INTO CUSTOMER(CUST_NBR, FNAME, LNAME) VALUES (111, 'Mary', 'Jones');
INSERT INTO EMPLOYEE(EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES (306, 'Harold', 'Potter', 304);
INSERT INTO CUST_ORDER(ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE, PRODUCT_NBR) VALUES (1026, 110, 306, 550.98, 109);
INSERT INTO CUST_ORDER(ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE, PRODUCT_NBR) VALUES (1027, 111, 306, 57.50, 109);
COMMIT;

--Output - Commit complete.

--2.
SET AUTOCOMMIT OFF;
SET TRANSACTION NAME 'first_update';
INSERT INTO CUSTOMER(CUST_NBR, FNAME, LNAME) VALUES (110, 'Tom', 'Smith');
INSERT INTO CUSTOMER(CUST_NBR, FNAME, LNAME) VALUES (111, 'Mary', 'Jones');
INSERT INTO EMPLOYEE(EMP_ID, FNAME, LNAME, MANAGER_EMP_ID) VALUES (306, 'Harold', 'Potter', 304);
INSERT INTO CUST_ORDER(ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE, PRODUCT_NBR) VALUES (1026, 110, 306, 550.98, 109);
INSERT INTO CUST_ORDER(ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE, PRODUCT_NBR) VALUES (1027, 111, 306, 57.50, 109);
SAVEPOINT first_savepoint;
INSERT INTO CUST_ORDER(ORDER_NBR, CUST_NBR, SALES_EMP_ID, SALE_PRICE, PRODUCT_NBR) VALUES (1028, 111, 306, 999.50, 109);
COMMIT;
ROLLBACK TO SAVEPOINT first_savepoint;
SELECT * FROM CUST_ORDER WHERE ORDER_NBR = 1028;

--Output - no rows selected

--3. 
SELECT * FROM CUST_ORDER WHERE ORDER_NBR = 1028;

--Output:
--no rows selected

SELECT * FROM CUST_ORDER WHERE ORDER_NBR = 1027;

/*Output:

ORDER_NBR	CUST_NBR	SALES_EMP_ID	SALE_PRICE	PRODUCT_NBR
----------	----------	------------	----------	-----------
     1027		 111			 306		  --   --  57.5			109

*/
SELECT * FROM CUST_ORDER WHERE ORDER_NBR = 1026;

/*Output:

ORDER_NBR	CUST_NBR	SALES_EMP_ID	SALE_PRICE	PRODUCT_NBR
----------	----------	------------	----------	-----------
      1026		 110			 306		550.98			109

The two inserts before the savepoint were inserted although the last, failed query, was not.
*/
 
--4. 
CONNECT SYSTEM/password;
CREATE USER auser IDENTIFIED BY password;
CONNECT jamescoll/password; (This must be done by table owner NOT SYSTEM)
GRANT SELECT, INSERT, UPDATE, DELETE ON EMPLOYEE TO auser;
--Output: Grant succeeded.

CONNECT auser/password;
SELECT * FROM jamescoll.EMPLOYEE;
Output: 

	EMP_ID	FNAME		LNAME 			MANAGER_EMP_ID	
----------	----------	------------	--------------		
      302	Mila		Freeman						305			

..etc..

--5. 
CONNECT jamescoll/password;
REVOKE DELETE ON EMPLOYEE FROM bobjones;
--Output: Revoke Succeeded.

CONNECT auser/password;
DELETE FROM jamescoll.EMPLOYEE WHERE EMP_ID = 302;

/*Output:
Error at line 1:
ORA-01031: insufficient privileges.
*/
--6.
SELECT CUSTOMER.FNAME, CUSTOMER.LNAME, CUST_ORDER.ORDER_NBR, CUST_ORDER.CUSTOMER_NBR FROM CUSTOMER JOIN CUST_ORDER ON CUSTOMER.CUST_NBR = CUST_ORDER.CUST_NBR WHERE SALE_PRICE = (SELECT MIN(SALE_PRICE) FROM CUST_ORDER);

Output:
FNAME			LNAME					ORDER_NBR	CUST_NBR
---------------	------------------ -------------- ----------
Nigel			Kennedy						1024		109


--7. 
SET AUTOCOMMIT OFF;
SET TRANSACTION NAME 'second_update';
INSERT INTO CUSTOMER(CUST_NBR, FNAME, LNAME) VALUES (112, 'Harry', 'Kleine');
INSERT INTO CUSTOMER(CUST_NBR, FNAME, LNAME) VALUES (113, 'Xavier', 'Neills');
SAVEPOINT second_savepoint;
INSERT INTO CUSTOMER(CUST_NBR, FNAME, LNAME) VALUES (113, Bob, Jones);
Output: Error at Line1 - ORA-00984 column not allowed here.
ROLLBACK TO SAVEPOINT second_savepoint;
COMMIT;
--Output: Commit complete

SELECT * FROM CUSTOMER ORDER BY CUST_NBR DESC;

/*Output:
CUST_NBR	FNAME		LNAME
-----------	----------	----------
		113	Xavier		Neills
		112 Harry		Kleine
etc...

Data prior to savepoint successfully entered.
*/











