-- DATABASE SETUP: Create Table and Insert Data
CREATE TABLE Employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    experience INT
);

INSERT INTO Employees VALUES
(101, 'Rahul', 'IT', 75000, 'Hyderabad', 5),
(102, 'Anjali', 'HR', 45000, 'Chennai', 3),
(103, 'Kiran', 'IT', 82000, 'Bangalore', 6),
(104, 'Sneha', 'Finance', 67000, 'Hyderabad', 4),
(105, 'Aman', 'HR', 39000, 'Pune', 2),
(106, 'Ravi', 'Finance', 91000, 'Mumbai', 8),
(107, 'Divya', 'IT', 55000, 'Chennai', 3),
(108, 'Meena', 'Sales', 48000, 'Bangalore', 2),
(109, 'Arjun', 'Sales', 61000, 'Hyderabad', 5),
(110, 'Pooja', 'IT', 73000, 'Mumbai', 4),
(111, 'Vikas', 'HR', 52000, 'Pune', 3),
(112, 'Nisha', 'Finance', 88000, 'Bangalore', 7),
(113, 'Tarun', 'Sales', 46000, 'Chennai', 2),
(114, 'Kavya', 'IT', 97000, 'Hyderabad', 9),
(115, 'Manoj', 'Finance', 58000, 'Mumbai', 4);


-- 1. SELECT

-- Display all employee details.
SELECT *
FROM Employees

-- Display only employee names and salaries.
SELECT emp_name, salary
FROM Employees

-- Display employee names and departments.
SELECT emp_name, department
FROM Employees

-- Display employee names and experience.
SELECT emp_name, experience
FROM Employees

-- Display all employees from the IT department.
SELECT *
FROM Employees
WHERE department='IT'


-- 2. WHERE

-- Find employees with salary greater than 70000.
SELECT *
FROM Employees
WHERE salary>70000 

-- Find employees working in Hyderabad.
SELECT *
FROM Employees
WHERE city='HYDERABAD'

-- Find employees with experience less than 4 years.
SELECT *
FROM Employees
WHERE experience<4

-- Find employees from Finance department.
SELECT *
FROM Employees
WHERE department='Finance'

-- Find employees whose salary is equal to 52000.
SELECT *
FROM Employees
WHERE salary=52000


-- 3. GROUP BY

-- Find total salary department-wise.
SELECT department, sum(salary) as Total_salary
FROM Employees
GROUP BY department

-- Find average salary in each department.
SELECT department, avg(salary) as avg_salary
FROM Employees
GROUP BY department

-- Find maximum salary in each department.
SELECT department, max(salary) as max_salarty
FROM Employees
GROUP BY department

-- Find minimum experience department-wise.
SELECT department, min(experience) as min_experiance
FROM Employees
GROUP BY department

-- Count employees in each city.
SELECT city,  count(city) as  NoOfEmp
FROM Employees
GROUP BY city


-- 4. HAVING

-- Find departments having more than 3 employees.
SELECT department ,  count(department) as  No_of_Emp
FROM Employees
GROUP BY department
Having count(department)>3

-- Find departments where average salary is greater than 60000.
SELECT department, avg(salary) avg_salary
FROM Employees
GROUP BY department
Having avg(salary)>60000

-- Find cities having more than 2 employees.
SELECT city ,  count(city) as  No_of_Emp
FROM Employees
GROUP BY city
Having count(city)>2

-- Find departments where total salary is greater than 200000.
SELECT department ,  sum(salary) as Total_salary
FROM Employees
GROUP BY department
Having sum(salary)>200000

-- Find departments where maximum salary is above 90000.
SELECT department ,  max(salary) as Max_salary
FROM Employees
GROUP BY department
Having max(salary)>90000


-- 5. TOP

-- Display top 5 highest paid employees.
SELECT TOP(5) * 
FROM Employees
ORDER BY salary desc

-- Display top 3 employees with highest experience.
SELECT TOP(3) * 
FROM Employees
ORDER BY experience desc

-- Display top 2 salaries from Finance department.
SELECT TOP(2) * 
FROM Employees
WHERE department='Finance'
ORDER BY salary desc

-- Display top 4 employees from Hyderabad.
SELECT TOP(4) * 
FROM Employees
WHERE city='Hyderabad'

-- Display top 1 highest salary employee.
SELECT TOP(1) * 
FROM Employees
ORDER BY salary desc


-- 6. DISTINCT

-- Display distinct department names.
SELECT DISTINCT department
FROM Employees

-- Display distinct city names.
SELECT DISTINCT city
FROM Employees

-- Display distinct salary values.
SELECT DISTINCT salary
FROM Employees

-- Display distinct combinations of department and city.
SELECT DISTINCT department,city
FROM Employees

-- Display distinct experience values.
SELECT DISTINCT experience
FROM Employees


-- 7. COMPARISON OPERATORS

-- Find employees with salary >= 80000.
SELECT *
FROM Employees
WHERE  salary>=80000

-- Find employees with experience <= 3.
SELECT *
FROM Employees
WHERE experience<=3

-- Find employees whose salary <> 45000.
SELECT *
FROM Employees
WHERE salary!=45000

-- Find employees with salary < 50000.
SELECT *
FROM Employees
WHERE salary<50000

-- Find employees with experience > 5.
SELECT *
FROM Employees
WHERE experience>5


-- 8. LOGICAL OPERATORS

-- Find employees from IT department AND salary greater than 70000.
SELECT *
FROM Employees
WHERE department='IT' and salary>70000

-- Find employees from Hyderabad OR Bangalore.
SELECT *
FROM Employees
WHERE city='Hyderabad' or city= 'Bangalore'

-- Find employees from HR department AND experience less than 3.
SELECT *
FROM Employees
WHERE department='HR' and experience<3

-- Find employees with salary greater than 60000 OR experience greater than 6.
SELECT *
FROM Employees
WHERE salary>60000 or experience>6

-- Find employees NOT from Sales department.
SELECT *
FROM Employees
WHERE department!='Sales'


-- 9. IN AND NOT IN

-- Find employees working in ('Hyderabad', 'Mumbai').
SELECT *
FROM Employees
WHERE city IN ('Hyderabad','Mumbai')

-- Find employees whose department IN ('IT', 'Finance').
SELECT *
FROM Employees
WHERE department IN ('IT','Finance')

-- Find employees whose city NOT IN ('Chennai', 'Pune').
SELECT *
FROM Employees
WHERE city NOT IN ('Chennai','Pune')

-- Find employees whose salary IN (45000, 75000, 91000).
SELECT *
FROM Employees
WHERE salary IN (45000, 75000, 91000)

-- Find employees whose department NOT IN ('HR', 'Sales').
SELECT *
FROM Employees
WHERE department NOT IN ('HR','Sales')


-- 10. BETWEEN

-- Find employees with salary BETWEEN 50000 AND 80000.
SELECT *
FROM Employees
WHERE salary BETWEEN 50000 AND 80000

-- Find employees with experience BETWEEN 3 and 6.
SELECT *
FROM Employees
WHERE experience BETWEEN 3 and 6

-- Find employees whose emp_id BETWEEN 105 AND 112.
SELECT *
FROM Employees
WHERE emp_id BETWEEN 105 AND 112

-- Find employees with salary NOT BETWEEN 40000 AND 60000.
SELECT *
FROM Employees
WHERE salary NOT BETWEEN 40000 AND 60000

-- Find employees with experience BETWEEN 2 AND 4.
SELECT *
FROM Employees
WHERE experience BETWEEN 2 AND 4


-- 11. LIKE OPERATOR

-- Find employees whose names start with 'R'.
SELECT *
FROM Employees
WHERE emp_name LIKE 'R%'

-- Find employees whose names end with 'a'.
SELECT *
FROM Employees
WHERE emp_name LIKE '%a'

-- Find employees whose names contain 'v'.
SELECT *
FROM Employees
WHERE  emp_name LIKE'%v%'

-- Find employees whose city starts with 'B'.
SELECT *
FROM Employees
WHERE city LIKE 'B%'

-- Find employees whose department ends with 's'.
SELECT *
FROM Employees
WHERE department LIKE '%s'