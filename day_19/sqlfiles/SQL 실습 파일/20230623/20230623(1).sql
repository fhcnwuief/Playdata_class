-- EQUI JOIN : ���� ��� ���̺��� ���� Į���� equal �񱳸� ����
-- ���� ���� ������ ���� �����Ͽ� ����� �����ϴ� ���� ���
select s.studno, s.name, s.deptno, d.dname,d.loc
from student s, department d
where s.deptno = d.deptno;

-- �ڿ� ������ �̿��� EQUI JOIN
-- where ���� ������� �ʰ� natural join Ű���� ���
-- �ڵ������� ���̺��� �ڵ� Į���� ������� ���� Į���� ������ ��
-- ���������� ���ι� ����

select s.studno, s.name, deptno, d.dname, d.loc
from student s natural join department d;

-- ���� Į���� ��ó ���̺���� ��. ������ ������

select p.profno, p.name, p.deptno, d.dname
from professor p, department d
where p.deptno = d.deptno;
select p.profno, p.name, deptno, d.dname
from professor p natural join department d;


select s.name,s.grade, s.deptno, d.dname
from student s, department d
where s.deptno = d.deptno and s.grade = '4';
select s.name,s.grade, deptno, d.dname
from student s natural join department d
where s.grade = '4';


-- JOIN~USING : USING���� ���� ��� Į���� ������
select s.studno, s.name, deptno, d.dname, d.loc
from student s join department d
    using (deptno);

select studno, name, deptno, dname, loc
from student join department
    using (deptno);
    
--�ϴ��� 4���� ��� ���� �ڵ�    
select name, dname, loc
from student s, department d
where s.deptno = d.deptno and name like '��%';

select name, dname, loc
from student s inner join department d
on s.deptno = d.deptno
where name like '��%';

select name, dname, loc
from student s natural join department d
where name like '��%';

select name, dname, loc
from student s join department d
using(deptno)
where name like '��%';

select * from salgrade;
-- NON EQUI JOIN : '='������ �ƴ� ������ ���
-- (<,BETWEEN A AND B)
select p.profno, p.name, p.sal, s.grade
from professor p, salgrade s
where p.sal between s.losal and s.hisal;

select p.profno, p.name, p.sal, s.grade
from professor p, salgrade s
where p.sal between s.losal and s.hisal and p.deptno = 101;
select * from professor;

select name, grade, profno, position
from student natural join professor;

select s.studno, s.name, deptno, d.dname, d.loc
from student s natural join department d;

select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno = p.profno;

--outer join

-- �л� ���̺�� ���� ���̺��� �����Ͽ� �̸�, �г�, ���������� �̸�, ������ ���
-- ���������� �������� ���� �л��̸��� �Բ�
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno = p.profno(+)
order by p.profno;

-- �̸�, �г�, �������� �̸�, ������ ���, �����л��� �������� ����
-- ���� �̸��� �Բ� ���
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno(+) = p.profno
order by p.profno;


-- �л� ���̺�� ���� ���̺��� �����Ͽ� �г�, �̸�, �������� �̸�, 
-- ������ ���, ���������� �������� ���� �л� ��ܰ�
-- ���� �л��� �������� ���� ���� ��ܵ� �Բ� ���
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno = p.profno(+)
union
select s.name, s.grade, p.name, p.position
from student s, professor p
where s.profno = p.profno(+);

--full outer join : left outer join + right outer join

select studno, s.name, s.profno, p.name
from student s
full outer join professor p on s.profno = p.profno;

---self join : �ϳ��� ���̺��� �ִ� Į������ �����ϴ� ������ �ʿ��� ���
-- where ���� �̿��� self join
select dept.dname ||'�� �Ҽ��� ' || org.dname
from department dept, department org
where dept.college = org.deptno;
-- join~on ���� �̿��� self join
select dept.dname ||'�� �Ҽ��� ' || org.dname
from department dept join department org
on dept.college = org.deptno;

