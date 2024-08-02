

Create database intl_jan_weekend

create table student
(  roll int,
   sname varchar(100),
   marks decimal(5,2),
   age int,
   states varchar(2),
   gender varchar(1)
)

select * from 
student;

INSERT INTO student (roll, sname, marks, age, states, gender)
VALUES 
(1, 'Deep Patel', 95.00, 27, 'GJ', 'M'),
(2, 'Sanju Smith', 90.50, 27, 'HR', 'M'),
(3, 'Sonali Davis', 88.00, 28, 'CA', 'F'),
(4, 'Tarun Pandt', 88.00, 25, 'CA', 'M'),
(5, 'RAja Jani ', 85.70, 23, 'WB', 'M'),
(6, 'Neha pandy', 83.58, 25, 'DL', 'F'),
(7, 'Abhilash Singh', 81.00, 25, 'DL', 'M')
;

--- <3 roll 
SELECT * 
FROM student
WHERE roll < 3;

-----as per marks 
select * from student order by marks
select * from student order by marks desc
select * from student order by marks desc,age desc

-- top 1 
select top 1 * from student order by marks desc --top to bottom gg
select top 2 * from student order by age  
select roll,sname, marks,states from student -- exclude student from CA
where states !='CA'
ORDER BY marks desc

--- distict ubiques results 
select distinct states from student 
select * from student where states='DL' and states='CA'
select * from student where states='DL' or states='CA'
select * from student where states='DL' and roll<=4
select * from student where states='DL' or roll<=4

----- in operatoe 
select * from student where states in ('DL','CA')
select * from student where states not in ('DL','CA') and age>=25 --3 criteria
select * from student where states  !='CA' and roll<=4 and age>=25 
select distinct* from student where states in ('DL','CA')

---- max min 
select max(marks) from student 
select min(marks) from student 
select sum(marks) from student 
select avg(marks) from student 
select count(marks) from student 
select max(marks),min(marks),sum(marks) from student
---- wildcard 
select * from student where sname like 'a%'
select * from student where sname like 'J____'
select * from student where sname like '%a%'

---- new table
create table student_new
( roll int,
  student_name varchar(50),
  score float
)
insert into student_new values
(1,'Eric',93.5),
(2,'Harshita',86.5),
(3,'Himani',91),
(50,'Sinchan',87),
(51,'Shabana',92)
select * from student_new

---- union operators  union all va union
select roll from student 
union all 
select roll from student_new

select roll from student 
union
select roll from student_new

---- intersect common
select roll from student 
intersect
select roll from student_new

----------- except
select roll from student 
except
select roll from student_new

------sub query 
select * from student where roll in (1,2,3)
select * from student where roll in (select roll from student_new)
----sub-query will fetch roll numbers available in other table

select * from student where marks>=(select avg(marks) from student)


select * from 
(select top 3 * from student order by marks desc) t
order by marks

-------------- inside sub query des outside asecending
select top 1 * from 
(select top 3 * from student order by marks desc) t
order by marks

----- group by 
select avg(marks) from student group by states --- 5 states 
select states,avg(marks) from student group by states
--- avoid  west bangal and genderwise shrink 
select gender , avg(marks) from student where states !='wb'
group by gender
---- put filter f/m 
select gender , avg(marks) from student where states !='wb'
group by gender
having avg(marks)>85.5 and avg(marks)<=99

---------------
select states, avg(marks) from student where age<27
group by states
having avg(marks)>=86

----join 
create table sthobby
(roll int,
interest varchar(40)
)
insert into sthobby values 
(1,'cooking'),
(2,'tarvelling'),
(3,'teaching'),
(50,'singing'),
(51,'reading');

select * from sthobby
-----JOINING >> CROSS OR CARTESIAN RECORDS 

SELECT * FROM student, sthobby

--------GOT VALID DATA ROLL AND ROLL NOT MATCHIN G 

SELECT * FROM student, sthobby
WHERE STUDENT.ROLL=STHOBBY.ROLL 

 ---- ROLL IS MATCHIN G WITH ROLL 
 ---- joining 
 SELECT * FROM student as s inner join sthobby as h
on s.ROLL=h.ROLL 

---- Three queries 
-- SELECT * FROM student as sinner join sthobby as h
 SELECT * FROM student as s left join sthobby as h
on s.ROLL=h.ROLL 

--- right / left join will gives null values 

SELECT * FROM student as s full outer join sthobby as h
on s.ROLL=h.ROLL 

---Join 
select * from student 
select gender , max(marks)as higest from student 
group by gender
insert into student values 
(9,'subhashish',93.30,25,'wb','m');

-----inner join will have exact same common column 

select * from student as s
inner join
(
select gender , max(marks)as higest from student 
group by gender
)t
on s.marks=t.higest and s.gender=t.gender


---- Add new column 
alter table student 
add emailid varchar(50)

---- remove drop column 
alter table student 
drop column emailid 
---- update , remove 
update student 
set marks=90
where roll=1
delete from aashrthi where roll=3

-----------  creating tables from  ols table 
select * into m1 from student 
select * into m2 from student 

---- difference between delete and trucate 

sp_help 'student' -- gives meta data type
---add identity before for details 

---- load csv ec=xcel
--import data> xls
---upsert 



--update s
--set s.sname=a.studentname
 --   s.marks=a.score

---- compare and find new data 

--select a.* from amazon as a left join student as s 
--on a.roll=s.roll
--where s.roll is null 

--switch database

use intl_jan_weekend

----conketination
select states+' '+sname from student

----conputed coulmn 

select sname as fullname from student

---delete duplicate data 
-- put constrainsts , shop inserting data many times

create table flight
( fid varchar(10) PRIMARY KEY,
  source_city varchar(50),
  dest_city varchar(50),
  price  int
  )

insert into flight values 
('QA123','MUNMBAI','DOHA',200),
('Em111','dubai','Tallinn',250),
('IN153','BANGLARU','CHENNAI',60)

DROP TABLE FLIGHT 

insert into flight values 
('QA123','MUNMBAI','DOHA',200)

SELECT * FROM flight
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- PRIMAY KONSTARAIN ( PRIMARY KEY )

-- CREATE pk WITH TWO COLUMNS 
create table flight
( fid varchar(10),
  source_city varchar(50),
  dest_city varchar(50),
  price  int,
  PRIMARY KEY(FID,SOURCE_CITY)

  --->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> UNIQUE KEY 
  ---CAN CREATE TWO KEYS >>> DOES NOT ALLOWS DUPLICATE OF NULL
  --->>> NOT NULL

  create table flight
( fid varchar(10) UNIQUE KEY,
  source_city varchar(50) UNIQUE KEY,
  dest_city varchar(50),
  price  int
  )
 
 --->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

 -- PRICE INT DEFAULT(0) DEFAULT VALUE






