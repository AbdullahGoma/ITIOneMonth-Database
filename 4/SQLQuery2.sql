-- create database Second
--  Referential Entegrity
use Second;

create table Department(Dnumber int primary key,
Dname nvarchar(50) not null
)

create table Employee(SSN int primary key,
Fname nvarchar(30) not null unique,
Lname nvarchar(30) not null,
BDATE date,
Address nvarchar(30) default 'Cairo',
Gender char(1) not null,
Salary float check(salary > 5000) not null,
Superssn int not null,
foreign key(Superssn) references Employee(SSN),
Dno int not null,
foreign key(Dno) references Department(Dnumber)
) 

-- In First
-- foreign key(Dno) REFERENCES Department(Dnumber) ON DELETE CASCADE
-- GO


Alter table Department
add MGRSSN int not null foreign key(MGRSSN) references Employee(SSN)

-- add constraint fk_MGRSSN foreign key(MGRSSN) references Employee(SSN)
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] 
FOREIGN KEY([Dnunber])
REFERENCES [dbo].[Department] ([Dnumber])
ON DELETE CASCADE
GO

Alter table Department
add MGRSDATE date

create table Project(Pnumber int primary key,
Pname nvarchar(30) not null,
Plocation nvarchar(30) not null,
City nvarchar(30) default 'Minia',
Dnum int not null,
foreign key(Dnum) references Department(Dnumber)
)

create table WorksFor(ESSN int not null,
Pno int not null,
Hours float,
foreign key(ESSN) references Employee(SSN),
foreign key(Pno) references Project(Pnumber),
primary key(ESSN,Pno)
)


create table Dependent (Name nvarchar(40) not null,
gender int not null,
Bdate date not null,
Relationship nvarchar(40) not null,
ESSN int primary key not null, 
foreign key(ESSN) references Employee(SSN)
)


insert into Department([Dname], [Dnumber]) 
values ('DP1', 10),
('Sales', 20),
('DP3', 30),
('DP3', 40)

insert into Employee([SSN],[Fname], [Lname], [BDATE], [Address],[gender] , [Salary], [Superssn], [Dno])
values (112233, 'Ahmed', 'Ali', '1965-01-01', '15 Ali fahmy St.Giza', 'M',13000 ,223344, 10),
(223344, 'Kamel', 'Mohamed', '1975-01-01','38 Mohy el dien abo el Ezz  St.Cairo','M',18000, 321654, 10),
(123456, 'Hanaa', 'Sobhy', '1973-03-18', '38 Abdel Khalik Tharwat St. Downtown.Cairo','F', 80000, 223344, 10),
(321654, 'Amr', 'Omran', '1963-01-01', '44 Hilopolis.Cairo', 'M', 25000, 321654, 10),
(968574, 'Noha', 'Mohamed', '1975-01-02', '55 Orabi St. El Mohandiseen .Cairo', 'F', 16000, 321654, 20),
(512463, 'Edward', 'Hanna', '1972-02-01', '18 Abaas El 3akaad St. Nasr City.Cairo','F', 15000, 321654, 30),
(669955, 'Mariam', 'Adel', '1982-12-06', '269 El-Haram st. Giza', 'F', 75000, 512463, 20),
(521634, 'Maged', 'Raoof', '1980-06-04', '18 Kholosi st.Shobra.Cairo', 'M', 10000, 968574, 30)

insert into Project([Pname], [Pnumber], [Plocation], [City], [Dnum])
values('AL Solimaniah', 100, 'Cairo_Alex Road', 'Alex', 10),
('Al Rabwah', 200, '6th of October City', 'Giza', 10), 
('Al Rawdah', 300, 'Zaied City', 'Giza', 10),
('Al Rowad', 400, 'Cairo_Faiyom Road','Giza', 20), 
('Al Rehab', 500, 'Nasr City', 'Cairo', 30),
('Pitcho american', 600, 'Maady', 'Cairo', 30), 
('Ebad El Rahman', 700, 'Ring Road', 'Cairo', 20)

insert into WorksFor([ESSN],[Pno],[Hours]) 
values (223344,100, 10)
,(223344,200,10)
,(223344,300,10)
,(112233,100,40)
,(968574,400,15)
,(968574,700,15)
,(968574,300,10)
,(669955,400,20)
,(223344,500,10)
,(669955,700,7)
,(669955,300,10)
,(512463,500,10)
,(512463,600,25)
,(521634,500,10)
,(521634,600,20)
,(521634,300,6)
,(521634,400,4)

create table Dependent (Name nvarchar(40) not null,
gender int not null,
Bdate date not null,
Relationship nvarchar(40) null,
ESSN int, 
foreign key(ESSN) references Employee(SSN),
primary key(ESSN, Name)
)

ALTER TABLE Dependent
DROP COLUMN gender

ALTER TABLE Dependent
ADD gender nvarchar(1)

insert into Dependent([ESSN],[Name],[gender],[Bdate])
values (112233,'Hala Saied Ali','F','1970/10/18')
,(223344,'Ahmed Kamel Shawki','M','1998/3/27')
,(223344,'Mona Adel Mohamed','F','1975/4/25')
,(321654,'Ramy Amr Omran','M','1990/1/26')
,(321654,'Omar Amr Omran','M','1993/3/30')
,(321654,'Sanaa Gawish','F','1973/5/16')
,(512463,'Sara Edward', 'F','2001/9/15')
,(512463,'Nora Ghaly','F','1976/6/22')

insert into Department(MGRSSN, MGRSDATE) 
values (223344, '2005/1/1'),
(968574, '2006/3/1'),
(512463, '2006/6/1'),
(512463, '2006/6/1')


Select * from Employee

Select fname, lname, salary, Dno from Employee

Select Pname, Plocation, Dnum from Project 

Select Fname, Lname, Salary * 12 * 0.1 as 'ANNUAL COMM' from Employee

Select SSN, Fname from Employee where Salary > 1000

Select SSN, Fname from employee where (Salary * 12) > 10000

Select Fname, Salary from Employee where gender = 'f'

Select Dname, Dnumber from Department where MGRSSN = 968574

Select Pnumber, Pname, Plocation from Project where Dnum = 10

Select Pnumber, Pname, Plocation from Project where City = 'Cairo' OR City = 'Alex'

Select * from Project where Pname Like 'A%'

Select * from Employee where (Salary between 10000 and 20000) and Dno = 30 

insert into Employee([SSN],[Fname], [Lname], [BDATE], [Address],[gender] , [Salary], [Superssn], [Dno])
values (102660, 'Abdullah', 'Gomaa', '2001/1/31','Mit Salsil Dakahlia', 'M', 150000, 112233, 30) 

insert into Employee([SSN],[Fname], [Lname], [BDATE], [Address],[gender] , [Salary], [Superssn], [Dno])
values (102632, 'Abdullgalil', 'Ahmed', '2001/4/6','Mit Salsil Dakahlia', 'M', 150000, 112233, 30)

insert into Department([Dname], [Dnumber], [MGRSSN], [MGRSDATE]) 
values ('DEPT IT', 100, 112233, '2006/11/1')


UPDATE Employee 
SET  Dno = 100 
WHERE Fname = 'Noha' and Lname = 'Mohamed'

UPDATE Employee 
SET  Dno = 20 
WHERE Fname = 'Abdullah'

UPDATE Employee 
SET  Superssn = 102660 
WHERE Fname = 'Abdullgalil'


select Superssn from Employee where Fname = 'Abdullgalil'

DELETE FROM Dependent Where ESSN = 223344

DELETE FROM WorksFor Where ESSN = 223344


select * from Department

UPDATE Department  
SET  MGRSSN = NULL
where MGRSSN = 223344

ALTER TABLE Employee 
ALTER COLUMN SUPERSSN INT NULL

ALTER TABLE Employee 
ALTER COLUMN Dno INT NULL


UPDATE Employee  
SET  Superssn = NULL
where SSN = 223344

UPDATE Employee  
SET  Dno = NULL
where SSN = 223344


DELETE FROM Department Where MGRSSN = 223344 


UPDATE Employee  
SET  Fname = 'NULL' 
where SSN = 223344

UPDATE Employee  
SET  Lname = 'NULL' 
where SSN = 223344

UPDATE Employee  
SET  Dno = 10 
where SSN = 223344
 
UPDATE Employee  
SET  Superssn =  223344
where SSN = 223344

UPDATE Employee  
SET  Address = 'NULL'
where SSN = 223344

ALTER TABLE Employee 
ALTER COLUMN SUPERSSN INT not null

ALTER TABLE Employee 
ALTER COLUMN Dno INT NOT NULL

UPDATE Employee  
SET  Superssn = 968574 
where Superssn = 223344

DELETE FROM Employee Where SSN = 223344 (work)

-- Day 4
select Dno, count(*), avg(salary)
from Employee
Group by Dno

select Salary, count(*), avg(Salary)
from Employee
Group by Salary

select Dno, count(*) AS 'Count', avg(salary) AS 'Average'
from Employee where Address = 'Alex'
Group by Dno


select Dno, count(*) AS 'Count', avg(salary) AS 'Average'
from Employee
Group by Dno
Having Dno > 20

select * from Department

Select Dname from Department 
where Dnumber = (select Dno from Employee
where Salary = (Select max(Salary) from Employee));


select Fname, Lname from Employee
where Salary > (select max(salary) from Employee 
where Dno = 10);


Select e.Fname AS 'Fname', s.Fname As 'Superssn'
from Employee e, Employee s
where e.Superssn = s.SSN


-- 13.	Display the Department id, name and id and the name of its manager.

-- select Dnumber, Dname, SSN, Fname
-- from Department join Employee on Department.Dnumber = Employee.Dno
-- where Fname = (select Fname from Employee 
-- where SSN = (select Superssn from Employee));

-- Select Dnumber, Dname, SSN, Fname , Lname
-- From Employee, Department 
-- Where Department.Dnumber = Employee.Dno and 
-- Fname = (select Fname from Employee 
-- where SSN = (select Superssn from Employee))

Select Dnumber, Dname, e.SSN AS 'SSN', s.Fname As 'SuperssnName'
from Employee e, Employee s,Department
where e.Superssn = s.SSN and e.Dno = Department.Dnumber

-- 14.Display the name of the departments and the name of the projects under its control.

Select e.Dname AS 'Department Name', s.Pname AS 'Project Name'
from Department e, Project s
where e.Dnumber = s.Dnum

-- 15.Display the full data about all the dependence associated with the name of the employee they depend on him/her.

select Fname, Lname, e.*
from Employee, Dependent e
where e.ESSN = Employee.SSN

-- 16.	Display (Using Union Function)
-- a.The name and the gender of the dependence that's gender is Female and depending on Female Employee.
-- b.And the male dependence that depends on Male Employee.

select e.Name, e.gender
from Dependent e, Employee
where e.gender = 'f' and (Employee.gender = 'f' and e.ESSN = Employee.SSN)
Union
select e.Name, e.gender
from Dependent e, Employee
where e.gender = 'm' and (Employee.gender = 'm' and e.ESSN = Employee.SSN)

-- 17.Display the full data of the employees who is managing any of the company's departments.

Select e.*
from Employee e,Department
where e.SSN = Department.MGRSSN


-- 18.Retrieve the names of all employees in department 10 
-- who works more than or equal 10 hours per week on "AL Rabwah" project.


Select Fname, Lname
from Employee, Project, WorksFor
where (Employee.SSN = WorksFor.ESSN and Employee.Dno = 10)
and (Project.Pname = 'AL Rabwah') and (WorksFor.Hours >= 10)
and (Project.Pnumber = WorksFor.Pno) and (Project.Dnum = Employee.Dno)

-- 19.Find the names of the employees who directly 
-- supervised with Kamel Mohamed.

select e.Fname, e.Lname
from Employee e 
where e.Superssn = (select SSN from Employee 
where Fname = 'Kamel' and Lname = 'Mohamed');

-- Or 

select Fname, Lname 
from Employee
where Superssn in (Select SSN from Employee 
where Fname = 'Kamel' and Lname = 'Mohamed');


-- 20.For each project, list the project name and the total hours 
-- per week (for all employees) spent on that project.

Select Pname, sum(Hours)
From Project, WorksFor 
where Pnumber = Pno
Group by Pname

-- 21.Retrieve the names of all employees who work in every project sorted.

Select Fname, Lname
From Employee, WorksFor
where SSN = ESSN
Group by Fname, Lname;

-- Or

Select Fname, Lname
From Employee
where exists(select Pnumber from Project where  
exists(select * from WorksFor where Pnumber = Pno and ESSN = SSN ));

-- 22.Display the data of the department 
-- which has the smallest employee ID over all employees' ID.

Select *
from Department
where Dnumber = (select Dno from Employee 
where SSN = (select min(SSN) from Employee));

-- 23.For each department, retrieve the department name and 
-- the maximum, minimum and average salary of its employees.

Select e.Dname, max(Salary) AS 'Maximum', 
min(Salary) AS 'Minimum', AVG(Salary) AS 'Average'
from Department e, Employee
where Dnumber = Dno
Group by Dname

-- 24.List the last name of all managers who have no dependents.

select Lname
from Employee
where exists(select MGRSSN from Department
where SSN = MGRSSN) and not exists (select ESSN from Dependent 
where SSN = ESSN)

-- select Lname
-- from Employee
-- where SSN <>all  (select ESSN from Dependent) and 
-- SSN =all (select MGRSSN from Department)

-- 25.For each department
-- if its average salary is less than the average salary of all departments
-- display its number, name and number of its employees.

-- This Display 2 rows ?????????????????????
-- I Add a Column for Average for more details
select Dname, Dnumber, count(*) 'Number Of Employees',avg(Salary) 'Average Of Salary'
from Department, Employee
where Dno = Dnumber
Group by Dnumber,Dname
Having avg(Salary) < (SELECT avg(salary) from Employee);
 

-- SELECT Dno, avg(Salary)
-- FROM Employee
-- GROUP BY Dno
-- HAVING avg(Salary) < (SELECT avg(Salary) FROM Employee);

-- 26.Retrieve a list of employees and the projects they 
-- are working on ordered by department and within each department, 
-- ordered alphabetically by last name, first name.
-- Select       fname, dept_id, hire_date
-- From         employee
-- Order by   hire_date  [ ASC ];  

-- Not the Answer
select Fname, Lname, Dname
from Employee, Department
where Dnumber = Dno
Order by Dname ASC, Fname ASC;

-- Solution Here, I add Dname and Pname for more details
select DISTINCT Fname, Lname, Pno, Dname, Pname
from Employee, Department, WorksFor, Project
where Dnumber = Dno and Dnumber = Dnum and
Pnumber = Pno 
and SSN = ESSN
Order by Dname ASC, Fname ASC;

-- 27.	For each project located in Cairo City , 
-- find the project number, the controlling department name 
-- ,the department manager last name ,address and birthdate.

DELETE FROM Department Where Dnumber = 40

insert into Department([Dname], [Dnumber], MGRSSN, MGRSDATE) 
values ('DP3', 40, 512463, '2006/6/1')

-- Solution Here
Select DISTINCT Pnumber, Dname, Lname, Address, BDATE
from Department, Project, Employee
where City = 'Cairo' and SSN = MGRSSN 
and Dnumber = Dnum;

-- 28.	Make a list of all projects’ numbers for projects 
-- that involve an employee whose last name is Mohamed, 
-- either as a worker or as a manager of the department 
-- that controls the project.(solve it with nested Q or union function )

select Pnumber
from Project, Employee
where Dno = Dnum and Lname = 'Mohamed'

-- 29.	Display the employee number and name 
-- who has no dependent on him/her (use exists).

select e.SSN, e.Fname, e.Lname
from Employee e
where not exists (select ESSN from Dependent
where e.SSN = ESSN);

