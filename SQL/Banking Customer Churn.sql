create database Data;

use Data

SELECT TOP 10 *
FROM [BankCustomerChurn ];


-- Query 1: Total Number of Customers
SELECT COUNT(*) AS Total_Customers
FROM [BankCustomerChurn ] ;


-- Query 2: Total Churned Customers
SELECT COUNT(*) AS Churned_Customers
FROM [BankCustomerChurn ] 
WHERE Exited = 1;


-- Query 3: Total Churned Customers Percentage

SELECT
COUNT(*) * 100.0 / (SELECT COUNT(*) FROM [BankCustomerChurn ] ) AS Churn_Rate
FROM [BankCustomerChurn ] 
WHERE Exited = 1;


-- Query 4: Customer Distribution by Country
SELECT Geography,
COUNT(*) AS Customer_Count
FROM [BankCustomerChurn ] 
GROUP BY Geography
ORDER BY Customer_Count DESC;


-- Query 5: Customer Distribution by Gender
SELECT Gender,
COUNT(*) AS Customer_Count
FROM [BankCustomerChurn ] 
GROUP BY Gender;


-- Query 6: Top 5 Oldest Customers
SELECT TOP 5 CustomerId, Age
FROM [BankCustomerChurn ] 
ORDER BY Age DESC;


-- Query 7: Top 5 Customers with Highest Account Balance
SELECT TOP 5 CustomerId, 
ROUND(Balance,2) AS Balance
FROM [BankCustomerChurn ] 
ORDER BY Balance DESC;


-- Query 8: Top 5 Customers with Highest Estimated Salary
SELECT TOP 5 CustomerId,
ROUND(EstimatedSalary,2) AS EstimatedSalary
FROM [BankCustomerChurn ] 
ORDER BY EstimatedSalary DESC;

-- Query 9: Average Account Balance by Country
SELECT Geography,
AVG(Balance) AS Avg_Balance
FROM [BankCustomerChurn ] 
GROUP BY Geography;


-- Query 10: Average Estimated Salary by Gender
SELECT Gender,
AVG(EstimatedSalary) AS Avg_Salary
FROM [BankCustomerChurn ] 
GROUP BY Gender;


-- Query 11: Churned Customers by Country
SELECT Geography,
COUNT(*) AS Churned_Customers
FROM [BankCustomerChurn ] 
WHERE Exited = 1
GROUP BY Geography;


-- Query 12: Churned Customers by Gender
SELECT Gender,
COUNT(*) AS Churned_Customers
FROM [BankCustomerChurn ] 
WHERE Exited = 1
GROUP BY Gender;


-- Query 13: Active vs Inactive Customers
SELECT IsActiveMember,
COUNT(*) AS Customer_Count
FROM [BankCustomerChurn ] 
GROUP BY IsActiveMember;


-- Query 14: Customers Owning More Than Two Products
SELECT COUNT(*) AS Customers_More_Than_2_Products
FROM [BankCustomerChurn ] 
WHERE NumOfProducts > 2;


-- Query 15: Average Churn Rate by Country
SELECT
    Geography,
    ROUND(AVG(CAST(Exited AS FLOAT)) * 100, 2) AS Churn_Rate
FROM [BankCustomerChurn ] 
GROUP BY Geography
ORDER BY Churn_Rate DESC;