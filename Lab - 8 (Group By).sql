--LAB 8

CREATE TABLE Sales_Data 
(
	Region VARCHAR(50),
	Product VARCHAR(50),
	Sales_Amount INT,
	Year INT
)

INSERT INTO Sales_Data (Region, Product, Sales_Amount, Year) VALUES ('North America', 'Watch', 1500, 2023)
INSERT INTO Sales_Data (Region, Product, Sales_Amount, Year) VALUES ('Europe', 'Mobile', 1200, 2023)
INSERT INTO Sales_Data (Region, Product, Sales_Amount, Year) VALUES ('Asia', 'Watch', 1800, 2023)
INSERT INTO Sales_Data (Region, Product, Sales_Amount, Year) VALUES ('North America', 'TV', 900, 2024)
INSERT INTO Sales_Data (Region, Product, Sales_Amount, Year) VALUES ('Europe', 'Watch', 2000, 2024)
INSERT INTO Sales_Data (Region, Product, Sales_Amount, Year) VALUES ('Asia', 'Mobile', 1000, 2024)
INSERT INTO Sales_Data (Region, Product, Sales_Amount, Year) VALUES ('North America', 'Mobile', 1600, 2023)
INSERT INTO Sales_Data (Region, Product, Sales_Amount, Year) VALUES ('Europe', 'TV', 1500, 2023)
INSERT INTO Sales_Data (Region, Product, Sales_Amount, Year) VALUES ('Asia', 'TV', 1100, 2024)
INSERT INTO Sales_Data (Region, Product, Sales_Amount, Year) VALUES ('North America', 'Watch', 1700, 2024)


--PART A

--isplay Total Sales Amount by Region
SELECT Region, SUM(Sales_Amount) AS Total_Sales_Amount 
FROM Sales_Data
GROUP BY Region

--Display Average Sales Amount by Product
SELECT Product, AVG(Sales_Amount) AS Average_Sales_Amount
FROM Sales_Data
GROUP BY Product

--Display Maximum Sales Amount by Year
SELECT Year, MAX(Sales_Amount) AS Maximum_Sales_Amount
FROM Sales_Data
GROUP BY Year

--Display Minimum Sales Amount by Region and Year
SELECT Region, Year, MIN(Sales_Amount) AS Minimum_Sales_Amount
FROM Sales_Data
GROUP BY Region, Year

--Count of Products Sold by Region
SELECT Region, COUNT(DISTINCT Product) AS Product_Count
FROM Sales_Data
GROUP BY Region

--Display Sales Amount by Year and Product
SELECT Year, Product, SUM(Sales_Amount) AS Sales_Amount
FROM Sales_Data
GROUP BY Year, Product

--Display Regions with Total Sales Greater Than 5000
SELECT Region
FROM Sales_Data
GROUP BY Region
HAVING SUM(Sales_Amount) > 5000

--Display Products with Average Sales Less Than 10000
SELECT Product
FROM Sales_Data
GROUP BY Product
HAVING AVG(Sales_Amount) < 10000

--Display Years with Maximum Sales Exceeding 500
SELECT Year
FROM Sales_Data
GROUP BY Year
HAVING MAX(Sales_Amount) > 500

--Display Regions with at Least 3 Distinct Products Sold
SELECT Region
FROM Sales_Data
GROUP BY Region
HAVING COUNT(DISTINCT Product) >= 3

--Display Years with Minimum Sales Less Than 1000
SELECT Year
FROM Sales_Data
GROUP BY Year
HAVING MIN(Sales_Amount) < 1000

--Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount
SELECT Region, SUM(Sales_Amount) AS Total_Sales_Amount
FROM Sales_Data
WHERE Year = 2023
GROUP BY Region
ORDER BY Total_Sales_Amount


--PART B
--Display Count of Orders by Year and Region, Sorted by Year and Region
SELECT Year, Region, COUNT(*) AS Order_Count
FROM Sales_Data
GROUP BY Year, Region
ORDER BY Year, Region

--Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region
SELECT DISTINCT Region
FROM Sales_Data
GROUP BY Region, Year
HAVING MAX(Sales_Amount) > 1000
ORDER BY Region

--Display Years with Total Sales Amount Less Than 1000, Sorted by Year Descending
SELECT Year
FROM Sales_Data
GROUP BY Year
HAVING SUM(Sales_Amount) < 1000
ORDER BY Year DESC

--Display Top 3 Regions by Total Sales Amount in Year 2024
SELECT TOP 3 Region, SUM(Sales_Amount) AS Total_Sales_Amount
FROM Sales_Data
WHERE Year = 2024
GROUP BY Region
ORDER BY Total_Sales_Amount DESC
	

-- Part-C

--Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name
SELECT Product, AVG(Sales_Amount) AS Average_Sales_Amount
FROM Sales_Data
GROUP BY Product
HAVING AVG(Sales_Amount) BETWEEN 1000 AND 2000
ORDER BY Product

--Display Years with More Than 5 Orders from Each Region
SELECT Year
FROM Sales_Data
GROUP BY Year
HAVING COUNT(DISTINCT Region) > 5

--Display Regions with Average Sales Amount Above 1500 in Year 2023, sorted by amount in descending
SELECT Region, AVG(Sales_Amount) AS Average_Sales_Amount
FROM Sales_Data
WHERE Year = 2023
GROUP BY Region
HAVING AVG(Sales_Amount) > 1500
ORDER BY Average_Sales_Amount DESC