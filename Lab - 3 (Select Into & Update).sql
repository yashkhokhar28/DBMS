-- Select into Operation
-- Part - A

CREATE TABLE CRICKET
(
	NAME	VARCHAR(50),
	CITY	VARCHAR(50),
	AGE		INT
)

INSERT INTO CRICKET(NAME, CITY, AGE) VALUES('SACHIN TENDULKAR', 'MUMBAI', 30)
INSERT INTO CRICKET(NAME, CITY, AGE) VALUES('RAHUL DRAVID', 'BOMBAY', 35)
INSERT INTO CRICKET(NAME, CITY, AGE) VALUES('M.S. DHONI ', 'JHARKHAAND', 31)
INSERT INTO CRICKET(NAME, CITY, AGE) VALUES('SURESH RAINA', 'GUJARAT', 30)

--Create table Worldcup from cricket with all the columns and data. 
SELECT * INTO WORLDCUP FROM CRICKET
SELECT * FROM WORLDCUP

--Create table T20 from cricket with first two columns with no data.
SELECT NAME, CITY INTO T20 FROM CRICKET WHERE 1 = 0
SELECT * FROM T20

--Create table IPL From Cricket with No Data
SELECT * INTO IPL FROM CRICKET WHERE 1 = 0
SELECT * FROM IPL

-- Part - B

CREATE TABLE EMPLOYEE
(
	NAME	VARCHAR(50),
	CITY	VARCHAR(50),
	AGE		INT
)

INSERT INTO EMPLOYEE(NAME, CITY, AGE) VALUES('JAY PATEL','RAJKOT', 30)
INSERT INTO EMPLOYEE(NAME, CITY, AGE) VALUES('RAHUL DAVE', 'BARODA', 35)
INSERT INTO EMPLOYEE(NAME, CITY, AGE) VALUES('JEET PATEL', 'SURAT', 31)
INSERT INTO EMPLOYEE(NAME, CITY, AGE) VALUES('VIJAY RAVAL', 'RAJKOT', 30)

--Create table Employee_detail from Employee with all the columns and data.
SELECT * INTO EMPLOYEE_DETAIL FROM EMPLOYEE
SELECT * FROM EMPLOYEE_DETAIL

--Create table Employee_data from Employee with first two columns with no data.
SELECT NAME, CITY INTO EMPLOYEE_DATA FROM EMPLOYEE WHERE 1 = 0
SELECT * FROM EMPLOYEE_DATA

--Create table Employee_info from Employee with no Data
SELECT * INTO EMPLOYEE_INFO FROM EMPLOYEE WHERE 1 = 0
SELECT * FROM EMPLOYEE_INFO


-- Part - C

--Insert the Data into Employee_info from Employee Whose CITY is Rajkot
INSERT INTO EMPLOYEE_INFO SELECT * FROM EMPLOYEE WHERE CITY = 'RAJKOT'
SELECT * FROM EMPLOYEE_INFO

--Insert the Data into Employee_info from Employee Whose age is more than 32.
INSERT INTO EMPLOYEE_INFO SELECT * FROM EMPLOYEE WHERE AGE > 32
SELECT * FROM EMPLOYEE_INFO

--Update Operation

-- Part - A

--Update deposit amount of all customers from 3000 to 5000.
UPDATE DEPOSIT SET AMOUNT=5000 WHERE AMOUNT=3000

--Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table)
UPDATE BORROW SET BNAME='C.G.ROAD' WHERE CNAME='ANIL'

--Update Account No of SANDIP to 111 & Amount to 5000.
UPDATE DEPOSIT SET ACTNO=111,AMOUNT=5000 WHERE CNAME ='SANDIP'

--Update amount of KRANTI to 7000
UPDATE BORROW SET AMOUNT=7000 WHERE CNAME='KRANTI'
	
--Update branch name from ANDHERI to ANDHERI WEST. (Use Branch Table)
UPDATE BRANCH SET BNAME='ANDHERI WEST' WHERE BNAME='ANDHERI'

--Update branch name of MEHUL to NEHRU PALACE.
UPDATE BORROW SET BNAME='NEHRU PALACE' WHERE CNAME='MEHUL'

--Update deposit amount of all depositors to 5000 whose account no between 103 & 107.
UPDATE DEPOSIT SET AMOUNT=5000 WHERE ACTNO > 103 AND ACTNO<107
SELECT * FROM DEPOSIT

--Update ADATE of ANIL to 1-4-95
UPDATE DEPOSIT SET ADATE='1995-04-01' WHERE CNAME='ANIL'

--Update the amount of MINU to 10000.
UPDATE DEPOSIT SET AMOUNT=10000 WHERE CNAME='MINU'

--Update deposit amount of PRAMOD to 5000 and ADATE to 1-4-96
UPDATE DEPOSIT SET AMOUNT=5000, ADATE='1996-04-01' WHERE CNAME='PRAMOD'


-- Part - B

--Give 10% Increment in Loan Amount.
UPDATE BORROW SET AMOUNT=(AMOUNT+AMOUNT*0.10)

--Customer deposits additional 20% amount to their account, update the same. 
UPDATE DEPOSIT SET AMOUNT=(AMOUNT+AMOUNT*0.20)

-- Part - C
	
--Update amount of loan no 321 to NULL.
UPDATE BORROW SET AMOUNT=NULL WHERE LOANNO=321

--Update branch name of KRANTI to NULL (Use Borrow Table)
UPDATE BORROW SET BName=NULL WHERE CNAME='KRANTI'

--Display the name of borrowers whose amount is NULL.
SELECT CNAME FROM BORROW WHERE AMOUNT IS NULL

--Display the Borrowers whose having branch.
SELECT * FROM Borrow WHERE BNAME IS NOT NULL

--Update the Loan Amount to 5000, Branch to VRCE & Customer Name to Darshan whose loan no is 481.
UPDATE Borrow SET Amount=5000, BName='VRCE', CName='DARSHAN' WHERE LOANNO=481

--Update the Deposit table and set the date to 01-01-2021 for all the borrowers which amount is less than 2000.
UPDATE DEPOSIT SET ADATE='2021-01-01' WHERE CNAME IN (SELECT CNAME FROM BORROW WHERE AMOUNT < 2000  )

--Update the date to NULL & Branch name to ‘ANDHERI whose Account No is 110.
UPDATE DEPOSIT SET ADATE=NULL , BNAME='ANDHERI' WHERE ACTNO=110