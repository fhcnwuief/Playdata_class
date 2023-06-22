/*student ��ü ������ �� Ȯ��*/
desc student;
/*between ������ -> and ������*/
select name, birthdate
from student
where birthdate between '81/01/01' and '83/12/31';


/*in ������ -> or ������*/
select name, grade, deptno
from student
where deptno in (102,201);

/* ����1 */
select * from emp;

select empno, ename,job,sal
from emp
where sal between 1500 and 5000 and job not in ('PRESIDENT','ANALYST');

select empno, ename,job,sal
from emp
where sal between 1500 and 5000 and job in ('PRESIDENT','ANALYST');

/* LIKE ������ : Į���� ����� ���ڿ� �� ������ �������ϰ� �κ������� ��ġ�ϸ� ��*/
/* �达�� ���*/
select name, grade, deptno
from student
where name like '��%';


/* �̸��� ������ ������ ���*/
select name, grade, deptno
from student
where name like '%��';

/* �达�̰� �̸��� ������ ������ ���*/
/* _ : �ѱ���, % : ���� ���� �������*/
select name, grade, deptno
from student
where name like '��_��';

select * from student;
/* �л����̺��� ���л��� �̸�, �г� �а���ȣ, �ֹε�Ϲ�ȣ*/
select name, grade,deptno,idnum
from student
where idnum like '______2%';

/*������ �߰�*/
insert into student(studno,name)
values (33333,'Ȳ��_��ȣ');

select * from student;
/* escape �ɼ� : like �����ڿ��� ����ϴ� ���ϵ� ����(%,_)�� �Ϲ� ����ó�� ����ϱ� ���� �ɼ�*/
select name
from student
/*escape ���ڰ�  _�տ� �����Ƿ� _�� ���ڷ� �ؼ�*/
where name like 'Ȳ��\_%' escape '\';

/* NULL : ��Ȯ�� ��, ���� ������� ���� ��. NULL���� �ٸ� ������ �������� NULL*/
select empno, sal, comm,sal + comm
from emp;
/* NULL�� ��ü �Լ� : NVL(�Ǵ� ���, ��ü ��)*/
select empno, sal, comm, NVL(sal + comm,sal)
from emp;

/* NULL�� Ȯ��*/
select name, position, comm
from professor;
/*IS NULL, IS NOT NULL*/
select name, position, comm
from professor
where comm is null;
/*��� ���̺��� Ŀ�̼��� ���� �ʰ� �̸��� ����° ���ڰ� A, �޿��� 300�̻��� ����� �̸� �޿� Ŀ�̼�*/
select * from emp;

select ename, sal, comm
from emp
where comm is null and ename like '__A%' and sal >= 2500;

/*employees ���̺��� Ŀ�̼��� ���� ��Ȥ, �޿��� 2500�̻� �̸��� ����° ���ڴ� e�� �����ϴ� ����� �̸� �޿� Ŀ�̼�*/
select * from employees;

select first_name, salary, commission_pct
from employees
where commission_pct is null and salary >=2500 and first_name like '__e%';

/*������ �켱���� : �񱳿�����,sql������-> not-> and-> or*/

select name, grade, deptno
from student
where deptno = 102 and (grade = '1' or grade = '4');

/**���� ������**/

/*������ �����ϴ� ���̺��� ����Ͽ� ������ �����Ͽ� �ű� ���̺� 2�� �����*/
create table stud_heavy
as select *
from student
where weight >= 70 and grade = '1';

create table stud_101
as select *
from student
where deptno = 101 and grade='1';

select * from stud_heavy;
select * from stud_101;


/*union - �ߺ� ���� ������ ����, union all - �ߺ� ���� ���� ������*/
/*union ������ ������ �� �� Į������ ���ƾ� ��*/
select studno, name
from stud_heavy
union
select studno, name
from stud_101;

select studno, name
from stud_heavy
union all
select studno, name
from stud_101;

/*�л� ���̺�� �������̺� ���� union ������ ���� name, userid, sal���, sal�� ������ 0*/
select name, userid,sal
from professor
union
select name, userid,0
from student;


/*intersect - ������ ����*/
select name from stud_heavy
intersect
select name from stud_101;

/*minus - ������ ����*/
/*A minus B => A - B*/
select studno �й�, name �̸�
from stud_heavy
minus
select studno, name
from stud_101;

select studno �й�, name �̸�
from stud_101
minus
select studno, name
from stud_heavy;

/* ������ ���Ӱ����� ������� ��ܿ��� ����*/
select name, position
from professor
minus 
select name, position
from professor
where position ='���Ӱ���';

select name, position
from professor
where position <> '���Ӱ���';


/*����, order by*/
/*�л� ���̺��� �̸��� �����ټ����� �����Ͽ� �̸� �г� ��ȭ��ȣ�� ���*/
select name, grade, tel
from student
order by name;
/*�л� ���̺��� �г��� ������������ �����Ͽ� �̸� �г� ��ȭ��ȣ�� ���, desc ���� �Ұ���*/
select name, grade, tel
from student
order by grade desc;
/* select ���� ���Ե��� ���� �÷��� order by �� �� ����*/

/*�μ� ��ȣ�� ����� ������ ��(1) �޿��� ���ؼ��� ��������(2) �޿��� ���ٸ� �̸��� ��������(3)*/
select ename, job,deptno,sal
from emp
order by deptno, sal desc, ename; /*��ü ���� : order by 3,4 desc,1*/


select * from emp;


/* �ǽ� */
select ename,deptno
from emp
where deptno in (10,30)
order by ename,deptno;


select ename, hiredate
from emp
where hiredate like '82/%';


select ename, sal, comm
from emp
where comm is not null
order by sal desc, comm desc;


select ename, sal, comm
from emp
where comm >= sal*0.2 and deptno = 30;

/*��� ���̺��� �޿��� 1000~5000�̰�, ������ president analyst�� �ƴϸ鼭 ���ʽ��� �޿��� 10% �̻��� ��� ����� ����
   job ��������, sal ��������*/
select empno "���", ename "����� �̸�", job "����", sal "�޿�"
from emp
where sal between 1000  and 5000 and job not in ('PRESIDENT','ANALYST') and comm >= sal *0.1
order by job desc, sal desc;


