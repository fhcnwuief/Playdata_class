/**join**/

select studno, name, student.deptno, department.dname
from student, department
where student.deptno = department.deptno;


-- ��� ���̺��� dallas ���� �ٹ��ϴ� ����� ���, �̸� �μ���ȣ, �μ��̸� , �μ� ��ġ�� ���

select * from emp;
select * from dept;
select e.empno, e.ename, e.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and d.loc = 'DALLAS';

-- �޿��� 400 �̻��� ���� �̸�, �޿� �а���ȣ, �а� �̸�

select p.name, p.sal, p.deptno, d.dname
from professor p, department d
where p.deptno = d.deptno and p.sal >= 400;

select * from ;
-- ��ǻ�Ͱ��а� �л����� �й�, �̸�, �а���ȣ, �а��̸�, �а� ��ġ, �������� �̸�, �޿�
select s.studno �й�, s.name �̸�, s.deptno �а���ȣ,
        d.dname �а��̸�,d.loc �а���ġ,p.name ��������, p.sal �޿�
from student s, professor p ,department d
where s.deptno = 101 and p.profno = s.profno and d.deptno = 101;

select s.studno, s.name, s.deptno, d.dname, d.loc
from student s, department d
where s.deptno = d.deptno;



--1.  ���ʽ��� ������ �̸��� ���ʽ��� ����ϰ�, ���� ������ �̸��� 200 ����� ������.(emp)

select ename, NVL(comm,'200')
from emp;

--2. �� �޿��� $5,000�� �Ѵ� �� JOB�� ���� JOB�� ���� �Ѿ��� ����ϼ���.
--(��, PRESIDENT�� ���ܽ�Ű��, ���� �Ѿ׺����� ����)

select job,sum(sal)
from emp
where job != 'PRESIDENT'
group by job
having sum(sal)>=5000
order by sum(sal);

select * from emp;
--3.CHICAGO�� �ٹ��ϴ� ��� �������� ���ؼ� 
--�̸�, ����, �μ� ��ȣ �׸��� �μ� �̸��� ����ϴ� ���Ǹ� �ۼ��ϼ���.(emp, dept)

select e.ename, e.job, d.deptno,d.dname
from emp e,dept d
where d.loc = 'CHICAGO' and e.deptno = 30;

-- 4. �����, �Ի��� �׸��� �Ի��� ������ ����ϼ���. 
-- �� ���̺��� DAY �Դϴ�.(***����� �����Ϻ��� �����ϴ� ���� ������ �����ϼ���.)

select ename, hiredate, to_char(hiredate,'DAY') DAY
from emp;

--5. 1980, 1981, 1982, 1987�⿡ �Ի��� ����� ���ؼ� ��ü ��� ���� ������ ��� ���� ����ϼ���.
--������ �����̺��� �ο��ϼ���. (emp)
desc emp;

select count(ename) TOTAL ,to_char(hiredate,'YYYY') hiredate, count(*) cnt
from emp
group by to_char(hiredate,'YYYY');

select count(*) TOTAL, count(case to_char(hiredate,'YYYY') when '1980' then 1 else null end) "1980",
        count(case to_char(hiredate,'YYYY') when '1981' then 1 else null end) "1981",
        count(case to_char(hiredate,'YYYY') when '1982' then 1 else null end) "1982",
        count(case to_char(hiredate,'YYYY') when '1987' then 1 else null end) "1987"
from emp;

select count(ename) TOTAL
from emp;