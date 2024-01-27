-- create database Company

use Company;

--create table Department (DNumber int primary key,
--Dname nvarchar(50) not null
--)

--create table Employees (Fname nvarchar(30) not null,
--Mname nvarchar(30),
--Lname nvarchar(30),
--Ssn int primary key,
--Bdate date,
--Address nvarchar(50) not null,
--gender int not null,
--Salary nvarchar(50) not null,
--Dnumber int,
--foreign key(Dnumber) references Department(DNumber)
--)

--create table DepLocations (Dlocation int not null,
--Dnumber int,
--foreign key(Dnumber) references Department(DNumber)
--)


--ALTER TABLE DepLocations ADD SsnManager int foreign key(SsnManager) references Employees(Ssn)

--ALTER TABLE DepLocations ADD MStartDate date

--create table Project (Pname nvarchar(40) not null,
--Pnumber int primary key,
--Plocation nvarchar(40) not null,
--Dnumber int,
--foreign key(Dnumber) references Department(DNumber)
--)

--create table Workson (Ssn int not null primary key,
--foreign key(Ssn) references Employees(Ssn),
--Pnumber int not null,
--foreign key(Pnumber) references Project(Pnumber),
--hours int
--)

--create table Dependent (Name nvarchar(40) not null,
--gender int not null,
--Bdate date,
--Relationship nvarchar(40) not null,
--Ssn int primary key not null, 
--foreign key(Ssn) references Employees(Ssn)
--)

--ALTER TABLE Employees ADD SUPERSSN int foreign key(SUPERSSN) references Employees(Ssn)

--ALTER TABLE Department ADD SsnManager int foreign key(SsnManager) references Employees(Ssn)

--ALTER TABLE Department ADD MStartDate date

--ALTER TABLE DepLocations DROP COLUMN SsnManager 
--ALTER TABLE DepLocations DROP COLUMN MStartDate 

--Drop table DepLocations

--create table DepLocations (Dlocation int not null,
--Dnumber int,
--foreign key(Dnumber) references Department(DNumber)
--)

--SELECT * FROM DepLocations  

--ALTER TABLE DepLocations 
--ALTER COLUMN Dnumber INT NOT NULL
--ALTER TABLE DepLocations add primary key(DNumber);

--ALTER TABLE Workson 
--ALTER COLUMN hours INT NOT NULL

--SELECT * FROM Employees;  

--ALTER TABLE Project 
--ALTER COLUMN Dnumber INT NOT NULL

--ALTER TABLE Employees 
--ALTER COLUMN SUPERSSN INT NOT NULL

--ALTER TABLE Department  
--ALTER COLUMN MStartDate DATE NOT NULL

--ALTER TABLE Dependent 
--ALTER COLUMN Bdate Date NOT NULL

--ALTER TABLE Employees 
--ALTER COLUMN Bdate date NOT NULL

--INSERT INTO "table_name” VALUES ("value1", "value2", ...) 