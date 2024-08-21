--LAB 13

--CITY table
CREATE TABLE CITY 
(
	CityID INT PRIMARY KEY,
	Name VARCHAR(100) UNIQUE NOT NULL,
	Pincode INT NOT NULL,
	Remarks VARCHAR(255)
)


--VILLAGE table
CREATE TABLE VILLAGE 
(
	VID INT PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	CityID INT FOREIGN KEY (CityID) REFERENCES CITY(CityID)
)


--Inserting data into CITY
INSERT INTO CITY (CityID, Name, Pincode, Remarks) VALUES(1, 'Rajkot', 360005, 'Good')
INSERT INTO CITY (CityID, Name, Pincode, Remarks) VALUES(2, 'Surat', 335009, 'Very Good')
INSERT INTO CITY (CityID, Name, Pincode, Remarks) VALUES(3, 'Baroda', 390001, 'Awesome')
INSERT INTO CITY (CityID, Name, Pincode, Remarks) VALUES(4, 'Jamnagar', 361003, 'Smart')
INSERT INTO CITY (CityID, Name, Pincode, Remarks) VALUES(5, 'Junagadh', 362229, 'Historic')
INSERT INTO CITY (CityID, Name, Pincode, Remarks) VALUES(6, 'Morvi', 363641, 'Ceramic')

--Inserting hypothetical data into VILLAGE
INSERT INTO VILLAGE (VID, Name, CityID) VALUES(101, 'Raiya', 1)
INSERT INTO VILLAGE (VID, Name, CityID) VALUES(102, 'Madhapar', 1)
INSERT INTO VILLAGE (VID, Name, CityID) VALUES(103, 'Dodka', 3)
INSERT INTO VILLAGE (VID, Name, CityID) VALUES(104, 'Falla', 4)
INSERT INTO VILLAGE (VID, Name, CityID) VALUES(105, 'Bhesan', 5)
INSERT INTO VILLAGE (VID, Name, CityID) VALUES(106, 'Dhoraj', NULL)

--PART A

--Display all the villages of Rajkot city. 
SELECT V.Name AS VillageName
FROM VILLAGE V
JOIN CITY C ON V.CityID = C.CityID
WHERE C.Name = 'Rajkot'

--Display city along with their villages & pin code.
SELECT C.Name AS CityName, V.Name AS VillageName, C.Pincode
FROM VILLAGE V
JOIN CITY C ON V.CityID = C.CityID

--Display the city having more than one village.
SELECT C.Name AS CityName
FROM VILLAGE V
JOIN CITY C ON V.CityID = C.CityID
GROUP BY C.Name
HAVING COUNT(V.VID) > 1

--Display the city having no village.
SELECT C.Name AS CityName
FROM CITY C
LEFT JOIN VILLAGE V ON C.CityID = V.CityID
WHERE V.VID IS NULL

--Count the total number of villages in each city.
SELECT C.Name AS CityName, COUNT(V.VID) AS NumberOfVillages
FROM CITY C
LEFT JOIN VILLAGE V ON C.CityID = V.CityID
GROUP BY C.Name

--Count the number of cities having more than one village
SELECT COUNT(*) AS NumberOfCities
FROM (
	SELECT C.CityID
	FROM VILLAGE V
	JOIN CITY C ON V.CityID = C.CityID
	GROUP BY C.CityID
	HAVING COUNT(V.VID) > 1
) AS CityWithMultipleVillages


-------------CONSTRAINTS------------------
--1. Do not allow SPI more than 10
--2. Do not allow Bklog less than 0.
--3. Enter the default value as ‘General’ in branch to all new records IF no other value is specified.
	
CREATE TABLE STU_MASTER 
(
	Rno INT PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	Branch VARCHAR(50) DEFAULT 'General',
	SPI DECIMAL(4, 2) CHECK (SPI <= 10),
	Bklog INT CHECK (Bklog >= 0)
);

	
INSERT INTO STU_MASTER (Rno, Name, Branch, SPI, Bklog) VALUES(101, 'Raju', 'CE', 8.80, 0)
INSERT INTO STU_MASTER (Rno, Name, Branch, SPI, Bklog) VALUES(102, 'Amit', 'CE', 2.20, 3)
INSERT INTO STU_MASTER (Rno, Name, Branch, SPI, Bklog) VALUES(103, 'Sanjay', 'ME', 1.50, 6)
INSERT INTO STU_MASTER (Rno, Name, Branch, SPI, Bklog) VALUES(104, 'Neha', 'EC', 7.65, 0)
INSERT INTO STU_MASTER (Rno, Name, Branch, SPI, Bklog) VALUES(105, 'Meera', 'EE', 5.52, 2)
INSERT INTO STU_MASTER (Rno, Name, Branch, SPI, Bklog) VALUES(106, 'Mahesh', DEFAULT, 4.50, 3);


--Try to update SPI of Raju from 8.80 to 12.
UPDATE STU_MASTER SET SPI = 12 WHERE Rno = 101;

--Try to update Bklog of Neha from 0 to -1.
UPDATE STU_MASTER SET Bklog = -1 WHERE Rno = 104;

--PART B
--Create table as per following schema with proper validation and try to insert data which violate your validation.

--Emp_details(Eid, Ename, Did, Cid, Salary, Experience)
--Dept_details(Did, Dname)
--City_details(Cid, Cname)


CREATE TABLE Dept_details
(
	Did INT PRIMARY KEY,
	Dname VARCHAR(100) NOT NULL
)

CREATE TABLE City_details
(
	Cid INT PRIMARY KEY,
	Cname VARCHAR(100) NOT NULL
)

CREATE TABLE Emp_details 
(
	Eid INT PRIMARY KEY,
	Ename VARCHAR(100) NOT NULL,
	Did INT FOREIGN KEY (Did) REFERENCES Dept_details(Did),
	Cid INT FOREIGN KEY (Cid) REFERENCES City_details(Cid),
	Salary DECIMAL(10, 2) CHECK (Salary > 0),
	Experience INT CHECK (Experience >= 0),
    
)

--DATA INSERT WITH NULL ( DName)---
INSERT INTO Dept_details (Did, Dname) VALUES(1, 'HR')
INSERT INTO Dept_details (Did, Dname) VALUES(2, 'IT')


--DATA INSERT WITH NULL ( CName)---
INSERT INTO City_details (Cid, Cname) VALUES(1, NULL)
INSERT INTO City_details (Cid, Cname) VALUES(2, 'Los Angeles')
INSERT INTO City_details (Cid, Cname) VALUES(3, 'Chicago')

--INSERT DATA WITH NEGATIVE SALARY
INSERT INTO Emp_details (Eid, Ename, Did, Cid, Salary, Experience) VALUES(1, 'John Doe', 1, 1, -5000, 5)

--PART C

--Create table as per following schema with proper validation and try to insert data which violate your validation.
/*Emp_info(Eid, Ename, Did, Cid, Salary, Experience)
	Dept_info(Did, Dname)
	City_info(Cid, Cname, Did))
	District(Did, Dname, Sid)
	State(Sid, Sname, Cid)
	Country(Cid, Cname)*/

CREATE TABLE Country 
(
	Cid INT PRIMARY KEY,
	Cname VARCHAR(100) NOT NULL
)

CREATE TABLE State 
(
	Sid INT PRIMARY KEY,
	Sname VARCHAR(100) NOT NULL,
	Cid INT FOREIGN KEY (Cid) REFERENCES Country(Cid),
    
)


CREATE TABLE District 
(
	Did INT PRIMARY KEY,
	Dname VARCHAR(100) NOT NULL,
	Sid INT FOREIGN KEY (Sid) REFERENCES State(Sid)
)

CREATE TABLE City_info
(
	Cid INT PRIMARY KEY,
	Cname VARCHAR(100) NOT NULL,
	Did INT FOREIGN KEY (Did) REFERENCES District(Did)
)

CREATE TABLE Dept_info
(
	Did INT PRIMARY KEY,
	Dname VARCHAR(100) NOT NULL
)

CREATE TABLE Emp_info 
(
	Eid INT PRIMARY KEY,
	Ename VARCHAR(100) NOT NULL,
	Did INT FOREIGN KEY (Did) REFERENCES Dept_info(Did),
	Cid INT FOREIGN KEY (Cid) REFERENCES City_info(Cid),
	Salary DECIMAL(10, 2) CHECK (Salary > 0),
	Experience INT CHECK (Experience >= 0),
    
)

--Insert 5 records in each table

--COUNTRY TABLE

INSERT INTO Country (Cid, Cname) VALUES(1, 'INDIA')
INSERT INTO Country (Cid, Cname) VALUES(2, 'CHINA')
INSERT INTO Country (Cid, Cname) VALUES(3, 'PAKISTAN')
INSERT INTO Country (Cid, Cname) VALUES(4, 'AMERICA')
INSERT INTO Country (Cid, Cname) VALUES(5, 'Argentina')

--STATE TABLE

INSERT INTO State (Sid, Sname, Cid) VALUES(1, 'GUJARAT', 1)
INSERT INTO State (Sid, Sname, Cid) VALUES(2, 'RAJASTHAN', 2)
INSERT INTO State (Sid, Sname, Cid) VALUES(3, 'GOA', 3)
INSERT INTO State (Sid, Sname, Cid) VALUES(4, 'MP', 4)
INSERT INTO State (Sid, Sname, Cid) VALUES(5, 'UP', 5)

--DISTRICT TABLE

INSERT INTO District (Did, Dname, Sid) VALUES(1, 'RAJKOT', 1)
INSERT INTO District (Did, Dname, Sid) VALUES(2, 'JAIPUR', 2)
INSERT INTO District (Did, Dname, Sid) VALUES(3, 'SURAT', 3)
INSERT INTO District (Did, Dname, Sid) VALUES(4, 'INDOR', 4)
INSERT INTO District (Did, Dname, Sid) VALUES(5, 'AHMEDABAD', 5)

--CITY_INFO TABLE

INSERT INTO City_info (Cid, Cname, Did) VALUES(1, 'SURAT', 1)
INSERT INTO City_info (Cid, Cname, Did) VALUES(2, 'BARODA', 2)
INSERT INTO City_info (Cid, Cname, Did) VALUES(3, 'MORBI City', 3)
INSERT INTO City_info (Cid, Cname, Did) VALUES(4, 'DIU', 4)
INSERT INTO City_info (Cid, Cname, Did) VALUES(5, 'DAMAN', 5)

--DEPT_INFO TABLE
INSERT INTO Dept_info (Did, Dname) VALUES(1, 'HR')
INSERT INTO Dept_info (Did, Dname) VALUES(2, 'IT')
INSERT INTO Dept_info (Did, Dname) VALUES(3, 'Finance')
INSERT INTO Dept_info (Did, Dname) VALUES(4, 'Marketing')
INSERT INTO Dept_info (Did, Dname) VALUES(5, 'Sales')


--EMP_INFO TABLE
INSERT INTO Emp_info (Eid, Ename, Did, Cid, Salary, Experience) VALUES(1, 'HIMANSHU KASUNDRA', 1, 1, 50000, 5)
INSERT INTO Emp_info (Eid, Ename, Did, Cid, Salary, Experience) VALUES(2, 'YASH KHOKHAR', 2, 2, 60000, 3)
INSERT INTO Emp_info (Eid, Ename, Did, Cid, Salary, Experience) VALUES(3, 'KISHAN LILA', 3, 3, 70000, 7)
INSERT INTO Emp_info (Eid, Ename, Did, Cid, Salary, Experience) VALUES(4, 'HIT JAVIYA', 4, 4, 80000, 2)
INSERT INTO Emp_info (Eid, Ename, Did, Cid, Salary, Experience) VALUES(5, 'TEJ PATEL', 5, 5, 55000, 4)


--Display employeename, departmentname, Salary, Experience, City, District, State and country of all employees
SELECT 
	E.Ename AS EmployeeName,
	D.Dname AS DepartmentName,
	E.Salary,
	E.Experience,
	CI.Cname AS CityName,
	DI.Dname AS DistrictName,
	S.Sname AS StateName,
	C.Cname AS CountryName
FROM 
	Emp_info E
JOIN 
	Dept_info D ON E.Did = D.Did
JOIN 
	City_info CI ON E.Cid = CI.Cid
JOIN 
	District DI ON CI.Did = DI.Did
JOIN 
	State S ON DI.Sid = S.Sid
JOIN 
	Country C ON S.Cid = C.Cid;
