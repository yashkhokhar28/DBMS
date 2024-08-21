--LAB 12

CREATE TABLE DEPT 
(
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(100) NOT NULL UNIQUE,
	DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
	Location VARCHAR(50) NOT NULL
);

CREATE TABLE PERSON 
(
	PersonID INT PRIMARY KEY,
	PersonName VARCHAR(100) NOT NULL,
	DepartmentID INT NULL FOREIGN KEY (DepartmentID) REFERENCES DEPT(DepartmentID),
	Salary DECIMAL(8,2) NOT NULL,
	JoiningDate DATETIME NOT NULL,
	City VARCHAR(100) NOT NULL,
    
);


INSERT INTO DEPT (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES(1, 'Admin', 'Adm', 'A-Block')
INSERT INTO DEPT (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES(2, 'Computer', 'CE', 'C-Block')
INSERT INTO DEPT (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES(3, 'Civil', 'CI', 'G-Block')
INSERT INTO DEPT (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES(4, 'Electrical', 'EE', 'E-Block')
INSERT INTO DEPT (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES(5, 'Mechanical', 'ME', 'B-Block')


INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES(101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot')
INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES(102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad')
INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES(103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda')
INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES(104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot')
INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES(105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar')
INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES(106, 'Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad')
INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES(107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot')
INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES(108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot') 
INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES(109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda')
INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES(110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar')


--PART A

--Find all persons with their department name & code.
SELECT P.PersonName, D.DepartmentName, D.DepartmentCode
FROM PERSON P
LEFT JOIN DEPT D ON P.DepartmentID = D.DepartmentID;

--Find the person's name whose department is in C-Block.
SELECT P.PersonName
FROM PERSON P
JOIN DEPT D ON P.DepartmentID = D.DepartmentID
WHERE D.Location = 'C-Block';

--Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT P.PersonName, P.Salary, D.DepartmentName
FROM PERSON P
LEFT JOIN DEPT D ON P.DepartmentID = D.DepartmentID
WHERE P.City = 'Jamnagar';

--Retrieve person name, salary & department name who does not belong to Rajkot city.
SELECT P.PersonName, P.Salary, D.DepartmentName
FROM PERSON P
LEFT JOIN DEPT D ON P.DepartmentID = D.DepartmentID
WHERE P.City <> 'Rajkot';

--etrieve person�s name of the person who joined the Civil department after 1-Aug-2001.
SELECT P.PersonName
FROM PERSON P
JOIN DEPT D ON P.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Civil' AND P.JoiningDate > '2001-08-01';

--Find details of all persons who belong to the computer department.
SELECT P.*
FROM PERSON P
JOIN DEPT D ON P.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Computer';

--Display all the person's name with the department whose joining date difference with the current date is more than 365 days.
SELECT P.PersonName, D.DepartmentName
FROM PERSON P
LEFT JOIN DEPT D ON P.DepartmentID = D.DepartmentID
WHERE DATEDIFF(DAY, P.JoiningDate, GETDATE()) > 365;

--Find department wise person counts.
SELECT D.DepartmentName, COUNT(P.PersonID) AS PersonCount
FROM PERSON P
RIGHT JOIN DEPT D ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;

--Give department wise maximum & minimum salary with department name.
SELECT D.DepartmentName, MAX(P.Salary) AS MaxSalary, MIN(P.Salary) AS MinSalary
FROM PERSON P
JOIN DEPT D ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;

--Find city wise total, average, maximum and minimum salary.
SELECT P.City, SUM(P.Salary) AS TotalSalary, AVG(P.Salary) AS AvgSalary, MAX(P.Salary) AS MaxSalary, MIN(P.Salary) AS MinSalary
FROM PERSON P
GROUP BY P.City;

--Find the average salary of a person who belongs to Ahmedabad city.
SELECT AVG(P.Salary) AS AvgSalary
FROM PERSON P
WHERE P.City = 'Ahmedabad';

--Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column)
SELECT P.PersonName + ' lives in ' + P.City + ' and works in ' + D.DepartmentName + ' Department.' AS Description
FROM PERSON P
LEFT JOIN DEPT D ON P.DepartmentID = D.DepartmentID;

--PART B

--Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In single column)
SELECT P.PersonName + ' earns ' + CAST(P.Salary AS VARCHAR(10)) + ' from ' + D.DepartmentName + ' department monthly.' AS Description
FROM PERSON P
LEFT JOIN DEPT D ON P.DepartmentID = D.DepartmentID;

--Find city & department wise total, average & maximum salaries.
SELECT P.City, D.DepartmentName, 
SUM(P.Salary) AS TotalSalary, 
AVG(P.Salary) AS AvgSalary, 
MAX(P.Salary) AS MaxSalary
FROM PERSON P
LEFT JOIN DEPT D ON P.DepartmentID = D.DepartmentID
GROUP BY P.City, D.DepartmentName;

--Find all persons who do not belong to any department.
SELECT P.*
FROM PERSON P
WHERE P.DepartmentID IS NULL;

--Find all departments whose total salary is exceeding 100000.
SELECT D.DepartmentName, SUM(P.Salary) AS TotalSalary
FROM PERSON P
JOIN DEPT D ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
HAVING SUM(P.Salary) > 100000;


--PART C

--List all departments who have no person.
SELECT D.DepartmentName
FROM DEPT D
LEFT JOIN PERSON P ON D.DepartmentID = P.DepartmentID
WHERE P.PersonID IS NULL;

--List out department names in which more than two persons are working.
SELECT D.DepartmentName
FROM DEPT D
JOIN PERSON P ON D.DepartmentID = P.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(P.PersonID) > 2;

--Give a 10% increment in the computer department employee�s salary. (Use Update)
UPDATE PERSON
SET Salary = Salary * 1.10
WHERE DepartmentID = (SELECT DepartmentID FROM DEPT WHERE DepartmentName = 'Computer');

UPDATE PERSON 
JOIN DEPT ON PERSON.DepartmentID = DEPT.DepartmentID
SET PERSON.Salary = PERSON.Salary * 1.10
WHERE DEPT.DepartmentName = 'Computer';
