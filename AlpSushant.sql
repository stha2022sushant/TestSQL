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






