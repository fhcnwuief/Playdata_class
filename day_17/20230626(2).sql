-- dept 30�� �μ� ����
-- 30�� �μ��� �ڽ� ���̺��� �־ ���� �ȵ�
-- 30���� ��� 33������ �ٲ� �� 30���� �����ϸ� ��

-- 1. 33�� �μ��� �����ϱ� �������
insert into dept
values (33,'sales','seoul');

-- 2. 30���� 33������ �ٲ�
update emp
set deptno = 33
where deptno = 30;

-- 3. ����� �������� Ȯ��
select * from emp
where deptno = 30;

-- 4. 30�� �μ� ����
delete from dept where deptno = 30;





/**���Ἲ �������� �����Ͽ� ���̺� ����**/

/*cmd :
SQL> conn system/manager
SQL> create tablespace indx
  2  datafile 'C:\oraclexe\app\oracle\oradata\XE\indx.dbf' size 100m; */
  
create table subjet
(subno number(5) constraint subject_no_pk primary key deferrable initially deferred using index tablespace indx,
subname varchar2(20) constraint subject_name_nn not null,
term varchar(1) constraint subject_term_ck check (term in ('1','2')),
type varchar2(100));
select * from student;

alter table student
add constraint stud_no_pk primary key(studno);

delete from student
where studno = 33333;

create table sugang
(studno number(5) constraint sugang_studno_fk references student(studno),
subno number(5) constraint sugang_subno_fk references subjet(subno),
regdate date,
result number(3),
constraint sugang_pk primary key(studno, subno));



select constraint_name, constraint_type
from user_constraints
where table_name in ('sugang');

alter table student
add constraint atud_idnum_uk unique(idnum);

alter table student modify(deptno constraint stud_deptno_fk not null);


alter table department
add constraint dept_pk unique(deptno);   -- �⺻Ű �Ǵ� ����Ű �������� �߰�


alter table student add constraint stud_deptno_fk
foreign key(deptno) references department(deptno);

alter table professor add constraints prof_pk primary key(profno);
alter table professor modify (name not null);
alter table professor add constraints prof_fk
foreign key(deptno) references department(deptno);


select * from subjet;

desc subjet;

insert into subjet values(1,'SQL','1','');

commit;
select * from subjet;


select constraint_name, constraint_type
from user_constraints
where table_name = 'subjet';

alter table subjet
drop constraint subject_term_ck;

select constraint_name, constraint_type
from user_constraints
where table_name = 'SUBJET';


alter table sugang
disable constraint sugang_pk;

alter table sugang
disable constraint sugang_studno_fk;

select constraint_name, status
from user_constraints
where table_name in ('SUGANG','SUBJET');





-- 1. EE ���̺� ����
create table EE
(employee_id number(7),
last_name varchar2(25),
first_name varchar2(25),
deptno number(2),
phone_number varchar2(20));

-- 2. 4���� ������ �Է�
insert into EE (employee_id,last_name,first_name,deptno,phone_number)
values (1,'test1','Ben',10,'123-456');
insert into EE (employee_id,last_name,first_name,deptno,phone_number)
values 
(2,'test2','Betty',20,'123-7890-8860');
insert into EE (employee_id,last_name,first_name,deptno,phone_number)
values 
(3,'test3','Chad',20,'123-8888-2200');
insert into EE (employee_id,last_name,first_name,deptno,phone_number)
values 
(4,'test4','haha',20,'123-8888-2200');

select * from EE;

--3. primary key �������� �ɱ�/���� �� �������� �߰�
alter table EE
add constraint employee_id primary key(employee_id);
--4. �����ϵ��� ���� ���� �߰�
alter table ee add constraint deptno
foreign key(deptno) references dept(deptno);
--5. ������ �Է� ���� ���� : employee id�� �ߺ����� ����� �ȵ�
--6. ee ���̺� ����
drop table ee;