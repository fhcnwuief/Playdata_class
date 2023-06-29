insert into student
values(1010,'홍길동','hong','1','8501011143098','85/01/01','041)630-3114',
    170,70,101,9903);
    
select studno, name
from student
where studno = 1010;

commit; -- 데이터베이스에 영구적으로 데이터 저장

insert into department(deptno, dname)
values (300,'생명공학부');

commit;
select * from department where deptno=300;

insert into professor(profno,name, position,hiredate,deptno)
values(9920,'최윤식','조교수',to_date('2006/01/01','YYYY/MM/DD'),102);

commit;

select * from professor
where profno = 9920;

insert into professor
values (9910,'백미선','white','전임강사',200,sysdate,10,101);

commit;

select * from professor
where profno = 9910;

create table t_student
as select * from student
where 1=0;

insert into t_student
select * from student;

commit;

select * from t_student;

-- insert all 
create table height_info(
studno number(5),
name varchar2(10),
height number(5,2));

create table weight_info(
studno number(5),
name varchar2(10),
weight number(5,2));

commit;

insert all
into height_info values(studno, name, height)
into weight_info values(studno, name, weight)
select studno, name, height, weight
from student
where grade >= '2';

commit;

select * from height_info;
select * from weight_info;

delete from height_info;
delete from weight_info;
commit;

insert all
when height>170 then
    into height_info values(studno, name, height)
when weight> 70 then
    into weight_info values(studno, name, weight)
select studno, name, height, weight
from student
where grade >= '2';

select * from height_info;
select * from weight_info;
    
    
delete from height_info;
delete from weight_info;
commit;


insert first
when height>170 then
    into height_info values(studno, name, height)
when weight> 70 then
    into weight_info values(studno, name, weight)
select studno, name, height, weight
from student
where grade >= '2';

select * from height_info;
select * from weight_info;

