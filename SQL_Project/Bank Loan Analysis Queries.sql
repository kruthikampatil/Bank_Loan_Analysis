CREATE DATABASE bank_loan_analysis;
USE bank_loan_analysis;

CREATE TABLE loan_data (
    Customer_ID INT,
    Customer_Name VARCHAR(100),
    Gender VARCHAR(20),
    Education VARCHAR(50),
    Income INT,
    Loan_Amount INT,
    Loan_Status VARCHAR(20),
    Region VARCHAR(50),
    Credit_Score INT,
    Employment_Type VARCHAR(50)
);

SELECT * FROM loan_data;

SELECT COUNT(*) AS Total_Customers
FROM loan_data;

SELECT AVG(Loan_Amount) AS Average_Loan
FROM loan_data;

SELECT Loan_Status, COUNT(*) AS Total
FROM loan_data
GROUP BY Loan_Status;

SELECT Customer_Name,
       Income,
       CASE
           WHEN Income > 80000 THEN 'High Income'
           WHEN Income BETWEEN 40000 AND 80000 THEN 'Medium Income'
           ELSE 'Low Income'
       END AS Income_Category
FROM loan_data;

SELECT *
FROM loan_data
WHERE Loan_Amount >
(
   SELECT AVG(Loan_Amount)
   FROM loan_data
);

SELECT Customer_Name,
       Loan_Amount,
       RANK() OVER(ORDER BY Loan_Amount DESC) AS Loan_Rank
FROM loan_data;

SELECT Customer_Name,
       Income,
       DENSE_RANK() OVER(ORDER BY Income DESC) AS Income_Rank
FROM loan_data;







