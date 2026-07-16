CREATE DATABASE Databricks_Day2;
USE Databricks_Day2;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

INSERT INTO Departments VALUES
(1,'HR','New York'),
(2,'Finance','Chicago'),
(3,'IT','Dallas'),
(4,'Marketing','Boston'),
(5,'Sales','Seattle'),
(6,'Operations','Atlanta');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    ManagerID INT,
    JoiningDate DATE
);

INSERT INTO Employees VALUES
(101,'John',1,50000,NULL,'2020-01-15'),
(102,'Emma',2,65000,101,'2021-03-10'),
(103,'David',3,70000,101,'2019-07-22'),
(104,'Sophia',3,72000,103,'2022-05-01'),
(105,'Michael',5,55000,102,'2021-09-18'),
(106,'Olivia',NULL,48000,102,'2023-01-12'),
(107,'James',4,60000,103,'2022-10-20'),
(108,'William',7,75000,101,'2020-08-11'),
(109,'Ava',NULL,52000,NULL,'2024-02-15'),
(110,'Isabella',5,68000,105,'2021-06-05');


CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    DepartmentID INT,
    Budget DECIMAL(12,2)
);

INSERT INTO Projects VALUES
(201,'Payroll System',1,150000),
(202,'Audit System',2,200000),
(203,'Website Redesign',4,100000),
(204,'ERP Upgrade',3,500000),
(205,'Sales Dashboard',5,175000),
(206,'Automation',6,250000),
(207,'AI Chatbot',8,300000);



CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT
);

INSERT INTO EmployeeProjects VALUES
(101,201),
(102,202),
(103,204),
(104,204),
(105,205),
(107,203),
(110,205),
(103,207),
(108,207),
(109,202);


-- PART 1: BASIC ASSIGNMENTS (JOINS)


-- ### INNER JOIN ### --

-- 1. Display employee names with department names.
SELECT EmployeeName, DepartmentName
FROM Departments as D
INNER JOIN Employees as E ON D.DepartmentID = E.DepartmentID

-- 2. Display project names with department names.
SELECT ProjectName, DepartmentName
FROM Departments as D
INNER JOIN Projects as P ON D.DepartmentID = P.DepartmentID

-- 3. Show employees along with project names.
SELECT E.EmployeeID, EmployeeName, P.ProjectID, ProjectName
FROM Employees as E
INNER JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID
INNER JOIN Projects as P ON P.ProjectID = EP.ProjectID

-- 4. Show employee salary and department location.
SELECT Salary, Location
FROM Employees as E
INNER JOIN Departments as D ON D.DepartmentID = E.DepartmentID

-- 5. Display all employees working on projects.
SELECT DISTINCT EmployeeName 
FROM Employees as E 
INNER JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID


-- ### LEFT JOIN ### --

-- 1. Show all employees even if they don't belong to any department.
SELECT EmployeeName, DepartmentName 
FROM Employees as E 
LEFT JOIN Departments as D ON E.DepartmentID = D.DepartmentID

-- 2. Show all departments even if no employee works there.
SELECT DepartmentName, EmployeeName 
FROM Departments as D 
LEFT JOIN Employees as E ON D.DepartmentID = E.DepartmentID

-- 3. Show all projects and their department names.
SELECT ProjectName, DepartmentName 
FROM Projects as P 
LEFT JOIN Departments as D ON P.DepartmentID = D.DepartmentID

-- 4. Show every employee and their assigned projects.
SELECT EmployeeName, ProjectName 
FROM Employees as E 
LEFT JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID 
LEFT JOIN Projects as P ON EP.ProjectID = P.ProjectID

-- 5. Display all employees even if they are not assigned to any project.
SELECT EmployeeName, ProjectName 
FROM Employees as E 
LEFT JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID 
LEFT JOIN Projects as P ON P.ProjectID = EP.ProjectID


-- ### RIGHT JOIN ### --

-- 1. Show all departments even if there are no employees.
SELECT DepartmentName, EmployeeName 
FROM Employees as E 
RIGHT JOIN Departments as D ON E.DepartmentID = D.DepartmentID

-- 2. Show all projects even if no employee is assigned.
SELECT ProjectName, EmployeeName 
FROM EmployeeProjects as EP 
RIGHT JOIN Projects as P ON EP.ProjectID = P.ProjectID 
LEFT JOIN Employees as E ON EP.EmployeeID = E.EmployeeID

-- 3. Display every department and employees.
SELECT DepartmentName, EmployeeName 
FROM Employees as E 
RIGHT JOIN Departments as D ON E.DepartmentID = D.DepartmentID

-- 4. Show all projects with departments.
SELECT ProjectName, DepartmentName 
FROM Departments as D 
RIGHT JOIN Projects as P ON D.DepartmentID = P.DepartmentID

-- 5. Show every project assignment including projects without employees.
SELECT ProjectName, EmployeeName 
FROM EmployeeProjects as EP 
RIGHT JOIN Projects as P ON EP.ProjectID = P.ProjectID 
LEFT JOIN Employees as E ON EP.EmployeeID = E.EmployeeID


-- ### FULL JOIN ### --

-- 1. Show all employees and all departments.
SELECT EmployeeName, DepartmentName 
FROM Employees as E 
FULL JOIN Departments as D ON E.DepartmentID = D.DepartmentID

-- 2. Show all departments and projects.
SELECT DepartmentName, ProjectName 
FROM Departments as D 
FULL JOIN Projects as P ON D.DepartmentID = P.DepartmentID

-- 3. Display all employees and projects.
SELECT EmployeeName, ProjectName 
FROM Employees as E 
FULL JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID 
FULL JOIN Projects as P ON EP.ProjectID = P.ProjectID

-- 4. Show every department whether employees exist or not.
SELECT DepartmentName, EmployeeName 
FROM Departments as D 
FULL JOIN Employees as E ON D.DepartmentID = E.DepartmentID

-- 5. Show all departments and projects including unmatched records.
SELECT DepartmentName, ProjectName 
FROM Departments as D 
FULL JOIN Projects as P ON D.DepartmentID = P.DepartmentID


-- =========================================================================
-- PART 2: INTERMEDIATE ASSIGNMENTS (JOINS)
-- =========================================================================

-- ### INNER JOIN ### --

-- 1. Show employees whose department is IT.
SELECT EmployeeName 
FROM Employees as E 
INNER JOIN Departments as D ON E.DepartmentID = D.DepartmentID 
WHERE DepartmentName = 'IT'

-- 2. Display employees working on projects with budget above 200000.
SELECT DISTINCT EmployeeName 
FROM Employees as E 
INNER JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID 
INNER JOIN Projects as P ON EP.ProjectID = P.ProjectID 
WHERE Budget > 200000

-- 3. Show employee names, department names and project names.
SELECT EmployeeName, DepartmentName, ProjectName 
FROM Employees as E 
INNER JOIN Departments as D ON E.DepartmentID = D.DepartmentID 
INNER JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID 
INNER JOIN Projects as P ON EP.ProjectID = P.ProjectID

-- 4. Display total employees in each department.
SELECT DepartmentName, COUNT(EmployeeID) AS TotalEmployees 
FROM Departments as D 
INNER JOIN Employees as E ON D.DepartmentID = E.DepartmentID 
GROUP BY DepartmentName

-- 5. Show average salary department-wise.
SELECT DepartmentName, AVG(Salary) AS AvgSalary 
FROM Departments as D 
INNER JOIN Employees as E ON D.DepartmentID = E.DepartmentID 
GROUP BY DepartmentName


-- ### LEFT JOIN ### --

-- 1. Find employees without departments.
SELECT EmployeeName 
FROM Employees as E 
LEFT JOIN Departments as D ON E.DepartmentID = D.DepartmentID 
WHERE D.DepartmentID IS NULL

-- 2. Find employees without projects.
SELECT EmployeeName 
FROM Employees as E 
LEFT JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID 
WHERE EP.ProjectID IS NULL

-- 3. Find departments without employees.
SELECT DepartmentName 
FROM Departments as D 
LEFT JOIN Employees as E ON D.DepartmentID = E.DepartmentID 
WHERE E.EmployeeID IS NULL

-- 4. Find projects without departments.
SELECT ProjectName 
FROM Projects as P 
LEFT JOIN Departments as D ON P.DepartmentID = D.DepartmentID 
WHERE D.DepartmentID IS NULL

-- 5. Show departments with total employees including zero employees.
SELECT DepartmentName, COUNT(EmployeeID) AS TotalEmployees 
FROM Departments as D 
LEFT JOIN Employees as E ON D.DepartmentID = E.DepartmentID 
GROUP BY DepartmentName


-- ### RIGHT JOIN ### --

-- 1. Find departments having no employees.
SELECT DepartmentName 
FROM Employees as E 
RIGHT JOIN Departments as D ON E.DepartmentID = D.DepartmentID 
WHERE E.EmployeeID IS NULL

-- 2. Find projects without employees.
SELECT ProjectName 
FROM EmployeeProjects as EP 
RIGHT JOIN Projects as P ON EP.ProjectID = P.ProjectID 
WHERE EP.EmployeeID IS NULL

-- 3. Show departments even if no projects exist.
SELECT DepartmentName, ProjectName 
FROM Projects as P 
RIGHT JOIN Departments as D ON P.DepartmentID = D.DepartmentID

-- 4. Count employees in every department.
SELECT DepartmentName, COUNT(EmployeeID) AS TotalEmployees 
FROM Employees as E 
RIGHT JOIN Departments as D ON E.DepartmentID = D.DepartmentID 
GROUP BY DepartmentName

-- 5. List every project whether employees are assigned or not.
SELECT ProjectName 
FROM EmployeeProjects as EP 
RIGHT JOIN Projects as P ON EP.ProjectID = P.ProjectID


-- ### FULL JOIN ### --

-- 1. Display all departments and employees.
SELECT DepartmentName, EmployeeName 
FROM Departments as D 
FULL JOIN Employees as E ON D.DepartmentID = E.DepartmentID

-- 2. Show unmatched employees.
SELECT EmployeeName 
FROM Employees as E 
FULL JOIN Departments as D ON E.DepartmentID = D.DepartmentID 
WHERE D.DepartmentID IS NULL

-- 3. Show unmatched departments.
SELECT DepartmentName 
FROM Employees as E 
FULL JOIN Departments as D ON E.DepartmentID = D.DepartmentID 
WHERE E.EmployeeID IS NULL

-- 4. Show all employees and departments with NULL handling.
SELECT ISNULL(EmployeeName, 'No Employee') AS EmployeeName, 
       ISNULL(DepartmentName, 'No Department') AS DepartmentName 
FROM Employees as E 
FULL JOIN Departments as D ON E.DepartmentID = D.DepartmentID

-- 5. Display departments and projects including unmatched rows.
SELECT DepartmentName, ProjectName 
FROM Departments as D 
FULL JOIN Projects as P ON D.DepartmentID = P.DepartmentID


-- =========================================================================
-- PART 3: ADVANCED ASSIGNMENTS & ANTI-JOINS
-- =========================================================================

-- ### INNER JOIN ### --

-- 1. Find highest-paid employee in every department.
SELECT DepartmentName, EmployeeName, Salary 
FROM Employees as E 
INNER JOIN Departments as D ON E.DepartmentID = D.DepartmentID 
WHERE Salary = (SELECT MAX(Salary) FROM Employees WHERE DepartmentID = E.DepartmentID)

-- 2. Find department having highest average salary.
SELECT TOP 1 DepartmentName, AVG(Salary) AS AvgSalary 
FROM Departments as D 
INNER JOIN Employees as E ON D.DepartmentID = E.DepartmentID 
GROUP BY DepartmentName 
ORDER BY AvgSalary DESC

-- 3. Find employee working on highest-budget project.
SELECT EmployeeName, ProjectName, Budget 
FROM Employees as E 
INNER JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID 
INNER JOIN Projects as P ON EP.ProjectID = P.ProjectID 
WHERE Budget = (SELECT MAX(Budget) FROM Projects)

-- 4. Show managers and their employees.
SELECT M.EmployeeName AS ManagerName, E.EmployeeName AS EmployeeName 
FROM Employees as E 
INNER JOIN Employees as M ON E.ManagerID = M.EmployeeID

-- 5. Find employees working on more than one project.
SELECT E.EmployeeID, EmployeeName , COUNT(EP.ProjectID) AS WorkingProjects
FROM Employees as E 
INNER JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID 
GROUP BY E.EmployeeID, EmployeeName 
HAVING COUNT(EP.ProjectID) > 1


-- ### LEFT JOIN ### --

-- 1. Find employees not assigned to any project.
SELECT EmployeeName ,ProjectID
FROM Employees as E 
LEFT JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID 
WHERE EP.ProjectID IS NULL

-- 2. Find departments having no projects.
SELECT DepartmentName ,ProjectName
FROM Departments as D 
LEFT JOIN Projects as P ON D.DepartmentID = P.DepartmentID 
WHERE P.ProjectID IS NULL

-- 3. Find departments having employees but no projects.
SELECT DepartmentName 
FROM Departments as D 
INNER JOIN Employees as E ON D.DepartmentID = E.DepartmentID 
LEFT JOIN Projects as P ON D.DepartmentID = P.DepartmentID 
WHERE P.ProjectID IS NULL 
GROUP BY DepartmentName

-- 4. Show employees with project count.
SELECT E.EmployeeID, EmployeeName, COUNT(EP.ProjectID) AS ProjectCount 
FROM Employees as E 
LEFT JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID 
GROUP BY E.EmployeeID, EmployeeName

-- 5. Show project count department-wise including zero.
SELECT D.DepartmentID, DepartmentName, COUNT(ProjectID) AS ProjectCount 
FROM Departments as D 
LEFT JOIN Projects as P ON D.DepartmentID = P.DepartmentID 
GROUP BY D.DepartmentID, DepartmentName


-- ### RIGHT JOIN ### --

-- 1. Find projects without employees.
SELECT ProjectName 
FROM EmployeeProjects as EP 
RIGHT JOIN Projects as P ON EP.ProjectID = P.ProjectID 
WHERE EP.EmployeeID IS NULL

-- 2. Find departments without projects.
SELECT DepartmentName 
FROM Projects as P 
RIGHT JOIN Departments as D ON P.DepartmentID = D.DepartmentID 
WHERE P.ProjectID IS NULL

-- 3. Find projects whose department doesn't exist.
SELECT ProjectName 
FROM Departments as D 
RIGHT JOIN Projects as P ON D.DepartmentID = P.DepartmentID 
WHERE D.DepartmentID IS NULL

-- 4. Find orphan employee records.
SELECT EmployeeName 
FROM Departments as D 
RIGHT JOIN Employees as E ON D.DepartmentID = E.DepartmentID 
WHERE D.DepartmentID IS NULL

-- 5. Display every department and employee count.
SELECT DepartmentName, COUNT(E.EmployeeID) AS EmployeeCount 
FROM Employees as E 
RIGHT JOIN Departments as D ON E.DepartmentID = D.DepartmentID 
GROUP BY D.DepartmentID, DepartmentName


-- ### LEFT ANTI JOIN ### --

-- 1. Find employees without departments.
SELECT E.* 
FROM Employees as E 
LEFT JOIN Departments as D  ON E.DepartmentID = D.DepartmentID 
WHERE D.DepartmentID IS NULL

-- 2. Find departments without employees.
SELECT D.* 
FROM Departments as D 
LEFT JOIN Employees as E ON D.DepartmentID = E.DepartmentID 
WHERE E.EmployeeID IS NULL

-- 3. Find employees without projects.
SELECT E.* 
FROM Employees as E 
LEFT JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID 
WHERE EP.ProjectID IS NULL

-- 4. Find departments without projects.
SELECT D.* 
FROM Departments as D 
LEFT JOIN Projects as P ON D.DepartmentID = P.DepartmentID 
WHERE P.ProjectID IS NULL

-- 5. Find projects without departments.
SELECT P.* 
FROM Projects as P 
LEFT JOIN Departments as D ON P.DepartmentID = D.DepartmentID 
WHERE D.DepartmentID IS NULL


-- ### RIGHT ANTI JOIN ### --

-- 1. Departments without employees.
SELECT D.* 
FROM Employees as E 
RIGHT JOIN Departments as D ON E.DepartmentID = D.DepartmentID 
WHERE E.EmployeeID IS NULL

-- 2. Projects without employees.
SELECT P.* 
FROM EmployeeProjects as EP 
RIGHT JOIN Projects as P ON EP.ProjectID = P.ProjectID 
WHERE EP.EmployeeID IS NULL

-- 3. Departments without projects.
SELECT D.* 
FROM Projects as P 
RIGHT JOIN Departments as D ON P.DepartmentID = D.DepartmentID 
WHERE P.ProjectID IS NULL

-- 4. Employees whose departments don't exist.
SELECT E.* 
FROM Departments as D 
RIGHT JOIN Employees as E ON D.DepartmentID = E.DepartmentID 
WHERE D.DepartmentID IS NULL

-- 5. Projects whose departments don't exist.
SELECT P.* 
FROM Departments as D 
RIGHT JOIN Projects as P ON D.DepartmentID = P.DepartmentID 
WHERE D.DepartmentID IS NULL


-- ### FULL ANTI JOIN ### --

-- 1. Find all unmatched employees and departments.
SELECT * 
FROM Employees as E 
FULL JOIN Departments as D ON E.DepartmentID = D.DepartmentID 
WHERE E.DepartmentID IS NULL OR D.DepartmentID IS NULL

-- 2. Find all unmatched departments and employees.
SELECT * 
FROM Departments as D 
FULL JOIN Employees as E ON D.DepartmentID = E.DepartmentID 
WHERE D.DepartmentID IS NULL OR E.EmployeeID IS NULL

-- 3. Find projects without departments and departments without projects.
SELECT *
FROM Projects as P 
FULL JOIN Departments as D ON P.DepartmentID = D.DepartmentID 
WHERE P.DepartmentID IS NULL OR D.DepartmentID IS NULL

-- 4. Find employees without projects and projects without employees.
SELECT EmployeeName, ProjectName 
FROM Employees as E 
FULL JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID 
FULL JOIN Projects as P ON EP.ProjectID = P.ProjectID 
WHERE EP.EmployeeID IS NULL OR EP.ProjectID IS NULL

-- 5. Show all orphan records across Employees and Departments.
SELECT * 
FROM Employees as E 
FULL JOIN Departments as D ON E.DepartmentID = D.DepartmentID 
WHERE E.DepartmentID IS NULL OR D.DepartmentID IS NULL OR  E.EmployeeID=NULL


-- =========================================================================
-- PART 4: EXPERT LEVEL CHALLENGES
-- =========================================================================

-- 1. Find the department with the highest project budget.
SELECT TOP 1 DepartmentName, SUM(Budget) AS TotalBudget 
FROM Departments as D 
INNER JOIN Projects as P ON D.DepartmentID = P.DepartmentID 
GROUP BY DepartmentName 
ORDER BY TotalBudget DESC

-- 2. Find employees working in departments without projects.
SELECT EmployeeName 
FROM Employees as E 
INNER JOIN Departments as D ON E.DepartmentID = D.DepartmentID 
LEFT JOIN Projects as P ON D.DepartmentID = P.DepartmentID 
WHERE P.ProjectID IS NULL

-- 3. Find projects having multiple employees.
SELECT ProjectName ,COUNT(EP.EmployeeID) AS TotalEmployes
FROM Projects as P 
INNER JOIN EmployeeProjects as EP ON P.ProjectID = EP.ProjectID 
GROUP BY P.ProjectID, ProjectName 
HAVING COUNT(EP.EmployeeID) > 1

-- 4. Find employees assigned to projects outside their own department.
SELECT EmployeeName, ProjectName ,P.DepartmentID as ProjectDEP, E.DepartmentID AS EmployeDep
FROM Employees as E 
INNER JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID 
INNER JOIN Projects as P ON EP.ProjectID = P.ProjectID 
WHERE E.DepartmentID IS NOT NULL AND E.DepartmentID <> P.DepartmentID

-- 5. Find departments where every employee is assigned to a project.
SELECT D.DepartmentName
FROM Departments as D
INNER JOIN Employees as E ON D.DepartmentID = E.DepartmentID
LEFT JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID
GROUP BY D.DepartmentID, D.DepartmentName
HAVING COUNT(DISTINCT E.EmployeeID) = COUNT(DISTINCT EP.EmployeeID)


-- 6. Find employees who share the same manager.
SELECT E.EmployeeName, M.EmployeeName AS ManagerName 
FROM Employees as E 
INNER JOIN Employees as M ON E.ManagerID = M.EmployeeID 
WHERE E.ManagerID IN (SELECT ManagerID FROM Employees GROUP BY ManagerID HAVING COUNT(*) > 1)

-- 7. Find departments with no managers.
SELECT DepartmentName 
FROM Departments as D 
WHERE D.DepartmentID NOT IN (SELECT DepartmentID FROM Employees WHERE EmployeeID IN (SELECT ManagerID FROM Employees WHERE ManagerID IS NOT NULL))

-- 8. Find managers with more than three employees.
SELECT M.EmployeeName, COUNT(E.EmployeeID) AS EmployeeCount 
FROM Employees as E 
INNER JOIN Employees as M ON E.ManagerID = M.EmployeeID 
GROUP BY M.EmployeeID, M.EmployeeName 
HAVING COUNT(E.EmployeeID) > 3

-- 9. Find employees hired before their manager.
SELECT E.EmployeeName 
FROM Employees as E 
INNER JOIN Employees as M ON E.ManagerID = M.EmployeeID 
WHERE E.JoiningDate < M.JoiningDate

-- 10. Create one report showing all requested fields.
SELECT E.EmployeeName, DepartmentName, ProjectName, Budget, M.EmployeeName AS ManagerName, E.Salary, Location
FROM Employees as E
LEFT JOIN Departments as D ON E.DepartmentID = D.DepartmentID
LEFT JOIN EmployeeProjects as EP ON E.EmployeeID = EP.EmployeeID
LEFT JOIN Projects as P ON EP.ProjectID = P.ProjectID
LEFT JOIN Employees as M ON E.ManagerID = M.EmployeeID


