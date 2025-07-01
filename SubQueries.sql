CREATE DATABASE Office;
USE Office;

-- Table 1: Employees
CREATE TABLE Employees (emp_id INTEGER PRIMARY KEY,name TEXT,department TEXT,salary INTEGER);

-- Table 2: Projects
CREATE TABLE Projects (proj_id INTEGER PRIMARY KEY,emp_id INTEGER,project_name TEXT,FOREIGN KEY (emp_id) REFERENCES Employees(emp_id));

-- Employees
INSERT INTO Employees VALUES (1, 'Alice', 'IT', 75000);
INSERT INTO Employees VALUES (2, 'Bob', 'HR', 55000);
INSERT INTO Employees VALUES (3, 'Charlie', 'IT', 85000);
INSERT INTO Employees VALUES (4, 'Diana', 'Finance', 90000);
INSERT INTO Employees VALUES (5, 'Eva', 'HR', 50000);

-- Projects
INSERT INTO Projects VALUES (1, 1, 'Project Alpha');
INSERT INTO Projects VALUES (2, 3, 'Project Beta');
INSERT INTO Projects VALUES (3, 1, 'Project Gamma');
INSERT INTO Projects VALUES (4, 2, 'Project HR-Audit');

-- Find all employees and their total number of projects
SELECT name,
  (SELECT COUNT(*) FROM Projects WHERE Projects.emp_id = Employees.emp_id) AS total_project FROM Employees;
  
  -- Find employees who work on at least one project
SELECT * FROM Employees WHERE emp_id IN (SELECT emp_id FROM Projects);

-- Average salary of departments with subquery in FROM
SELECT department, AVG(salary) AS avg_salary
FROM (SELECT * FROM Employees WHERE salary > 50000) AS high_salary_emps GROUP BY department;

-- Find employees who are assigned to any project
SELECT * FROM Employees e
WHERE EXISTS (
  SELECT 1 FROM Projects p WHERE p.emp_id = e.emp_id
);


