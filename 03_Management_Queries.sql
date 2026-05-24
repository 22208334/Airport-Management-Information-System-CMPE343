/*
  CMPE343 Database Management Systems and Programming I
  Airport Management Information System
  File: 03_Management_Queries.sql
  Description: 15 statistical and relational SQL queries for management reporting.
*/

-- Q1. Retrieve all airplanes with their models and capacity using JOIN.
SELECT
    a.Plane_No,
    a.Year_Built,
    m.Manufacturer,
    m.Capacity
FROM Airplane a
JOIN Plane_Model m
    ON a.Model_No = m.Model_No;

-- Q2. Count the number of airplanes per plane model using GROUP BY.
SELECT
    Model_No,
    COUNT(Plane_No) AS Total_Planes
FROM Airplane
GROUP BY Model_No;

-- Q3. List technicians who are experts on more than one plane model.
SELECT
    e.Name,
    COUNT(te.Model_No) AS Expertise_Count
FROM Technician_Expertise te
JOIN Employee e
    ON te.SSN = e.SSN
GROUP BY e.Name
HAVING COUNT(te.Model_No) > 1;

-- Q4. Find the average test score for each test type.
SELECT
    Test_ID,
    AVG(Score) AS Avg_Score
FROM Maintenance_Test
GROUP BY Test_ID;

-- Q5. Find all airplanes currently parked in a hangar where Out_Date_Time is NULL.
SELECT
    Plane_No,
    Hangar_No,
    In_Date_Time
FROM Airplane_Location
WHERE Out_Date_Time IS NULL;

-- Q6. Get the total number of hours each technician spent on tests, ordered descending.
SELECT
    e.Name,
    SUM(mt.Hours_Spent) AS Total_Hours
FROM Maintenance_Test mt
JOIN Employee e
    ON mt.SSN = e.SSN
GROUP BY e.Name
ORDER BY Total_Hours DESC;

-- Q7. Find all traffic controllers whose last medical exam was more than one year ago.
SELECT
    e.Name,
    tc.Last_Exam_Date
FROM Traffic_Controller tc
JOIN Employee e
    ON tc.SSN = e.SSN
WHERE tc.Last_Exam_Date < CURRENT_DATE - INTERVAL '1 year';

-- Q8. Extract the month from Test_Date and count tests per month using TO_CHAR.
SELECT
    TO_CHAR(Test_Date, 'Month') AS Test_Month,
    COUNT(Event_ID) AS Total_Tests
FROM Maintenance_Test
GROUP BY TO_CHAR(Test_Date, 'Month');

-- Q9. List airplanes that scored below 90 in any of their tests.
SELECT DISTINCT
    Plane_No
FROM Maintenance_Test
WHERE Score < 90;

-- Q10. Get the full details of the most recent test performed on plane 'TC-JAA'.
SELECT
    *
FROM Maintenance_Test
WHERE Plane_No = 'TC-JAA'
ORDER BY Test_Date DESC
LIMIT 1;

-- Q11. List all employees and output their derived role using outer joins and conditionals.
SELECT
    e.Name,
    e.Union_Mem_No,
    CASE
        WHEN tc.SSN IS NOT NULL THEN 'Controller'
        WHEN t.SSN IS NOT NULL THEN 'Technician'
        ELSE 'Other'
    END AS Emp_Type
FROM Employee e
LEFT JOIN Traffic_Controller tc
    ON e.SSN = tc.SSN
LEFT JOIN Technician t
    ON e.SSN = t.SSN;

-- Q12. Compare total hangar capacity with the current number of stored airplanes using subqueries.
SELECT
    (SELECT SUM(Capacity) FROM Hangar) AS Max_Capacity,
    (SELECT COUNT(*) FROM Airplane_Location WHERE Out_Date_Time IS NULL) AS Current_Stored;

-- Q13. List airplanes that have not been tested yet using a subquery.
SELECT
    Plane_No
FROM Airplane
WHERE Plane_No NOT IN (
    SELECT DISTINCT Plane_No
    FROM Maintenance_Test
);

-- Q14. Find the technician name and test score for the highest score ever recorded.
SELECT
    e.Name,
    mt.Score
FROM Maintenance_Test mt
JOIN Employee e
    ON mt.SSN = e.SSN
WHERE mt.Score = (
    SELECT MAX(Score)
    FROM Maintenance_Test
);

-- Q15. Present total maintenance tests and average hours spent per test, grouped by plane model.
SELECT
    a.Model_No,
    COUNT(mt.Event_ID) AS Total_Tests,
    ROUND(AVG(mt.Hours_Spent), 2) AS Avg_Hours
FROM Maintenance_Test mt
JOIN Airplane a
    ON mt.Plane_No = a.Plane_No
GROUP BY a.Model_No;
