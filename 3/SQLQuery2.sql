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


Alter table Department
add MGRSSN int not null foreign key(MGRSSN) references Employee(SSN)

-- add constraint fk_MGRSSN foreign key(MGRSSN) references Employee(SSN)

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
DELETE FROM Employee Where SSN = 223344 (not work)

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