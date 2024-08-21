--Alter Operation
-- Part - A

--Add two more columns City VARCHAR(20) and Pincode INT
ALTER TABLE DEPOSIT ADD City VARCHAR(20), Pincode INT

--Change the size of CNAME column from VARCHAR(50) to VARCHAR(35)
ALTER TABLE DEPOSIT ALTER COLUMN CNAME VARCHAR(35)

--Change the data type DECIMAL to INT in amount Column
ALTER TABLE DEPOSIT ALTER COLUMN AMOUNT INT

--Rename Column ActNo to ANO
SP_RENAME 'DEPOSIT.ActNo', 'ANO' , 'COLUMN'

--Delete Column City from the DEPOSIT table
ALTER TABLE DEPOSIT DROP COLUMN City

--Change name of table DEPOSIT to DEPOSIT_DETAIL
SP_RENAME 'DEPOSIT', 'DEPOSIT_DETAIL'


-- Part - B

--Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table
SP_RENAME 'DEPOSIT_DETAIL.ADATE', 'AOPENDATE' , 'COLUMN'

--Delete Column AOPENDATE from the DEPOSIT_DETAIL table
ALTER TABLE DEPOSIT_DETAIL DROP COLUMN AOPENDATE

--Rename Column CNAME to CustomerName
SP_RENAME 'DEPOSIT.CNAME', 'CustomerName' , 'COLUMN'
 
-- Part - C

CREATE TABLE STUDENT_DETAIL 
(
	Enrollment_No	VARCHAR(20),
	Name			VARCHAR(25),
	CPI				DECIMAL(5,2),
	Birthdate		DATETIME
)

--Add two more columns City VARCHAR (20) NOT NULL and Backlog INT (NULL).
ALTER TABLE STUDENT_DETAIL ADD CITY VARCHAR(50) NOT NULL, BACKLOG INT NULL

--Change the size of NAME column of student from VARCHAR (25) to VARCHAR (35).
ALTER TABLE STUDENT_DETAIL ALTER COLUMN NAME VARCHAR(35)

--Change the data type DECIMAL to INT in CPI Column.
ALTER TABLE STUDENT_DETAIL ALTER COLUMN CPI INT

--Rename Column Enrollment_No to ENO.
SP_RENAME 'STUDENT_DETAIL.ENROLLMENT_NO', 'ENO', 'COLUMN'

--Delete Column City from the STUDENT table.
ALTER TABLE STUDENT_DETAIL DROP COLUMN CITY

--Change name of table STUDENT to STUDENT_MASTER.
SP_RENAME 'STUDENT_DETAIL', 'STUDENT_MASTER'

--Delete, Truncate, Drop

-- Part - A

CREATE TABLE DEPOSIT_DETAIL 
(
	ANO				INT,
	CustomerNAME	VARCHAR(50),
	BNAME			VARCHAR(50),
	AMOUNT			DECIMAL(8,2),
	PINCODE			int
) 

INSERT INTO DEPOSIT_DETAIL (ANO, CustomerNAME, BNAME, AMOUNT, PINCODE) VALUES (101, 'ANIL', 'VRCE', 1000.00, 360001)
INSERT INTO DEPOSIT_DETAIL (ANO, CustomerNAME, BNAME, AMOUNT, PINCODE) VALUES (102, 'SUNIL', 'AJNI', 5000.00, 360002)
INSERT INTO DEPOSIT_DETAIL (ANO, CustomerNAME, BNAME, AMOUNT, PINCODE) VALUES (103, 'MEHUL', 'KAROLBAGH', 3500.00, 360003)
INSERT INTO DEPOSIT_DETAIL (ANO, CustomerNAME, BNAME, AMOUNT, PINCODE) VALUES (104, 'MADHURI', 'CHANDI', 1200.00, 360004)
INSERT INTO DEPOSIT_DETAIL (ANO, CustomerNAME, BNAME, AMOUNT, PINCODE) VALUES (105, 'PRMOD', 'M.G. ROAD', 3000.00, 360005)
INSERT INTO DEPOSIT_DETAIL (ANO, CustomerNAME, BNAME, AMOUNT, PINCODE) VALUES (106, 'SANDIP', 'ANDHERI', 2000.00, 360006)
INSERT INTO DEPOSIT_DETAIL (ANO, CustomerNAME, BNAME, AMOUNT, PINCODE) VALUES (107, 'SHIVANI', 'VIRAR', 1000.00, 360006)
INSERT INTO DEPOSIT_DETAIL (ANO, CustomerNAME, BNAME, AMOUNT, PINCODE) VALUES (108, 'KRANTI', 'NEHRU PLACE', 5000.00, 360008)
INSERT INTO DEPOSIT_DETAIL (ANO, CustomerNAME, BNAME, AMOUNT, PINCODE) VALUES (109, 'MINU', 'POWAI', 7000.00, 360002)
	 
--Delete all the records of DEPOSIT_DETAIL table having amount greater than and equals to 4000. 
DELETE FROM DEPOSIT_DETAIL WHERE AMOUNT >= 4000

--Delete all the accounts CHANDI BRANCH.
DELETE FROM DEPOSIT_DETAIL WHERE BNAME='CHANDI'

--Delete all the accounts having account number (ANO) is greater than 105.
DELETE FROM DEPOSIT_DETAIL WHERE ANO > 105
		
--Delete all the records of Deposit_Detail table. (Use Truncate)
TRUNCATE TABLE DEPOSIT_DETAIL

--Remove Deposit_Detail table. (Use Drop)
DROP TABLE DEPOSIT_DETAIL

		
-- Part - B

CREATE TABLE EMPLOYEE_MASTER
(
	EmpNo		int,
	EmpName		varchar(25),
	JoiningDate DateTime,
	Salary		Decimal(8,2),
	City		Varchar(20)
)

INSERT INTO EMPLOYEE_MASTER(EmpNo, EmpName, JoiningDate, Salary,CITY) 
VALUES(101,'KEYUR','2002-01-05',12000,'RAJKOT')

INSERT INTO EMPLOYEE_MASTER(EmpNo, EmpName, JoiningDate, Salary,CITY) 
VALUES(102,'HARDIK','2004-02-15',14000,'AHMEDABAD')

INSERT INTO EMPLOYEE_MASTER(EmpNo, EmpName, JoiningDate, Salary,CITY) 
VALUES(103,'KAJAL','2006-03-14',15000,'BARODA')

INSERT INTO EMPLOYEE_MASTER(EmpNo, EmpName, JoiningDate, Salary,CITY) 
VALUES(104,'BHOOMI','2005-06-05',12500,'AHMEDABAD')

INSERT INTO EMPLOYEE_MASTER(EmpNo, EmpName, JoiningDate, Salary,CITY) 
VALUES(105,'HARMIT','2004-02-15',14000,'RAJKOT')



--Delete all the records of Employee_MASTER table having salary greater than and equals to 14000
DELETE FROM Employee_MASTER WHERE Salary >= 14000

--Delete all the Employees who belongs to ‘RAJKOT’ city
DELETE FROM Employee_MASTER WHERE City = 'RAJKOT'

--Delete all the Employees who joined after 1-1-2007
DELETE FROM Employee_MASTER WHERE JoiningDate > '2007-01-01'

--Delete the records of Employees whose joining date is null and Name is not null.
DELETE FROM EMPLOYEE_MASTER WHERE JoiningDate IS NULL AND EmpName IS NOT NULL

--Delete the records of Employees whose salary is 50% of 20000.
DELETE FROM EMPLOYEE_MASTER WHERE Salary = 20000*0.50

--Delete the records of Employees whose City Name is not empty.
DELETE FROM EMPLOYEE_MASTER WHERE CITY IS NOT NULL

--Delete all the records of Employee_MASTER table (Use Truncate)
TRUNCATE TABLE Employee_MASTER

--Remove Employee_MASTER table (Use Drop)
DROP TABLE Employee_MASTER


-- Part - C

--1. Summarize Delete, Truncate and Drop
-- DELETE: Removes rows from a table based on a condition.
-- TRUNCATE: Removes all Data(Rows) from a table.
-- DROP: Removes the entire table including its structure and data from the Database.