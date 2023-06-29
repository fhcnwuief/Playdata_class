/**데이터 수정**/

select profno, name, position
from professor
where profno = 9903;

update professor
set position = '부교수'
where profno = 9903;

rollback;
commit;

select profno, name, position
from professor
where profno = 9903;

-- 학생 테이브렝서 박동진 학생의 몸무게를 80으로 변경
select * from student;

update student
set weight = 80
where name = '박동진';

commit;

select name, weight
from student
where name = '박동진';

select studno, grade, deptno
from student
where studno = 10201;

select studno, grade, deptno
from student
where studno = 10103;

update student
set (grade, deptno) = (select grade, deptno
                        from student
                        where studno = 10103)
where studno = 10201;

commit;

select * from professor;

update professor
set sal = sal*1.12
where position = (select position
        from professor
        where name = '성연희')
and sal <= 350;


select * from emp;

update emp
set sal = 100
where deptno = (select deptno from dept where loc = 'DALLAS');





/**데이터 삭제**/
delete from student where studno = 20103;
commit;
select * from student;

rollback;

delete from student
where deptno = (select deptno from department where dname = '컴퓨터공학과');

select * from student
where deptno = (select deptno from department where dname = '컴퓨터공학과');




/**데이터 합체(merge)**/
create table professor_tmp as
select *
from professor
where position = '교수';

update professor_tmp
set position = '명예교수'
where position = '교수';

insert into professor_tmp
values(9999,'김도경','arom21','전임강사',200,sysdate,10,101);

select * from professor;

select * from professor_tmp;

merge into professor p
using professor_tmp f
on (p.profno = f.profno)
when matched then
update set p.position = f.position
when not matched then
insert values(f.profno, f.name, f.userid,f.position,f.sal, f.hiredate,f.comm,f.deptno);

select * from professor;




/**데이터 트랜잭션 관리**/


/**시퀀스**/
create sequence s_seq
increment by 1
start with 1
maxvalue 100;

select min_value, max_value, increment_by,last_number
from user_sequences
where sequence_name = 'S_SEQ';


-- 시퀀스를 이용한 기본 키 생성
insert into emp 
values(s_seq.nextval,'cathy1','salesman',7698,sysdate,800,NULL,20);

insert into emp 
values(s_seq.nextval,'cathy2','salesman',7698,sysdate,800,NULL,20);

insert into emp 
values(s_seq.nextval,'cathy3','salesman',7698,sysdate,800,NULL,20);

select * from emp;

select s_seq.currval
from dual;

select s_seq.nextval
from dual;

alter sequence s_seq maxvalue 200;

select min_value, max_value, increment_by,last_number
from user_sequences;

drop sequence s_seq;