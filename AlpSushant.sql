CREATE DATABASE CompanyManagement;

USE CompanyManagement;

CREATE TABLE Departments(
	DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
    );
    
CREATE TABLE Employee(
	EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(50),
    Position VARCHAR(200) NOT NULL,
    Salary DECIMAL(10,2),
    HiredDate DATE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
    
	);
    
    
        
        
INSERT INTO Departments (DepartmentName)
VALUES
('IT'),
('Human Resource'),
('Finance'),
('Marketing');

INSERT INTO Employee 
(FullName, Position, Salary, HiredDate, DepartmentID) VALUES
('Alice Johnson', 'HR Manager', 75000, '2018-03-15', 1),
('Bob Smith', 'Software Engineer', 95000, '2020-06-10', 2),
('Charlie Davis', 'Accountant', 65000, '2019-09-01', 3),
('Dana White', 'Marketing Specialist', 70000, '2021-01-20', 4),
('Eve Adams', 'Junior Developer', 65000, '2021-05-10', 2),
('Frank Brown', 'Marketing Intern', 30000, '2023-02-01', 4);



CREATE TABLE Clients(
	ClientID INT AUTO_INCREMENT PRIMARY KEY,
    ClientName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Phone VARCHAR(15),
    Email VARCHAR(255),
    Address TEXT
    );
    
 
INSERT INTO Clients (ClientName, ContactName, Phone, Email, Address) VALUES
('Tech Solutions', 'John Carter', '555-1234', 'john@techsolutions.com', '123 Tech St'),
('FinanceCorp', 'Sarah Lee', '555-5678', 'sarah@financecorp.com', '456 Finance Ave'),
('GreenWorks', 'Emily Clark', '555-9876', 'emily@greenworks.com', '789 Green Rd');


CREATE TABLE Projects (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(255) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(15, 2),
    DepartmentID INT,
    ClientID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);


CREATE TABLE Assignments (
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    ProjectID INT NOT NULL,
    Role VARCHAR(100),
    AssignedDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO Projects (ProjectName, StartDate, EndDate, Budget, DepartmentID, ClientID) VALUES
('Website Development', '2023-01-01', '2023-06-30', 50000, 2, 1),
('Marketing Campaign', '2023-02-01', '2023-05-31', 30000, 4, 2),
('Accounting System Upgrade', '2023-03-15', '2023-09-30', 60000, 3, 3);



INSERT INTO Assignments (EmployeeID, ProjectID, Role, AssignedDate) VALUES
(2, 1, 'Lead Developer', '2023-01-05'),
(5, 1, 'Junior Developer', '2023-01-10'),
(4, 2, 'Campaign Manager', '2023-02-10'),
(6, 2, 'Marketing Assistant', '2023-02-15'),
(3, 3, 'Accountant', '2023-03-20');


-- Let's see available data in all the tables

SELECT * from Employee;
SELECT * FROM Projects;
SELECT * FROM Clients;
SELECT * FROM Assignments;


-- inserting data into Employee() table



INSERT INTO Employee
(FullName, Position, Salary, HiredDate, DepartmentID) 
VALUES ('Grace Miller', 'Data Analyst', 80000, '2023-04-10', 2);



INSERT INTO Projects 
(ProjectName, StartDate, EndDate, Budget, DepartmentID, ClientID) 
VALUES
 ('AI Integration', '2023-05-01', '2023-12-31', 150000, 2, 1);
 
 
SELECT ProjectName, StartDate, EndDate, Budget
FROM Projects
WHERE DepartmentID = 2;

-- update salary of employee specified by by employee id 

UPDATE Employee
SET Salary = 90000
WHERE EmployeeID = 2;

UPDATE Employee 
SET Salary = 120000
WHERE DepartmentID = 2; -- Replace with the desired EmployeeID

SELECT * FROM Employee;


UPDATE Projects
SET Budget = 200000
WHERE ProjectID = 1;

SELECT e.FullName, e.Position, d.DepartmentName
FROM Employee e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

SELECT p.ProjectName, p.StartDate, p.EndDate, c.ClientName
FROM Projects p 
JOIN Clients c ON p.ClientID = c.ClientID;


-- Get Project Assignment 

SELECT p.ProjectName, e.FullName, a.Role, a.AssignedDate
FROM Assignments a 
JOIN Employee e ON a.EmployeeID = e.EmployeeID
JOIN Projects p ON a.ProjectID = p.ProjectID; 

-- Calculation of total salary by department


SELECT d.DepartmentName, SUM(e.Salary) AS TotalSalaries
FROM Employee e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;


-- Calculating highest paying categoreies

SELECT ProjectName, Budget
From Projects
ORDER BY Budget DESC;

-- For getting highest paying catagories

SELECT ProjectName, Budget
From Projects
ORDER BY Budget DESC
LIMIT 1;


-- To list employee working in specific project

SELECT e.FullName, e.Position, a.Role
FROM Assignments a 
JOIN Employee e ON a.EmployeeID = e.EmployeeID
WHERE a.ProjectID = 1;


-- creating views from the existing tables 


CREATE VIEW EmployeeProjects AS
SELECT e.FullName, p.ProjectName, a.Role
FROM Assignments a 
JOIN Employee e ON a.EmployeeID = e.EmployeeID
JOIN Projects p ON a.ProjectID = p.ProjectID;

SELECT * FROM EmployeeProjects;

/*

This query is not valid with logic as , we cannot INSERT into view that contains joins


INSERT INTO EmployeeProjects
(FullName, ProjectName, Role)
VALUES
('Srijal', 'Data Science', 'Data Sceintist'); 

*/





SELECT COUNT(FullName) FROM Employee;

SELECT SUM(Salary) FROM Employee;

select * from Employee;

SELECT COUNT(*) AS total_records FROM employee;

SELECT AVG(Salary) FROM Employee;

SELECT avg(Salary) AS AverageSalary FROM Employee;

SELECT MAX(Salary) AS MaximumSalary FROM Employee;

-- minimum salary

SELECT MIN(Salary) AS MinimumSalary FROM Employee;


-- with no alias
-- with alias

SELECT ProjectName AS FilterData FROM Projects
WHERE StartDate = '2023-01-01';


-- Retriving Data from table using Between() function\
SELECT * FROM Projects
WHERE StartDate BETWEEN '2023-01-01' AND '2023-12-01';


SELECT position, count(*) as GroupBy
FROM Employee
GROUP BY Position;

SELECT * FROM Departments;

INSERT INTO Employee
(FullName, Position, Salary, HiredDate, DepartmentID)
VALUES
('Michel Willies', 'Software Engineer', 70000, '2024-04-15', 2);


SELECT DepartmentID, count(*) as GroupBy
FROM Employee
GROUP BY DepartmentID;


-- for calculation of total salary of the respective deparment

SELECT DepartmentID, SUM(Salary) AS DepartmentSalary
From Employee
GROUP BY DepartmentID;

SELECT p.ProjectName, p.StartDate, p.EndDate, c.ClientName
FROM Projects p 
JOIN Clients c ON p.ClientID = c.ClientID;

SELECT * from Departments;

SELECT DepartmentID, SUM(Salary) AS DepartmentSalary
From Employee
GROUP BY DepartmentID;

SELECT Position, SUM(Salary) AS DepartmentSalary
From Employee
GROUP BY Position;

SELECT d.DepartmentID, e.EmployeeID, e.FullName, e.Position, e.Salary, e.HiredDate, d.DepartmentName
FROM Departments d
JOIN Employee e ON e.DepartmentID = d.DepartmentID; 

SELECT d.DepartmentID, e.EmployeeID, e.FullName, e.Position, e.Salary, e.HiredDate, d.DepartmentName, a.Role, a.AssignedDate
FROM Employee e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
JOIN Assignments a ON e.EmployeeID = a.EmployeeID;

SELECT e.DepartmentID, d.DepartmentName,e.Salary
FROM Employee e 
JOIN Departments d ON e.DepartmentID = d.DepartmentID;


-- Interesting Concept 


SELECT e.DepartmentID, d.DepartmentName, SUM(e.Salary) AS TotalSalary
FROM Employee e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY e.DepartmentID, d.DepartmentName
ORDER BY TotalSalary DESC;
-- LIMIT 1;, remove this line if you want to print all the obtained result

SELECT e.DepartmentID, d.DepartmentName, (e.Salary) AS TotalSalary
FROM Employee e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY e.DepartmentID, d.DepartmentName
ORDER BY AVG(TotalSalary) DESC;




SELECT AVG(DepartmentTotal.TotalSalary) AS AverageDepartmentSalary
FROM (
    SELECT e.DepartmentID, SUM(e.Salary) AS TotalSalary
    FROM Employee e
    GROUP BY e.DepartmentID
) AS DepartmentTotal;








