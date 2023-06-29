/**������ ����**/

select profno, name, position
from professor
where profno = 9903;

update professor
set position = '�α���'
where profno = 9903;

rollback;
commit;

select profno, name, position
from professor
where profno = 9903;

-- �л� ���̺���� �ڵ��� �л��� �����Ը� 80���� ����
select * from student;

update student
set weight = 80
where name = '�ڵ���';

commit;

select name, weight
from student
where name = '�ڵ���';

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
        where name = '������')
and sal <= 350;


select * from emp;

update emp
set sal = 100
where deptno = (select deptno from dept where loc = 'DALLAS');





/**������ ����**/
delete from student where studno = 20103;
commit;
select * from student;

rollback;

delete from student
where deptno = (select deptno from department where dname = '��ǻ�Ͱ��а�');

select * from student
where deptno = (select deptno from department where dname = '��ǻ�Ͱ��а�');




/**������ ��ü(merge)**/
create table professor_tmp as
select *
from professor
where position = '����';

update professor_tmp
set position = '������'
where position = '����';

insert into professor_tmp
values(9999,'�赵��','arom21','���Ӱ���',200,sysdate,10,101);

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




/**������ Ʈ����� ����**/


/**������**/
create sequence s_seq
increment by 1
start with 1
maxvalue 100;

select min_value, max_value, increment_by,last_number
from user_sequences
where sequence_name = 'S_SEQ';


-- �������� �̿��� �⺻ Ű ����
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