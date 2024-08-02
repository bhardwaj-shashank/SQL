use intl_jan_weekend

select * from student

select 'hi '+sname from student

select 'hi '+cast(roll as varchar(10)) from student


select states+' '+sname as nandini from student


select states,roll,age from student

USE [intl_jan_weekend]
GO

CREATE TABLE [dbo].[student](
	[roll] [int] NULL,
	[sname] [varchar](100) NULL,
	[marks] [decimal](5, 2) NULL,
	[age] [int] NULL,
	[states] [varchar](2) NULL,
	[gender] [varchar](1) NULL,
	[emailid] [varchar](50) NULL
) ON [PRIMARY]
GO




create table [avik dey]
(
	roll	int,
	sname varchar(100)
)


drop table flight


create table flight
(
	fid				varchar(10) primary key,
	source_city		varchar(50),
	dest_city		varchar(50),
	price			int
)

create table flight
(
	fid				varchar(10),
	source_city		varchar(50),
	dest_city		varchar(50),
	price			int,
	constraint c1 primary key(fid,source_city)
)

insert into flight values
('QA123','Delhi','New York',400)

('QA123','Mumbai','Doha',200),
('EM111','Dubai','Tallinn',250),
('IN999','Bengaluru','Chennai',50)

select * from flight



drop table flight


create table flight
(
	fid				varchar(10) unique,
	source_city		varchar(50) unique,
	dest_city		varchar(50),
	price			int,
)

insert into flight values
(null,'chennai','Doha',200)

('QA123','Mumbai','Doha',200),
('EM111','Dubai','Tallinn',250),
('IN999','Bengaluru','Chennai',50)

select * from flight

drop table flight


create table flight
(
	fid				varchar(10) primary key,
	source_city		varchar(50) unique,
	dest_city		varchar(50) unique,
	price			int,
)
drop table flight


create table flight
(
	fid				varchar(10) not null,
	source_city		varchar(50) not null,
	dest_city		varchar(50) not null,
	price			int,
)

insert into flight values
('QA123','Doha','London',null)

select * from student

drop table flight


create table flight
(
	fid				varchar(10),
	source_city		varchar(50),
	dest_city		varchar(50),
	price			int default(0),
)

insert into flight(fid,source_city,dest_City) values
('QA123','Doha','London')
insert into flight(fid,source_city,dest_City,price) values
('QA123','Doha','London',100)


select * from flight


drop table flight


create table flight
(
	fid				varchar(10),
	source_city		varchar(50),
	dest_city		varchar(50),
	price			int check(price>=0),
)

insert into flight values
('QA123','chennai','Doha',-200)


drop table flight


create table flight
(
	fid				varchar(10) primary key,
	source_city		varchar(50),
	dest_city		varchar(50),
	price			int
)

insert into flight values
('QA123','Mumbai','Doha',200),
('EM111','Dubai','Tallinn',250),
('IN999','Bengaluru','Chennai',50)


select * from flight
select * from passengers

update flight
set fid='In888'
where fid='IN999'

drop table passengers

create table passengers
(
	pid			int,
	pname		varchar(100),
	flid		varchar(10) foreign key references flight(fid) on delete cascade 
)

insert into passengers values
(1,'Aishwarya','EM111'),
(2,'Anand','IN999'),
(3,'Eric','QA123')


delete from flight where fid='EM111'



create table descr
(
	col1	bigint,
	col2	int,
	col3	smallint,
	col4	tinyint,
	col5	float,
	col6	decimal(5,2),
	col7	numeric(5,2),
	col8	varchar(50),
	col9	nvarchar(50),
	col10	char(50),
	col11	varchar,
	col12	varchar(max),
	col13	datetime,
	col14	smalldatetime,
	col15	date,
	col16	bit
)

insert into descr(col1,col2,col3,col4) values
('9876543210','1876543210','9876','98')

insert into descr(col5,col6,col7) values
(98.456783824,98.456783824,98.456783824)

insert into descr(col8,col9,col10)values
('yuvraj','yuvraj','yuvraj')

insert into descr(col11)values
('y')

insert into descr(col13,col14,col15)values
('2022-11-15 09:30:00.530','2022-11-15 09:30:00.530','2022-11-15 09:30:00.530')

insert into descr(col16)values
(1),
(0)

select getdate()


select * from descr

select convert(varchar(20),col13,101) from descr
select convert(varchar(20),col13,103) from descr



'yuvraj'
'yuvraj'
'yuvraj                                            '
