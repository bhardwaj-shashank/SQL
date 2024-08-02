select * from student_new

exec sp_rename 'dbo.student_new.marks','numbers'

select roll,student_name as sname,marks from student_new



select * from student

select count(emailid) from student 

alter table student
add emailid varchar(50)

alter table student
alter column emailid int

alter table student
drop column emailid


sp_help 'student'


select * from student

update student 
set marks=90
where roll=1

update student
set sname='Avilash'
where roll=1

update student
set sname='Abilash'
where sname='Avilash'


select roll,sname,marks 
into aashrith
from student
where roll>=3

select * from aashrith

delete from aashrith where roll=3

select * into madhav1 from student
select * into madhav2 from student

select * from madhav1
select * from madhav2


delete from madhav1
truncate table madhav2

DROP table aashrith

drop table movie
create table movie
(
	mid		int		identity(100,5),
	mname	varchar(50)
)

insert into movie values
('iron man'),
('captain america'),
('avengers'),
('Batman'),
('Spiderman')

select * from movie

truncate table movie

delete from movie

update student
set emailid=null

select * from movie

update movie
set mname=''


select * from student
select * from amazon

-- UPSERT		update if exist  insert if it is new
-- update with join
update s
set s.sname=a.studentname,
	s.marks=a.score

from amazon as a
inner join student as s
on a.roll=s.roll

insert into student(roll,sname,marks)
select a.* from amazon as a
left join student as s
on a.roll=s.roll
where s.roll is null


create procedure weekday_1130
as
update s
set s.sname=a.studentname,
	s.marks=a.score
from amazon as a
inner join student as s
on a.roll=s.roll

insert into student(roll,sname,marks)
select a.* from amazon as a
left join student as s
on a.roll=s.roll
where s.roll is null

truncate table amazon


select * from student
select * from amazon


exec weekday_1130


select * from sys.tables

create procedure ashish
as
select roll,sname,states from student
where states='DL'


create procedure nisha @s varchar(2)
as
select roll,sname,states from student
where states=@s


exec nisha 'DL'

exec nisha 'WB'

exec nisha 'CA'



merge student as s
using amazon as a
on s.roll=a.roll
when matched then update
	set s.sname=a.studentname,
		s.marks=a.score
when not matched then
	insert(roll,sname,marks)
	values(a.roll,a.studentname,a.score);
		