select * from professor;
select * from student;

/** �ǽ��� ����ϴ� ���̺� Ȯ�� **/
SELECT * FROM student;
select * from professor;
select * from department;
select * from salgrade;
select * from tab;

/** ���̺� ���� Ȯ��**/
desc student;

desc professor;

/**��ɹ�**/
select deptno, dname, college, loc
from department;

select *
from department;

/**������ Į�� �̸� ������� ���**/
select dname, deptno
from department;


desc student;
select studno,name,weight
from student;


desc professor;
select profno,name,sal
from professor;

/*distinct - �ߺ�����*/
select distinct deptno
from student;

select distinct deptno
from professor;

select distinct position
from professor;

select distinct deptno, grade
from student;

select dname dpet_name, deptno as dn
from department;


select name �̸�, studno �й�, deptno �а���ȣ
from student;

select name �����̸�, sal "�޿�$", deptno "�а���ȣ No"
from professor;

/* �ϳ��� Į���� �ٸ� Į��, ��� ǥ���� �Ǵ� ��� ���� �����Ͽ� �ϳ��� Į��ó�� ����� ��� ��� */
select studno || ' ' || name "Student"
from student;

/*��� ���̺��� �� ���̺��� employee and title , �޸��� �������� ����, �̸��� ������ ����ǵ���*/

select * from emp;

select ename || ',' || job as "Employee and Title"
from emp;

/*��� ������ ���*/
select name, weight, weight * 2.2 as weight_pound
from student;

select empno, ename, job,sal, sal * 1.22 as "New Salary"
from emp;

select empno, ename, job,sal, sal * 1.22 as "New Salary", (sal * 1.22) - sal as "Increase"
from emp;


select studno, name, grade,deptno
from student
where grade=1;

select *
from student
where name = '������';


select name, position, sal
from professor
where position='�α���';


select studno, name, grade, deptno, weight
from student
where weight <= 70;


select studno, name, weight, deptno
from student
where grade='1' and weight >= 70;

select studno, name, weight, deptno, grade
from student
where grade='1' or weight >= 70;



select name, sal, position
from professor
where position ='����' and sal >= 300;




select studno, name, weight, deptno
from student
where not deptno = 101;

select studno, name, weight, deptno
from student
where not deptno = 101 and weight >= 70;


select studno, name, weight
from student
where weight between 50 and 70;

select * from professor;
select * from emp;
/*1*/
select ename as Name, sal * 12 as "Annual Salary"
from emp;

/*2*/
select ename || ': 1 Month salary = ' || sal "Monthly"
from emp;

/*3*/
select name, deptno
from professor
where not deptno=101 and not deptno=202;

/*4*/
select ename, sal
from emp
where sal>=2850;

/*5*/
select ename as Employee, sal as "Monthly Salary"
from emp
where sal between 1250 and 2800 and not deptno=20;