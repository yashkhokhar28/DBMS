--LAB 9

--SUB QUERY
-- Department Table
CREATE TABLE Department 
(
	DID INT ,
	DName VARCHAR(50)
)

INSERT INTO Department (DID, DName) VALUES(10, 'Computer')
INSERT INTO Department (DID, DName) VALUES(20, 'Electrical')
INSERT INTO Department (DID, DName) VALUES(30, 'Mechanical')
INSERT INTO Department (DID, DName) VALUES(40, 'Civil')

-- Create Academic Table
CREATE TABLE Academic 
(
	Rno INT ,
	SPI DECIMAL(3,1),
	Bklog INT
)

-- Insert data into Academic Table

INSERT INTO Academic (Rno, SPI, Bklog) VALUES(101, 8.8, 0)
INSERT INTO Academic (Rno, SPI, Bklog) VALUES(102, 9.2, 2)
INSERT INTO Academic (Rno, SPI, Bklog) VALUES(103, 7.6, 1)
INSERT INTO Academic (Rno, SPI, Bklog) VALUES(104, 8.2, 4)
INSERT INTO Academic (Rno, SPI, Bklog) VALUES(105, 7.0, 2)
INSERT INTO Academic (Rno, SPI, Bklog) VALUES(106, 8.9, 3)


-- Create Stu_Detail Table
CREATE TABLE Stu_Detail 
(
	Rno INT PRIMARY KEY,
	Name VARCHAR(50),
	City VARCHAR(50),
	DID INT,
)

INSERT INTO Stu_Detail (Rno, Name, City, DID) VALUES(101, 'Raju', 'Rajkot', 10)
INSERT INTO Stu_Detail (Rno, Name, City, DID) VALUES(102, 'Amit', 'Ahmedabad', 20)
INSERT INTO Stu_Detail (Rno, Name, City, DID) VALUES(103, 'Sanjay', 'Baroda', 40)
INSERT INTO Stu_Detail (Rno, Name, City, DID) VALUES(104, 'Neha', 'Rajkot', 20)
INSERT INTO Stu_Detail (Rno, Name, City, DID) VALUES(105, 'Meera', 'Ahmedabad', 30)
INSERT INTO Stu_Detail (Rno, Name, City, DID) VALUES(106, 'Mahesh', 'Baroda', 10)


--PART A

--Display details of students who are from computer department.
SELECT * FROM Stu_Detail WHERE DID = (SELECT DID FROM Department WHERE DName='Computer')
	
--Displays name of students whose SPI is more than 8.
SELECT Name FROM Stu_Detail WHERE Rno IN (SELECT Rno FROM Academic WHERE SPI>8)
	
--Display details of students of computer department who belongs to Rajkot city.
SELECT * FROM Stu_Detail WHERE City='Rajkot' AND DID = (SELECT DID FROM Department WHERE DName='Computer')

--Find total number of students of electrical department.
SELECT COUNT(*) as CountOFElectricalStudents FROM Stu_Detail WHERE  DID = (SELECT DID FROM Department WHERE DName='Electrical')

--Display name of student who is having maximum SPI.
SELECT Name FROM Stu_Detail WHERE Rno IN (SELECT Rno FROM Academic WHERE SPI = (SELECT MAX(SPI) FROM Academic))

--Display details of students having more than 1 backlog.
SELECT Name FROM Stu_Detail WHERE Rno IN (SELECT Rno FROM Academic WHERE Bklog>1)


--PART B

--Display name of students who are either from computer department or from mechanical department.
SELECT Name  FROM Stu_Detail WHERE DID IN (SELECT DID FROM Department WHERE DName IN ('Computer', 'Mechanical'))

--Display name of students who are in same department as 102 studying in.
SELECT Name FROM Stu_Detail WHERE DID = (SELECT DID FROM Stu_Detail WHERE Rno = 102)AND Rno <> 102


--PART C
--Display name of students whose SPI is more than 9 and who is from electrical department.
SELECT Name FROM Stu_Detail WHERE Rno IN(SELECT Rno FROM Academic WHERE SPI > 9) AND DID = (SELECT DID FROM Department WHERE DName = 'Electrical')

--Display name of student who is having second highest SPI.
SELECT Name FROM Stu_Detail WHERE 
Rno = (SELECT Rno FROM Academic WHERE 
SPI = (SELECT MAX(SPI) FROM Academic WHERE 
SPI < (SELECT MAX(SPI) FROM Academic)))


--Display city names whose students branch wise SPI is 9.2.
SELECT DISTINCT City FROM Stu_Detail WHERE Rno IN (SELECT Rno FROM Academic WHERE SPI = 9.2)


--SET PERATOR

--PART A

--Computer Table
CREATE TABLE Computer
(
	RollNo INT,
	Name VARCHAR(50)
)

INSERT INTO Computer (RollNo, Name) VALUES(101, 'Ajay')
INSERT INTO Computer (RollNo, Name) VALUES(109, 'Haresh')
INSERT INTO Computer (RollNo, Name) VALUES(115, 'Manish')

-- Electrical Table
CREATE TABLE Electrical
(
	RollNo INT ,
	Name VARCHAR(50)
)

INSERT INTO Electrical (RollNo, Name) VALUES(105, 'Ajay')
INSERT INTO Electrical (RollNo, Name) VALUES(107, 'Mahesh')
INSERT INTO Electrical (RollNo, Name) VALUES(115, 'Manish')



--Display name of students who is either in Computer or in Electrical.
SELECT Name FROM Computer UNION SELECT Name FROM Electrical

--Display name of students who is either in Computer or in Electrical including duplicate data.
SELECT Name FROM Computer UNION ALL SELECT Name FROM Electrical

--Display name of students who is in both Computer and Electrical.
SELECT Name FROM Computer INTERSECT SELECT Name FROM Electrical

--Display name of students who are in Computer but not in Electrical.
SELECT Name FROM Computer EXCEPT  SELECT Name FROM Electrical
 

--Display name of students who are in Electrical but not in Computer.
	
--Display all the details of students who are either in Computer or in Electrical.
SELECT * FROM Computer UNION SELECT * FROM Electrical

--Display all the details of students who are in both Computer and Electrical.
SELECT * FROM Computer INTERSECT  SELECT * FROM Electrical


--PART B

--Emp_DATA Table
CREATE TABLE Emp_DATA
(
	EID INT ,
	Name VARCHAR(50)
)

INSERT INTO Emp_DATA (EID, Name) VALUES(1, 'Ajay')
INSERT INTO Emp_DATA (EID, Name) VALUES(9, 'Haresh')
INSERT INTO Emp_DATA (EID, Name) VALUES(5, 'Manish')

--Customer Table
CREATE TABLE Customer
(
	CID INT ,
	Name VARCHAR(50)
)

INSERT INTO Customer (CID, Name) VALUES(5, 'Ajay')
INSERT INTO Customer (CID, Name) VALUES(7, 'Mahesh')
INSERT INTO Customer (CID, Name) VALUES(5, 'Manish')

--Display name of persons who is either Employee or Customer.
SELECT Name FROM Emp_DATA UNION SELECT Name FROM Customer

--Display name of persons who is either Employee or Customer including duplicate data.
SELECT Name FROM Emp_DATA UNION ALL SELECT Name FROM Customer

--Display name of persons who is both Employee as well as Customer.
SELECT Name FROM Emp_DATA INTERSECT SELECT Name FROM Customer

--Display name of persons who are Employee but not Customer.
SELECT Name FROM Emp_DATA EXCEPT SELECT Name FROM Customer

--Display name of persons who are Customer but not Employee.
SELECT Name FROM Customer EXCEPT SELECT Name FROM Emp_DATA


--PART C

--Display ID and name of persons who is either Employee or Customer.
SELECT EID,Name FROM Emp_DATA UNION SELECT CID,Name FROM Customer
	
--.Display ID and name of persons who is either Employee or Customer including duplicate data.
SELECT EID,Name FROM Emp_DATA UNION ALL SELECT CID,Name FROM Customer
	
--Display ID and name of persons who is both Employee as well as Customer.
SELECT EID,Name FROM Emp_DATA INTERSECT SELECT CID,Name FROM Customer
	
--Display ID and name of persons who are Employee but not Customer.
SELECT EID,Name FROM Emp_DATA EXCEPT SELECT CID,Name FROM Customer
	
--Display ID and name of persons who are Customer but not Employee.
SELECT CID,Name FROM Customer EXCEPT SELECT EID,Name FROM Emp_DATA
