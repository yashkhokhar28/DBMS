--LAB 11

--STU_INFO table
CREATE TABLE STU_INFO
(
	Rno INT PRIMARY KEY,
	Name VARCHAR(50),
	Branch VARCHAR(2)
)

--RESULT table
CREATE TABLE RESULT
(
	Rno INT FOREIGN KEY (Rno) REFERENCES STU_INFO(Rno),
	SPI FLOAT,
		
)

--EMPLOYEE_MASTER table
CREATE  TABLE EMPLOYEE_MASTER 
(
	EmployeeNo VARCHAR(3) PRIMARY KEY,
	Name VARCHAR(50),
	ManagerNo VARCHAR(3)
		
)

--Inserting data into STU_INFO
	 
INSERT INTO STU_INFO (Rno, Name, Branch) VALUES(101, 'Raju', 'CE')
INSERT INTO STU_INFO (Rno, Name, Branch) VALUES(102, 'Amit', 'CE')
INSERT INTO STU_INFO (Rno, Name, Branch) VALUES(103, 'Sanjay', 'ME')
INSERT INTO STU_INFO (Rno, Name, Branch) VALUES(104, 'Neha', 'EC')
INSERT INTO STU_INFO (Rno, Name, Branch) VALUES(105, 'Meera', 'EE')
INSERT INTO STU_INFO (Rno, Name, Branch) VALUES(106, 'Mahesh', 'ME')

-- Inserting data into RESULT
INSERT INTO RESULT (Rno, SPI) VALUES(101, 8.8)
INSERT INTO RESULT (Rno, SPI) VALUES(102, 9.2)
INSERT INTO RESULT (Rno, SPI) VALUES(103, 7.6)
INSERT INTO RESULT (Rno, SPI) VALUES(104, 8.2)
INSERT INTO RESULT (Rno, SPI) VALUES(105, 7.0)
INSERT INTO RESULT (Rno, SPI) VALUES(107, 8.9)  

--Inserting data into EMPLOYEE_MASTER

INSERT INTO EMPLOYEE_MASTER (EmployeeNo, Name, ManagerNo) VALUES('E01', 'Tarun', NULL)
INSERT INTO EMPLOYEE_MASTER (EmployeeNo, Name, ManagerNo) VALUES('E02', 'Rohan', 'E02')
INSERT INTO EMPLOYEE_MASTER (EmployeeNo, Name, ManagerNo) VALUES('E03', 'Priya', 'E01')
INSERT INTO EMPLOYEE_MASTER (EmployeeNo, Name, ManagerNo) VALUES('E04', 'Milan', 'E03')
INSERT INTO EMPLOYEE_MASTER (EmployeeNo, Name, ManagerNo) VALUES('E05', 'Jay', 'E01')
INSERT INTO EMPLOYEE_MASTER (EmployeeNo, Name, ManagerNo) VALUES('E06', 'Anjana', 'E04')

--PART A

--Combine information from student and result table using cross join or Cartesian product.
SELECT * FROM STU_INFO CROSS JOIN RESULT
	
--Perform inner join on Student and Result tables.
SELECT STU_INFO.Rno, STU_INFO.Name, STU_INFO.Branch, RESULT.SPI
FROM STU_INFO
INNER JOIN RESULT ON STU_INFO.Rno = RESULT.Rno

--Perform the left outer join on Student and Result tables.
SELECT STU_INFO.Rno, STU_INFO.Name, STU_INFO.Branch, RESULT.SPI
FROM STU_INFO
LEFT JOIN RESULT ON STU_INFO.Rno = RESULT.Rno

--Perform the right outer join on Student and Result tables.
SELECT STU_INFO.Rno, STU_INFO.Name, STU_INFO.Branch, RESULT.SPI
FROM STU_INFO
RIGHT JOIN RESULT ON STU_INFO.Rno = RESULT.Rno
	
--Perform the full outer join on Student and Result tables. 
SELECT STU_INFO.Rno, STU_INFO.Name, STU_INFO.Branch, RESULT.SPI
FROM STU_INFO
FULL OUTER JOIN RESULT ON STU_INFO.Rno = RESULT.Rno
	
--Display Rno, Name, Branch and SPI of all students.
SELECT STU_INFO.Rno, STU_INFO.Name, STU_INFO.Branch, RESULT.SPI
FROM STU_INFO
LEFT JOIN RESULT ON STU_INFO.Rno = RESULT.Rno
	
--Display Rno, Name, Branch and SPI of CE branch’s student only.
SELECT STU_INFO.Rno, STU_INFO.Name, STU_INFO.Branch, RESULT.SPI
FROM STU_INFO
LEFT JOIN RESULT ON STU_INFO.Rno = RESULT.Rno
WHERE STU_INFO.Branch = 'CE'
	
--Display Rno, Name, Branch and SPI of other than EC branch’s student only.
SELECT STU_INFO.Rno, STU_INFO.Name, STU_INFO.Branch, RESULT.SPI
FROM STU_INFO
LEFT JOIN RESULT ON STU_INFO.Rno = RESULT.Rno
WHERE STU_INFO.Branch <> 'EC'
	
--Display average result of each branch.
SELECT STU_INFO.Branch, AVG(RESULT.SPI) AS Average_SPI
FROM STU_INFO
LEFT JOIN RESULT ON STU_INFO.Rno = RESULT.Rno
GROUP BY STU_INFO.Branch

--Display average result of CE and ME branch.
SELECT STU_INFO.Branch, AVG(RESULT.SPI) AS Average_SPI
FROM STU_INFO
LEFT JOIN RESULT ON STU_INFO.Rno = RESULT.Rno
WHERE STU_INFO.Branch IN ('CE', 'ME')
GROUP BY STU_INFO.Branch


--PART B

--Display average result of each branch and sort them in ascending order by SPI.
SELECT STU_INFO.Branch, AVG(RESULT.SPI) AS Average_SPI
FROM STU_INFO
LEFT JOIN RESULT ON STU_INFO.Rno = RESULT.Rno
GROUP BY STU_INFO.Branch
ORDER BY Average_SPI ASC

--Display highest SPI from each branch and sort them in descending order.
SELECT STU_INFO.Branch, MAX(RESULT.SPI) AS Highest_SPI
FROM STU_INFO
LEFT JOIN RESULT ON STU_INFO.Rno = RESULT.Rno
GROUP BY STU_INFO.Branch
ORDER BY Highest_SPI DESC


--PART C

Retrieve the names of employee along with their manager’s name from the Employee table.
SELECT E1.Name AS EmployeeName, E2.Name AS ManagerName
FROM EMPLOYEE_MASTER E1
LEFT JOIN EMPLOYEE_MASTER E2 ON E1.ManagerNo = E2.EmployeeNo
