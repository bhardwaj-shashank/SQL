

select * from student where roll>=3 and roll<=6

select * from student where roll between 3 and 6


create table #manav
(
	eid	int,
	ename varchar(100)
)

select roll,sname,marks into sarabjit from student where roll>=6

select roll,sname,marks into #nipin from student where roll>=6

select roll,sname,marks into ##nipin from student where roll>=6

select * from #nipin

select * from #nipin as x full outer join 
student_new as y
on x.roll=y.roll



select * from #nipin


select * from ##nipin


select * from student as s
inner join
(
	select states,max(marks) as highest from student group by states
)t
on s.states=t.states
and s.marks=t.highest


select states,max(marks) as highest 
into #toppers
from student group by states



select * from student
select * from #toppers






select * from student as s
inner join #toppers t
on s.states=t.states
and s.marks=t.highest


select roll,sname,marks into #nipin from student where roll>=6

select *,left(sname,1) from student
select *,left(sname,3) from student
select *,right(sname,1) from student
select *,right(sname,2) from student
select *,right(sname,2) from student
select *,substring(sname,2,3) from student
select *,charindex('a',sname) as bhagat from student
select *,replace(sname,'a','x') from student
select *,reverse(sname) from student

select *,reverse(student_name) from student_new
select reverse('Guha')
select *,len(sname) from student

select * from student



select power(5,2)
select ceiling(5.3)
select floor(5.3)
select abs(-10)

select *,lower(sname) from student

select *,upper(sname) from student

select *,mid(sname,2,3) from student

select stuff(sname,2,3,'xxxx') from student


select *,len(sname)-len(replace(sname,'a','')) from student

create function freq(@s varchar(100),@c varchar(1))
returns int
as
begin
	declare @x int
	set @x=len(@s)-len(replace(@s,@c,'')) 
	return @x
end


select *,dbo.freq(sname,'i') from student

select dbo.freq('Debabrata','a')

select *,charindex('bil',sname) from student

select *,charindex('e',sname) from student


create function hypo(@x float,@y float)
returns float
as
begin
	declare @h float
	set @h=sqrt(power(@x,2)+power(@y,2))
	return @h
end

select dbo.hypo(3,4)

select *,charindex('ila',sname) from student



select log10(50)

select sin(30)

select stdev(marks) from student



select * from student

alter table student
add doj datetime

select getdate()

update student
set doj='2019-11-25 18:00:00.000'
where roll=12


select *,datediff(day,doj,getdate()) from student

select *,datediff(month,doj,getdate()) from student


select *,datediff(year,doj,getdate()) from student

select *,month(doj) from student

select * from student where month(doj)=1

select *,year(doj) from student

select *,day(doj) from student

select *,datename(month,doj) from student

select *,datename(weekday,doj) from student

select *,datepart(weekday,doj) from student

select *,dateadd(day,100,doj) from student

select dateadd(day,100,getdate())





select * from
(
	select *,month(doj) as mnth
	from student
)t
where mnth=1
