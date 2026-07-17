

# Day 2: Mastering Relational Joins & Set Operators

## 📌 Overview
This directory contains complete, optimized SQL solutions for a comprehensive bank of assignments covering relational database joins, anti-joins, advanced conditional filtering, and set theory operations. 

---

## 📁 Directory Structure
```text
Databricks_Training/Day2/
├── Joins_Set_Assignments_quetions.txt  # Raw assignment text
├── Join_Assignment_Sol.sql             # SQL solutions for all Join challenges
├── Set_Assignment_Sol.sql              # SQL solutions for all Set Operator challenges
└── README.md                           # Documentation and Question Dashboard (This file)

```

---

## 📊 Part 1: Joins Assignment Architecture

### Database Schema Definition

The following structural tables are utilized to model multi-table business relationships, tracking departments, employees, project details, and individual workforce allocations:

```sql
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    ManagerID INT,
    JoiningDate DATE
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    DepartmentID INT,
    Budget DECIMAL(12,2)
);

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT
);

```

### 📋 Join Question Bank

#### 🔹 Basic Level Assignments

* **INNER JOIN**
* Display employee names with department names.
* Display project names with department names.
* Show employees along with project names.
* Show employee salary and department location.
* Display all employees working on projects.


* **LEFT JOIN**
* Show all employees even if they don't belong to any department.
* Show all departments even if no employee works there.
* Show all projects and their department names.
* Show every employee and their assigned projects.
* Display all employees even if they are not assigned to any project.


* **RIGHT JOIN**
* Show all departments even if there are no employees.
* Show all projects even if no employee is assigned.
* Display every department and employees.
* Show all projects with departments.
* Show every project assignment including projects without employees.


* **FULL JOIN**
* Show all employees and all departments.
* Show all departments and projects.
* Display all employees and projects.
* Show every department whether employees exist or not.
* Show all departments and projects including unmatched records.



#### 🔸 Intermediate Level Assignments

* **INNER JOIN**
* Show employees whose department is IT.
* Display employees working on projects with a budget above 200,000.
* Show employee names, department names, and project names.
* Display total employees in each department.
* Show average salary department-wise.


* **LEFT JOIN**
* Find employees without departments.
* Find employees without projects.
* Find departments without employees.
* Find projects without departments.
* Show departments with total employees including zero employees.


* **RIGHT JOIN**
* Find departments having no employees.
* Find projects without employees.
* Show departments even if no projects exist.
* Count employees in every department.
* List every project whether employees are assigned or not.


* **FULL JOIN**
* Display all departments and employees.
* Show unmatched employees.
* Show unmatched departments.
* Show all employees and departments with NULL handling.
* Display departments and projects including unmatched rows.



#### 🚀 Advanced Level Assignments

* **INNER JOIN**
* Find the highest-paid employee in every department.
* Find the department having the highest average salary.
* Find the employee working on the highest-budget project.
* Show managers and their employees (Self-Join).
* Find employees working on more than one project.


* **LEFT JOIN**
* Find employees not assigned to any project.
* Find departments having no projects.
* Find departments having employees but no projects.
* Show employees with their respective project counts.
* Show project count department-wise including zero.


* **RIGHT JOIN**
* Find projects without employees.
* Find departments without projects.
* Find projects whose department doesn't exist.
* Find orphan employee records.
* Display every department and its employee count.


* **LEFT ANTI JOIN**
* Find employees without departments.
* Find departments without employees.
* Find employees without projects.
* Find departments without projects.
* Find projects without departments.


* **RIGHT ANTI JOIN**
* Find departments without employees.
* Find projects without employees.
* Find departments without projects.
* Find employees whose departments don't exist.
* Find projects whose departments don't exist.


* **FULL ANTI JOIN**
* Find all unmatched employees and departments.
* Find all unmatched departments and employees.
* Find projects without departments and departments without projects.
* Find employees without projects and projects without employees.
* Show all orphan records across Employees and Departments.



#### 🏆 Expert Level Challenges

1. Find the department with the highest total project budget.
2. Find employees working in departments that have no projects.
3. Find projects having multiple employees assigned.
4. Find employees assigned to projects completely outside their own department.
5. Find departments where every single employee is assigned to at least one project.
6. Find employees who share the exact same manager.
7. Find departments with no managers.
8. Find managers who oversee more than three employees.
9. Find employees who were hired before their respective manager.
10. Create one comprehensive master report showing: `Employee Name`, `Department`, `Project`, `Budget`, `Manager Name`, `Salary`, and `Department Location`.

---

## 🧮 Part 2: Set Operators Assignment Architecture

### Database Schema Definition

The following definitions handle structural logs tracking past/present workforce details, cross-border customer registrations, and physical vs. digital sales channels:

```sql
CREATE TABLE CurrentEmployees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE FormerEmployees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE DomesticCustomers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE InternationalCustomers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE OnlineOrders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2)
);

CREATE TABLE StoreOrders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2)
);

```

### 📋 Set Operator Question Bank

#### 🔹 Basic Level Assignments

* **UNION**
* Display all employee names from current and former employees without duplicates.
* Display all unique departments from both employee tables.
* Display all customer names from domestic and international customers.
* Display all customer cities without duplicates.
* Display all order amounts from both order tables without duplicates.


* **UNION ALL**
* Display all employee names including duplicates.
* Display all departments including duplicate values.
* Display all customer names including duplicates.
* Display all customer cities including duplicates.
* Display all order amounts including duplicate values.


* **EXCEPT**
* Find current employees who are not former employees.
* Find former employees who are not current employees.
* Find domestic customers not present internationally.
* Find online orders not present in store orders.
* Find departments that exist only in current employees.


* **INTERSECT**
* Find employees present in both tables.
* Find common departments.
* Find customers present in both customer tables.
* Find common cities.
* Find common orders.



#### 🔸 Intermediate Level Assignments

* **UNION**
* Display all employee IDs and names combined.
* Display all customer IDs and names combined.
* Display all salaries across the organization without duplicates.
* Display all unique order IDs.
* Combine employee and former employee department lists cleanly.


* **UNION ALL**
* Count total rows returned across both employee tables using a nested UNION ALL.
* Display all customer records including duplicates.
* Display all salaries including duplicates.
* Display all customer cities including duplicate transactions.
* Display all transactional order amounts.


* **EXCEPT**
* Find employee IDs existing only in `CurrentEmployees`.
* Find employee IDs existing only in `FormerEmployees`.
* Find customer IDs existing only in `DomesticCustomers`.
* Find customer IDs existing only in `InternationalCustomers`.
* Find online order IDs not found in `StoreOrders`.


* **INTERSECT**
* Find employee IDs common to both tables.
* Find common customer IDs.
* Find common order IDs.
* Find common salaries.
* Find common departments.



#### 🚀 Advanced Level Assignments

* **UNION**
* Combine employee names with customer names into one master list.
* Create a single unique list of all people and business organizations.
* Display all departments from both tables sorted in alphabetical order.
* Combine customer cities and employee departments into one combined result set.
* Display all IDs consolidated from both employees and customers.


* **UNION ALL**
* Combine all employee and former employee records preserving complete duplicate values.
* Display all order records combined.
* Display all customer records combined.
* Display employee names with an added hardcoded string column indicating the source table (`Current`/`Former`).
* Combine online and store orders with an explicit tracking source column.


* **EXCEPT**
* Find customers who ordered online but never ordered in-store.
* Find customers who ordered in-store but never ordered online.
* Find employee names existing only in current employees.
* Find departments unique to former employees.
* Find customer cities unique to domestic customers.


* **INTERSECT**
* Find customers who ordered both online and in-store.
* Find employees existing in both tables.
* Find departments appearing in both employee tables.
* Find customer names appearing in both customer tables.
* Find common salaries between current and former employees.



