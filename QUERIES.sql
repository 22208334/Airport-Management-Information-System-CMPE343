-- Q1
SELECT a.Plane_No, a.Year_Built, m.Manufacturer, m.Capacity
FROM Airplane a
JOIN Plane_Model m ON a.Model_No = m.Model_No;

-- Q2
SELECT Model_No, COUNT(Plane_No) AS Total_Planes
FROM Airplane
GROUP BY Model_No;

-- Q3
SELECT e.Name, COUNT(te.Model_No) AS Expertise_Count
FROM Technician_Expertise te
JOIN Employee e ON te.SSN = e.SSN
GROUP BY e.Name
HAVING COUNT(te.Model_No) > 1;

-- Q4
SELECT Test_ID, AVG(Score) AS Avg_Score
FROM Maintenance_Test
GROUP BY Test_ID;

-- Q5
SELECT Plane_No, Hangar_No, In_Date_Time
FROM Airplane_Location
WHERE Out_Date_Time IS NULL;

-- Q6
SELECT e.Name, SUM(mt.Hours_Spent) AS Total_Hours
FROM Maintenance_Test mt
JOIN Employee e ON mt.SSN = e.SSN
GROUP BY e.Name
ORDER BY Total_Hours DESC;

-- Q7
SELECT e.Name, tc.Last_Exam_Date
FROM Traffic_Controller tc
JOIN Employee e ON tc.SSN = e.SSN
WHERE tc.Last_Exam_Date < CURRENT_DATE - INTERVAL '1 year';

-- Q8
SELECT TO_CHAR(Test_Date, 'Month') AS Test_Month,
COUNT(Event_ID) AS Total_Tests
FROM Maintenance_Test
GROUP BY TO_CHAR(Test_Date, 'Month');

-- Q9
SELECT DISTINCT Plane_No
FROM Maintenance_Test
WHERE Score < 90;

-- Q10
SELECT *
FROM Maintenance_Test
WHERE Plane_No = 'TC-JAA'
ORDER BY Test_Date DESC
LIMIT 1;

-- Q11
SELECT e.Name,
       e.Union_Mem_No,
       CASE
           WHEN tc.SSN IS NOT NULL THEN 'Controller'
           WHEN t.SSN IS NOT NULL THEN 'Technician'
           ELSE 'Other'
       END AS Emp_Type
FROM Employee e
LEFT JOIN Traffic_Controller tc ON e.SSN = tc.SSN
LEFT JOIN Technician t ON e.SSN = t.SSN;

-- Q12
SELECT
    (SELECT SUM(Capacity) FROM Hangar) AS Max_Capacity,
    (SELECT COUNT(*)
     FROM Airplane_Location
     WHERE Out_Date_Time IS NULL) AS Current_Stored;

-- Q13
SELECT Plane_No
FROM Airplane
WHERE Plane_No NOT IN (
    SELECT DISTINCT Plane_No
    FROM Maintenance_Test
);

-- Q14
SELECT e.Name, mt.Score
FROM Maintenance_Test mt
JOIN Employee e ON mt.SSN = e.SSN
WHERE mt.Score = (
    SELECT MAX(Score)
    FROM Maintenance_Test
);

-- Q15
SELECT a.Model_No,
       COUNT(mt.Event_ID) AS Total_Tests,
       ROUND(AVG(mt.Hours_Spent), 2) AS Avg_Hours
FROM Maintenance_Test mt
JOIN Airplane a ON mt.Plane_No = a.Plane_No
GROUP BY a.Model_No;