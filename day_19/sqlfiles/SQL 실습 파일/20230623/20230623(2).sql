/*���� ����*/
select name, position
from professor
where position = (select position
                    from professor
                    where name = '������')
and name like'%��'; 

/*������ ��������*/
select studno, name, grade
from student
where grade = (select grade from student where userid = 'jun123');
-- ����� ���̵� 'jun123'�� �л��� ���� �г��� 
-- �й�, �̸�, �г�, �а��̸�, �а���ġ
select s.studno, s.name, s.grade,d.dname, d.loc
from student s, department d 
where s.deptno = d.deptno and s.grade = (select grade from student where userid = 'jun123');

select name, deptno, weight
from student
where weight < (select avg(weight) from student 
                        where deptno = 101)
order by deptno;

select * from student;

select deptno "�а���ȣ", max(avg(weight)) "�ִ������"
from student
group by deptno
having max(avg(weight)) = (select avg(weight) from student group by deptno);

-- in �����ڸ� �̿��� ���� �� ��������
select name, grade, deptno
from student
where deptno in(select deptno from department where college =100);

-- ��� ���̺� ��ȸ, �� �μ��� �ִ� �޿��� ���� ������� 
-- �μ���ȣ �̸� �޿�

select * from emp;
select e.deptno, e.ename ,e.sal,d.dname
from emp e, dept d
where e.deptno = d.deptno
and sal in (select max(sal) from emp group by deptno)
order by deptno;

-- any �����ڸ� �̿��� ���� �� ��������

-- ��� �л� �߿��� 4�г� �л� �߿��� Ű�� ���� ���� �л�����
-- Ű�� ū �л��� �й�, �̸�, Ű
--4�г��� �ּ� Ű�� 175���� Ű�� ū �л��� �˻��ϴ� ���� ����
select studno, name, height
from student
where height > any (select height from student where grade ='4');

-- all ������

-- ��� �л� �߿��� 4�г� ���� �߿��� Ű�� ���� ū �л�����
-- Ű�� ū �л��� �й�, �̸� Ű
select studno, name, height
from student
where height > all (select height from student where grade ='4');

-- exists �����ڸ� �̿��� ���� �� ��������
-- ���������� �޴� ������ �� ���̶� ������ ��� ������ ���� ��ȣ
-- �������� �׸��� �޿��� ���������� ��
select profno, name, sal, comm, sal+NVL(comm,0)
from professor
where exists (select profno from professor where comm is not null);

-- not exist
select 1 userid_exist
from dual
where not exists(select userid from student where userid = 'goodstudent');


/*���� �÷� ��������*/

--pairwise ���� Į�� ��������
-- pairwise �� ����� ���� �г⺰�� �����԰� �ּ��� �л���
-- �̸� �г� �����Ը� ���
select name, grade, weight
from student
where (grade,weight) in (select grade,min(weight) from student group by grade);


-- �� �а����� �Ի����� ���� ������ ������ ������ȣ�� �̸�
-- �Ի��ϰ� �а���

select p.name, p.profno, p.hiredate, d.dname
from professor p, department d
where (p.deptno,p.hiredate) in  (select deptno,min(hiredate) from professor group by deptno)
and p.deptno = d.deptno; 

--unpairwise ���� �÷� ��������
-- unpairwise �� ����� ���� �г⺰�� �����԰� �ּ��� �л��� 
-- �̸�, �г� ������

select name, grade, weight
from student
where grade in (select grade from student group by grade)
and weight in (select min(weight) from student group by grade);

select ename, hiredate
from emp
where deptno = (select deptno from emp where initcap(ename) = 'Blake');

select empno, ename, sal
from emp
where sal>(select avg(sal) from emp)
order by sal desc;