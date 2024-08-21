 --Like operator
CREATE TABLE Student (
	StuID		INT,
	FirstName	VARCHAR(25),
	LastName	VARCHAR(25),
	Website		VARCHAR(50),
	City		VARCHAR(25),
	Address		VARCHAR(100)
)
	
INSERT INTO Student (StuID, FirstName, LastName, Website, City, Address)
VALUES(1011, 'Keyur', 'Patel', 'techonthenet.com', 'Rajkot', 'A-303 ''Vasant Kunj'', Rajkot')

INSERT INTO Student (StuID, FirstName, LastName, Website, City, Address)
VALUES(1022, 'Hardik', 'Shah', 'digminecraft.com', 'Ahmedabad', '"Ram Krupa", Raiya Road')

INSERT INTO Student (StuID, FirstName, LastName, Website, City, Address)
VALUES(1033, 'Kajal', 'Trivedi', 'bigactivities.com', 'Baroda', 'Raj bhavan plot, near garden')

INSERT INTO Student (StuID, FirstName, LastName, Website, City, Address)
VALUES(1044, 'Bhoomi', 'Gajera', 'checkyourmath.com', 'Ahmedabad', '"Jig''s Home", Narol')

INSERT INTO Student (StuID, FirstName, LastName, Website, City, Address)
VALUES(1055, 'Harmit', 'Mitel', '@me.darshan.com', 'Rajkot', 'B-55, Raj Residency')

INSERT INTO Student (StuID, FirstName, LastName, Website, City, Address)
VALUES(1066, 'Ashok', 'Jani', NULL, 'Baroda', 'A502, Club House Building')

-- Part - A

--Display the name of students whose name starts with ‘k’.
SELECT FIRSTNAME, LASTNAME FROM STUDENT WHERE FIRSTNAME LIKE 'K%'

--Display the name of students whose name consists of five characters.
SELECT FIRSTNAME, LASTNAME FROM STUDENT WHERE FIRSTNAME LIKE '_____'

--Retrieve the first name & last name of students whose city name ends with a & contains six characters.
SELECT FIRSTNAME, LASTNAME FROM STUDENT WHERE CITY LIKE '_____A'
--OR
SELECT FIRSTNAME, LASTNAME FROM STUDENT WHERE CITY LIKE '%A' AND CITY LIKE '______'

--Display all the students whose last name ends with ‘tel’.
SELECT * FROM STUDENT WHERE LASTNAME LIKE '%TEL'

--5. Display all the students whose first name starts with ‘ha’ & ends with‘t’.
SELECT * FROM STUDENT WHERE FirstName LIKE 'HA%' AND FirstName LIKE '%T'
--OR
SELECT * FROM STUDENT WHERE FirstName LIKE 'HA%T' 
			
--Display all the students whose first name starts with ‘k’ and third character is ‘y’.
SELECT * FROM STUDENT WHERE FirstName LIKE 'K_Y%' 
	
--Display the name of students having no website and name consists of five characters.
SELECT * FROM STUDENT WHERE WEBSITE IS NULL AND FirstName LIKE '_____'
	
--Display all the students whose last name consist of ‘jer’.  
SELECT * FROM STUDENT WHERE LASTNAME LIKE '%JER%' 

--Display all the students whose city name starts with either ‘r’ or ‘b’.
SELECT * FROM STUDENT WHERE FirstName LIKE 'R%' OR FirstName LIKE 'B%'

--Display all the name students having websites.
SELECT * FROM STUDENT WHERE WEBSITE IS NOT NULL

--Display all the students whose name starts from alphabet A to H.
SELECT * FROM STUDENT WHERE FirstName LIKE '[A-H]%'
				
--Display all the students whose name’s second character is vowel.
SELECT * FROM STUDENT WHERE FirstName LIKE '_[A,E,I,O,U]%'
		
--Display the name of students having no website and name consists of minimum five characters.
SELECT * FROM STUDENT WHERE Website IS NULL AND FirstName LIKE '_____%'

--Display all the students whose last name starts with ‘Pat’.  
SELECT * FROM STUDENT WHERE LASTNAME LIKE 'PAT%'
	
--Display all the students whose city name does not starts with ‘b’.
SELECT * FROM STUDENT WHERE CITY NOT LIKE 'B%'


-- Part - B

--Display all the students whose name starts from alphabet A or H.
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE 'A%' OR FIRSTNAME LIKE 'H%'

--Display all the students whose name’s second character is vowel and of and start with H.
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE 'H[A,E,I,O,U]%'

--Display all the students whose last name does not ends with ‘a’.
SELECT * FROM STUDENT WHERE LASTNAME NOT LIKE '%A'

--Display all the students whose first name starts with consonant.
SELECT * FROM STUDENT WHERE FIRSTNAME NOT LIKE '[A,E,I,O,U]%'

--Display all the students whose website contains .net
SELECT * FROM STUDENT WHERE WEBSITE LIKE '%.NET%'


-- Part - C

--Display all the students whose address consist of '-'.
SELECT * FROM STUDENT WHERE ADDRESS LIKE '%-%'

--Display all the students whose address contains single quote or double quote.
SELECT * FROM STUDENT WHERE ADDRESS LIKE '%''%' OR ADDRESS LIKE '%"%'
					
--Display all the students whose website contains @ name starts with j.
SELECT * FROM STUDENT WHERE WEBSITE LIKE '%@%' AND FIRSTNAME LIKE 'J%'

--Display all the names whose are either four or five characters.
SELECT FIRSTNAME FROM STUDENT WHERE FIRSTNAME LIKE'_____' OR FIRSTNAME LIKE '____'