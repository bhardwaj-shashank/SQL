
select * from awards

select * from bw.dbo.awards

select roll,sname into kumar from student


select * from kumar

alter table kumar
add marks numeric(5,2)

select * from kumar
select * from student

update k
set k.marks=s.marks 

from student as s
inner join kumar as k
on s.roll=k.roll



select *,rank() over (order by marks desc) from student
select *,dense_rank() over (order by marks desc) from student
select *,row_number() over (order by marks desc) from student
select *,NTILE(3) over (order by marks desc) from student
select *,NTILE(2) over (order by marks desc) from student
select *,lag(marks) over (order by marks desc) from student
select *,lead(marks) over (order by marks desc) from student

select * from student

select *,rank() over (partition by gender order by marks desc) from student
select *,rank() over (partition by states order by marks desc) from student

-- 1st Q
-- FMFMFMFMMM
select * from
(
	select *,row_number() over (partition by gender order by roll) as v from student
)t
order by v,gender desc


-- 2nd Q
-- finding duplicate
select * from
(
select *,row_number() over (partition by roll order by marks desc) as v from student
)t
where v>1


-- 3rd Q
-- how to find 3rd highest marks
select * from
(
	select *,rank() over (order by marks desc) as cnt from student
)t
where cnt=3


-- Q4
-- states wise toppers name
select * from
(
select *,rank() over (partition by states order by marks desc ) as cnt from student
)t
where cnt=1

select * from
(
select *,row_number() over (partition by states order by marks desc ) as y from student
)t
where y=1


select roll,count(*)
from student



group by roll
having count(*)>1





insert into student(roll,sname,marks) values
(10,'Neeraj',99),
(11,'Fathima',93)

select *,row_number() over (partition by gender 
order by marks desc) as cnt from student



select * from student order by roll


select * from student

select * from st_hobby
select * from #siva

select * from student as s
inner join st_hobby as h
on s.roll=h.roll


select * from student as s
inner join #siva as h
on s.roll=h.roll






insert into student(roll,sname,marks) values
(13,'Guha',20),
(14,'Ayan',45),
(15,'Riya',65)

91-100		A
71-<91		B
51-<71		C
31-<51		D
<31			Failed

select *,iif(marks>=91,'A',iif(marks>=71,'B',iif(marks>=51,'c','others'))) from student

select *,
		case
			when marks>=91				then 'A'
			when marks>=71 and marks<91 then 'B'
			when marks>=51 and marks<71 then 'C'
			when marks>=31 and marks<51 then 'D'
			when marks<31				then 'Failed'
			else						'NA'
		end as grade
from student






select * from
(
	select roll,sname,marks from student where age<=25
)t
where marks>90

with t as
(
	select roll,sname,marks from student where age<=25
)
delete from t where marks>90








with t as
(
select *,row_number() over (partition by roll order by marks asc) as v from student
)
delete from t where v>1



select * from student



select * from student




select * from student

select * from
(
	select * from student
)t
pivot
(
	max(marks) for subjects in([phys],[chem],[math])
)p