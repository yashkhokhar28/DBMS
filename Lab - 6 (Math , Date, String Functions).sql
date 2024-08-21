--Math functions

--Display the result of 5 multiply by 30.
SELECT 5 * 30 AS MULTIPLICATION

--Find out the absolute value of -25, 25, -50 and 50.
SELECT ABS(-25) AS ABS1, ABS(25) AS ABS2, ABS(-50) AS ABS3, ABS(50) AS ABS4

--Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
SELECT CEILING(25.3) AS CEIL1, CEILING(25.7) AS CEIL2, CEILING(-25.2) AS CEIL3
	
--Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
SELECT FLOOR(25.3) AS FLOOR1, FLOOR(25.7) AS FLOOR2, FLOOR(-25.2) AS FLOOR3

--Find out remainder of 5 divided 2 and 5 divided by 3.
SELECT 5%2 AS REM1, 5%3 AS REM2

--Find out value of 3 raised to 2nd power and 4 raised 3rd power.
SELECT POWER(3,2) AS POW1 , POWER(4,3) AS POW2

--Find out the square root of 25, 30 and 50.
SELECT SQRT(25) AS SQRT1, SQRT(30) AS SQRT2, SQRT(50) AS SQRT3

--Find out the square of 5, 15, and 25.
SELECT SQUARE(5) AS SQUARE1, SQUARE(15) AS SQUARE2, SQUARE(25) AS SQUARE3
---------------OR-------------------
SELECT POWER(5,2) AS SQUARE1 , POWER(15,2) AS SQUARE2, POWER(25,2) AS SQUARE3
	
--Find out the value of PI.
SELECT PI() AS piVALUE

--Find out round value of 157.732 for 2, 0 and -2 decimal points.
SELECT ROUND(157.732, 2) AS Round1, ROUND(157.732, 0) AS Round2, ROUND(157.732, -2) AS Round3

--Find out exponential value of 2 and 3.
SELECT EXP(2) AS Exp2, EXP(3) AS Exp3

--Find out logarithm having base e of 10 and 2.
SELECT LOG(10) AS LogE10, LOG(2) AS LogE2

--Find out logarithm having base b having value 10 of 5 and 100.
SELECT LOG10(5) AS LOG10_5, LOG10(100) AS LOG10_100

--Find sine, cosine and tangent of 3.1415.
SELECT SIN(3.1415) AS SINE, COS(3.1415) AS COSI, TAN(3.1415) AS TANG

--Find sign of -25, 0 and 25.
SELECT SIGN(-25) AS SIGN1, SIGN(0) AS SIGN2, SIGN(25) AS SIGN3

--Generate random number using function.
SELECT RAND() AS [RANDOM NUMBER]


--PART B

CREATE TABLE Emp_Master 
(
	EmpNo INT,
	EmpName VARCHAR(25),
	JoiningDate DATE,
	Salary DECIMAL(10, 2),
	Commission DECIMAL(10, 2),
	City VARCHAR(25),
	Dept_Code VARCHAR(10)
)

INSERT INTO Emp_Master (EmpNo, EmpName, JoiningDate, Salary, Commission, City, Dept_Code)
VALUES(101, 'Keyur', '2002-05-01', 12000.00, 4500, 'Rajkot', '3@g')

INSERT INTO Emp_Master (EmpNo, EmpName, JoiningDate, Salary, Commission, City, Dept_Code)
VALUES(102, 'Hardik', '2004-02-15', 14000.00, 2500, 'Ahmedabad', '3@')

INSERT INTO Emp_Master (EmpNo, EmpName, JoiningDate, Salary, Commission, City, Dept_Code)
VALUES(103, 'Kajal', '2006-03-14', 15000.00, 3000, 'Baroda', '3-GD')

INSERT INTO Emp_Master (EmpNo, EmpName, JoiningDate, Salary, Commission, City, Dept_Code)
VALUES(104, 'Bhoomi', '2005-06-23', 12500.00, 1000, 'Ahmedabad', '1A3D')

INSERT INTO Emp_Master (EmpNo, EmpName, JoiningDate, Salary, Commission, City, Dept_Code)
VALUES(105, 'Harmit', '2004-02-15', 14000.00, 2000, 'Rajkot', '312A')


--Display the result of Salary plus Commission.
SELECT EmpNo, EmpName, (Salary + Commission) AS Total FROM Emp_Master

--Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.
SELECT CEILING(55.2) AS CEIL1, CEILING(35.7) AS Ceil2, CEILING(-55.2) AS CEIL3

--Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.
SELECT FLOOR(55.2) AS FLOOR1, FLOOR(35.7) AS FLOOR2, FLOOR(-55.2) AS Floor3

--Find out remainder of 55 divided 2 and 55 divided by 3.
SELECT 55 % 2 AS REM1, 55 % 3 AS REM2

--Find out value of 23 raised to 2nd power and 14 raised 3rd power.
SELECT POWER(23, 2) AS POWER1, POWER(14, 3) AS POWER2


--PART C

--Find out the square root of 36, 49 and 81.
SELECT SQRT(36) AS SQRT1, SQRT(49) AS SQRT2, SQRT(81) AS SQRT3

--Find out the square of 3, 9, and 12.
SELECT POWER(3, 2) AS SQUARE1, POWER(9, 2) AS SQUARE2, POWER(12, 2) AS SQUARE3

--Find out round value of 280.8952 for 2, 0 and -2 decimal points.
SELECT ROUND(280.8952, 2) AS Round1, ROUND(280.8952, 0) AS Round2, ROUND(280.8952, -2) AS Round3

--Find sine, cosine and tangent of 4.2014.
SELECT SIN(4.2014) AS SINE, COS(4.2014) AS COSI, TAN(4.2014) AS TANG

--Find sign of -55, 0 and 95.
SELECT SIGN(-55) AS SIGN1, SIGN(0) AS SIGN2, SIGN(95) AS SIGN3


--STRING FUNCTION

--Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank
SELECT LENGTH(NULL) AS LengthOfNull, LENGTH('   hello     ') AS LengthOfHello, LENGTH('') AS LengthOfBlank

--Display your name in lower & upper case.
SELECT LOWER('DARSHAN') AS LowerCaseName,UPPER('university') AS UpperCaseName

--Display first three characters of your name.
SELECT LEFT('DARSHAN UNIVERSITY', 3) AS FirstThreeChars

--Display 3rd to 10th character of your name.
SELECT SUBSTRING('DARSHAN UNIVERSITY', 3, 8) AS Substrings

--Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.
SELECT REPLACE('abc123efg', '123', 'XYZ') AS String1, REPLACE('abcabcabc', 'c', '5') AS String2

--Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9.
SELECT ASCII('a') AS AsciiOfa,ASCII('A') AS AsciiOfA,ASCII('z') AS AsciiOfz, ASCII('Z') AS AsciiOfZ, ASCII('0') AS AsciiOf0, ASCII('9') AS AsciiOf9

--Write a query to display character based on number 97, 65,122,90,48,57.
SELECT CHAR(97) AS CharOf97, CHAR(65) AS CharOf65, CHAR(122) AS CharOf122, CHAR(90) AS CharOf90, CHAR(48) AS CharOf48, CHAR(57) AS CharOf57

--Write a query to remove spaces from left of a given string ‘	hello world		‘.
SELECT LTRIM('   hello world   ') AS TrimmedLeft

--Write a query to remove spaces from right of a given string ‘	hello world		‘.
SELECT RTRIM('   hello world   ') AS TrimmedRight

--Write a query to display first 4 & Last 5 characters of ‘SQL Server’.
SELECT CONCAT(LEFT('SQL Server', 4), RIGHT('SQL Server', 5)) AS String

--Write a query to convert a string ‘1234.56’ to number (Use cast and convert function).
SELECT CAST('1234.56' AS DECIMAL(10, 2)) AS Number1, CONVERT(DECIMAL(10, 2), '1234.56') AS Number2

--Write a query to convert a float 10.58 to integer (Use cast and convert function).
SELECT CAST(10.58 AS INT) AS Integer1, CONVERT(INT, 10.58) AS Integer2

--Put 10 space before your name using function.
SELECT CONCAT(REPLICATE(' ', 10), 'SQL SERVER') AS NameWithSpaces

--Combine two strings using + sign as well as CONCAT ().
SELECT 'DARSHAN' + 'UNIVERSITY' AS CombinedWithPlus, CONCAT('DARSHAN', 'UNIVERSITY') AS CombinedWithConcat

--Find reverse of “Darshan”.
SELECT REVERSE('DARSHAN') AS REVERSE1
--Repeat your name 3 times.
SELECT REPLICATE('DARSHAN', 3) AS RepeatedName


--PART B

--Find the length of FirstName and LastName columns.
SELECT LEN(FirstName) AS FirstNameLength, LEN(LastName) AS LastNameLength FROM Student

--Display FirstName and LastName columns in lower & upper case.
SELECT LOWER(FirstName) AS LowerFirstName, UPPER(FirstName) AS UpperFirstName, LOWER(LastName) AS LowerLastName, UPPER(LastName) AS UpperLastName FROM Student

--Display first three characters of FirstName column.
SELECT LEFT(FirstName, 3) AS FirstThreeChars FROM Student

--Display 3rd to 10th character of Website column.
SELECT SUBSTRING(Website, 3, 8) AS Substrings FROM Student

--Write a query to display first 4 & Last 5 characters of Website column.
SELECT CONCAT(LEFT(Website, 4), RIGHT(Website, 5)) AS First4Last5 FROM Student



--Part-C
--Put 10 space before FirstName using function.
SELECT CONCAT(REPLICATE(' ', 10), FirstName) AS FirstNameWithSpaces FROM Student

--Combine FirstName and LastName columns using + sign as well as CONCAT ().
-- Using +
SELECT FirstName + ' ' + LastName AS FullNamePlus FROM Student

-- Using CONCAT()
SELECT CONCAT(FirstName, ' ', LastName) AS FullNameConcat FROM Student

--Combine all columns using + sign as well as CONCAT ().
-- Using +
SELECT CAST(StuID AS VARCHAR) + ' ' + FirstName + ' ' + LastName + ' ' + ISNULL(Website, '') + ' ' + City + ' ' + Address AS CombinedColumnsPlus FROM Student

-- Using CONCAT()
SELECT CONCAT(StuID, ' ', FirstName, ' ', LastName, ' ', ISNULL(Website, ''), ' ', City, ' ', Address) AS CombinedColumnsConcat FROM Student

--Find reverse of FirstName column.
SELECT REVERSE(FirstName) AS ReversedFirstName FROM Student

--Repeat FirstName column 3 times
SELECT REPLICATE(FirstName, 3) AS RepeatedFirstName FROM Student

--Give the Names which contains 5 characters.
SELECT FirstName, LastName FROM Student WHERE LEN(LastName) = 5

--Combile the result as <EmpName> Lives in <City>.
SELECT CONCAT(EmpName, ' ', ' Lives in ', City) AS EmpCityInfo FROM Emp_Master

--Combine the result as <EmpName> receives <commission> per month.
SELECT CONCAT(EmpName, ' ', ' receives ', CAST(Commission AS VARCHAR), ' per month') AS EmpCommissionInfo FROM Emp_Master

--Separate once column of Dept Code after value 3.
SELECT LEFT(Dept_Code, CHARINDEX('3', Dept_Code)) + ' ' + SUBSTRING(Dept_Code, CHARINDEX('3', Dept_Code) + 1, LEN(Dept_Code)) AS SeparatedDeptCode FROM Emp_Master



--DATE TIME FUNCTION

--PART A

--Write a query to display the current date & time. Label the column Today_Date.
SELECT GETDATE() AS Today_Date

--Write a query to find new date after 365 day with reference to today.
SELECT DATEADD(DAY, 365, GETDATE()) AS NewDateAfter365Days

--Display the current date in a format that appears as may 5 1994 12:00AM.
SELECT CONVERT(VARCHAR, GETDATE(), 100) AS FormattedDate

--Display the current date in a format that appears as 03 Jan 1995.
SELECT FORMAT(GETDATE(), 'dd MMM yyyy') AS FormattedDate

--Display the current date in a format that appears as Jan 04, 96.
SELECT FORMAT(GETDATE(), 'MMM dd, yy') AS FormattedDate

--Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09.
SELECT DATEDIFF(MONTH, '2008-12-31', '2009-03-31') AS TotalMonths

--Write a query to find out total number of years between 25-Jan-12 and 14-Sep-10.
SELECT DATEDIFF(YEAR, '2010-09-14', '2012-01-25') AS TotalYears

--Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30.
SELECT DATEDIFF(HOUR, '2012-01-25 07:00', '2012-01-26 10:30') AS TotalHours

--Write a query to extract Day, Month, Year from given date 12-May-16.
SELECT DAY('2016-05-12') AS Day, MONTH('2016-05-12') AS Month, YEAR('2016-05-12') AS Year

--Write a query that adds 5 years to current date.
SELECT DATEADD(YEAR, 5, GETDATE()) AS DateAfter5Years

--Write a query to subtract 2 months from current date.
SELECT DATEADD(MONTH, -2, GETDATE()) AS DateMinus2Months

--Extract month from current date using datename () and datepart () function.
SELECT DATENAME(MONTH, GETDATE()) AS MonthName, DATEPART(MONTH, GETDATE()) AS MonthNumber

--Write a query to find out last date of current month.
SELECT EOMONTH(GETDATE()) AS LastDateOfMonth

--Calculate your age in years and months.
SELECT DATEDIFF(YEAR, '2003-03-15', GETDATE()) AS AgeYears, DATEDIFF(MONTH, '2003-03-15', GETDATE()) % 12 AS AgeMonths


--PART B

CREATE TABLE Emp_detail
(
	EmpNo INT,
	EmpName VARCHAR(50),
	JoiningDate DATE,
	Salary DECIMAL(10, 2),
	City VARCHAR(50)
)

INSERT INTO Emp_detail (EmpNo, EmpName, JoiningDate, Salary, City)
VALUES(101, 'Keyur', '2002-01-15', 12000.00, 'Rajkot')

INSERT INTO Emp_detail (EmpNo, EmpName, JoiningDate, Salary, City)
VALUES(102, 'Hardik', '2004-02-15', 14000.00, 'Ahmedabad')

INSERT INTO Emp_detail (EmpNo, EmpName, JoiningDate, Salary, City)
VALUES(103, 'Kajal', '2006-03-14', 15000.00, 'Baroda')

INSERT INTO Emp_detail (EmpNo, EmpName, JoiningDate, Salary, City)
VALUES(104, 'Bhoomi', '2005-06-23', 12500.00, 'Ahmedabad')

INSERT INTO Emp_detail (EmpNo, EmpName, JoiningDate, Salary, City)
VALUES(102, 'Harmit', '2004-02-15', 14000.00, 'Rajkot')

INSERT INTO Emp_detail (EmpNo, EmpName, JoiningDate, Salary, City)
VALUES(105, 'Jay', '2007-03-12', 12000.00, 'Surat')

--Write a query to find new date after 365 day with reference to JoiningDate.
SELECT EmpNo, EmpName, DATEADD(DAY, 365, JoiningDate) AS NewDateAfter365Days FROM Emp_detail

--Display the JoiningDate in a format that appears as may 5 1994 12:00AM.
SELECT EmpNo, EmpName, CONVERT(VARCHAR, JoiningDate, 100) AS FormattedJoiningDate FROM Emp_detail

--Display the JoiningDate in a format that appears as 03 Jan 1995.
SELECT EmpNo, EmpName, FORMAT(JoiningDate, 'dd MMM yyyy') AS FormattedJoiningDate FROM Emp_detail

--Display the JoiningDate in a format that appears as Jan 04, 96.
SELECT EmpNo, EmpName, FORMAT(JoiningDate, 'MMM dd, yy') AS FormattedJoiningDate FROM Emp_detail

--Write a query to find out total number of months between JoiningDate and 31-Mar-09.
SELECT EmpNo, EmpName, DATEDIFF(MONTH, JoiningDate, '2009-03-31') AS TotalMonths FROM Emp_detail

--Write a query to find out total number of years between JoiningDate and 14-Sep-10.
SELECT EmpNo, EmpName, DATEDIFF(YEAR, JoiningDate, '2010-09-14') AS TotalYears FROM Emp_detail



--PART C

--Write a query to extract Day, Month, Year from JoiningDate.
SELECT EmpNo, EmpName, DAY(JoiningDate) AS Day, MONTH(JoiningDate) AS Month, YEAR(JoiningDate) AS Year FROM Emp_detail

--Write a query that adds 5 years to JoiningDate.
SELECT EmpNo, EmpName, DATEADD(YEAR, 5, JoiningDate) AS NewDateAfter5Years FROM Emp_detail

--Write a query to subtract 2 months from JoiningDate.
SELECT EmpNo, EmpName, DATEADD(MONTH, -2, JoiningDate) AS NewDateMinus2Months FROM Emp_detail

--Extract month from JoiningDate using datename () and datepart () function.
SELECT EmpNo, EmpName, DATENAME(MONTH, JoiningDate) AS MonthName, DATEPART(MONTH, JoiningDate) AS MonthNumbeR  FROM Emp_detail

--Calculate your age in years and months
SELECT DATEDIFF(YEAR, '2003-03-15', GETDATE()) AS AgeYears, DATEDIFF(MONTH, '2003-03-15', GETDATE()) % 12 AS AgeMonths
