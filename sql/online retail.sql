CREATE DATABASE online_retail;
USE online_retail;

CREATE TABLE sales (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice FLOAT,
    CustomerID INT,
    Country VARCHAR(50),
    IsReturn BOOLEAN,
    Revenue FLOAT,
    Year INT,
    Month INT,
    MonthName VARCHAR(10),
    Day INT,
    Weekday VARCHAR(15),
    Hour INT
);

CREATE TABLE returns (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice FLOAT,
    CustomerID INT,
    Country VARCHAR(50),
    IsReturn BOOLEAN,
    Revenue FLOAT,
    Year INT,
    Month INT,
    MonthName VARCHAR(10),
    Day INT,
    Weekday VARCHAR(15),
    Hour INT
);


## SECTION 1 -- BUSSINESS KPIs
# 1. TOTAL REVENUE
SELECT ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM sales;

# 2. TOTAL ORDERS
SELECT COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM sales;

# 3. TOTAL CUSTOMERS
SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM sales;

# 4. AVERAGE ORDER VALUE
SELECT 
    ROUND(SUM(Revenue) / COUNT(DISTINCT InvoiceNo), 2) AS Avg_Order_Value
FROM sales;


## SECTION 2 -- TIME ANALYSIS
# 1. MONTHLY REVENUE TERND
SELECT 
    Year,
    Month,
    ROUND(SUM(Revenue),2) AS Monthly_Revenue
FROM sales
GROUP BY Year, Month
ORDER BY Year, Month;

# 2. SALES BY WEEKDAYS
SELECT 
    Weekday,
    ROUND(SUM(Revenue),2) AS Revenue
FROM sales
GROUP BY Weekday
ORDER BY Revenue DESC;

# 3. SALES BY HOUR
SELECT 
    Hour,
    ROUND(SUM(Revenue),2) AS Revenue
FROM sales
GROUP BY Hour
ORDER BY Hour;
 
 
## SECTION 3 -- PRODUCT ANALYSIS
# 1. TOP 10 PRODUCTRS BY REVENUE
SELECT 
    Description,
    ROUND(SUM(Revenue),2) AS Product_Revenue
FROM sales
GROUP BY Description
ORDER BY Product_Revenue DESC
LIMIT 10;
 
# 2. TOP 10 PRODUCT BY QUANTITY SOLD
SELECT 
    Description,
    SUM(Quantity) AS Total_Quantity
FROM sales
GROUP BY Description
ORDER BY Total_Quantity DESC
LIMIT 10;


## SECTION 4 -- COUNTRY ANALYSIS
# 1. REVENUE BY COUNTRY
SELECT 
    Country,
    ROUND(SUM(Revenue),2) AS Revenue
FROM sales
GROUP BY Country
ORDER BY Revenue DESC;


## SECTION 5 -- CUSTOMER ANALYSIS
# 1. TOP 10 CUSTOMWES BY SEPNDING
SELECT 
    CustomerID,
    ROUND(SUM(Revenue),2) AS Total_Spent
FROM sales
GROUP BY CustomerID
ORDER BY Total_Spent DESC
LIMIT 10;

# 2. CUSTOMERS PURCHASE FREQUENCY
SELECT 
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Number_of_Orders
FROM sales
GROUP BY CustomerID
ORDER BY Number_of_Orders DESC;


## SECTION 6 -- RETURN ANALYSIS
# 1. RETURN RATE 
SELECT 
    ROUND(
        (SELECT COUNT(*) FROM returns) * 100.0 / 
        (SELECT COUNT(*) FROM sales),
    2) AS Return_Percentage;



  


