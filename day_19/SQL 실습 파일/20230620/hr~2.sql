/**���� �Լ�**/

-- initcap : ù ��° �����ڸ� �빮�ڷ� ��ȯ
select name, userid, initcap(userid)
from student
where name='�迵��';

select * from emp;
-- ename ��ü�� ��ȯ�� �� Ž��
select empno, ename
from emp
where initcap(ename)='Smith';

-- lower, upper �Լ� / ���ڿ� ��ü�� �ҹ���, �빮�ڷ� ��ȯ
select userid, lower(userid),upper(userid)
from student
where studno = 20101;

-- manager�鸸 ���
select ename, initcap(job) job,deptno
from emp
where lower(job)='manager'
order by ename;

-- length/lengthb  ���ڿ��� ����/����Ʈ �� ��ȯ
select dname, length(dname),lengthb(dname)
from department;


--����Ŭ���� ĳ���� ���� AL32UTF8 �ΰ�� �ѱ��� ���ڴ� 3����Ʈ�� �ν��Ѵ�
--���� ĳ���ͼ� Ȯ��
SELECT *
FROM nls_database_parameters
WHERE parameter = 'NLS_CHARACTERSET';

/**���� ���� �Լ�**/


-- concat : ù ��° ���ڿ� �� ��° ���ڸ� ����
select concat(concat(concat(name,'�� ��å�� '),position),'�̴�.') sentence
from professor;

-- substr : ���ڿ��� �Ϻθ� �����ϴ� �Լ�
select substr(name,1,3) name, idnum,substr(idnum,1,6) birth_date, substr(idnum,3,2) birth_mon
from student
where grade=1;
/* ���� ���� ���л���*/
select substr(name,2,3) name, idnum,substr(idnum,1,6) birth_date, substr(idnum,3,2) birth_mon
from student
where grade=1 and substr(idnum,7,1)=2;
select * from emp;

/*�̸��� J,A,M���� �����ϴ� ��� ���, ù��° ���ڴ� �빮�ڷ�
�������� ��� �ҹ��ڷ� ��Ÿ���� ����� �̸��� �̸� ����*/
select initcap(ename) as Name, length(ename) Length
from emp
where substr(ename,1,1) in ('J','A','M');

--instr : ���ڿ��߿��� Ư�� ���ڰ� ���Ե� ��ġ�� ��ȯ�ϴ� �Լ�
select dname, instr(dname,'��')
from department;

--LPAD/RPAD : ���ڿ��� ������ ũ�Ⱑ �ǵ��� ���� �Ǵ� �����ʿ� ������ ���� ����
select position, lpad(position,10,'*') lpad_position,
        userid, rpad(userid,12,'+') rpad_userid
from professor;

--LTRIM/RTRIM : ���ڿ����� Ư�� ���ڸ� �����ϱ� ���� �Լ�
select ltrim('xyxXxyLASTWORD','xy')
from dual;
select rtrim('TURNERxyxXxy','xy')
from dual;
/* dname���� '��'����*/
select dname, rtrim(dname,'��')
from department;


/**���� �Լ�**/


-- round : ������ �ڸ� ���Ͽ��� �ݿø��� �����
select name, sal, sal/22,round(sal/22),round(sal/22,2),round(sal/22,-1)
from professor
where deptno=101;

-- trunc : ������ �Ҽ��� �ڸ��� ���ϸ� ������ ���
select name, sal, sal/22,trunc(sal/22),round(sal/22,2),trunc(sal/22,-1)
from professor
where deptno=101;

-- mod : ������ ���� �Ŀ� �������� ���
select name, sal, comm, mod(sal,comm)
from professor
where deptno=101;

-- ceil : ������ ���ں��� ũ�ų� ���� ���� �� �ּҰ�
-- floor : ������ ���ں��� �۰ų� ���� ���� �߿��� �ִ밪
select ceil(19.7), floor(12.345)
from dual;

/** ��¥ ��� �Լ�**/

select name,hiredate, hiredate+30,hiredate+60
from professor
where profno  = 9908;

-- months_between
-- add_months
select hiredate from professor;

select profno, hiredate,round(months_between(sysdate,hiredate)) tenure,
        add_months(hiredate,6) review
from professor
where months_between(sysdate,hiredate) < 360;






/****/
-- 1. �л� ���̺��� �̸��� ������ ������ ���������� �������� ���� 101�� �а� �л��� ���̵� �̸� �г� �а���ȣ
select * from student;
select userid,name,grade,deptno
from student
where substr(name,3,1)='��' and profno is null;
-- 2. MANAGER�̰ų� SALESMAN�̸� �޿��� $1500,$3000,#5000�� �ƴ� ��� ����� ���� �̸�, ����, �޿�
select * from emp;
select ename, job,sal
from emp
where job in ('MANAGER','SALESMAN') and sal not in(1500,300,5000)
order by sal desc;
-- 3. ������̺��� 2���� �Ի��� ����� ���
select ename
from emp
where substr(hiredate,4,2)=02;
-- 4. ������ 'manager'�� ����� �˻��Ϸ� ������ '���õ� ���ڵ尡 ����'�̶� ���� ������ ����� �������� ����
-- ���� : ����� ���� �빮���̱� ������ �ҹ��ڷ� �˻��ϸ� ������ ����
-- ����
select empno, ename,job
from emp
where lower(job) = 'manager';

--5. ��� ���̺��� ��� ��ȣ, �̸� �޿�, 12% ������ �޿� ��� ���(�Ҽ��� ����° �ڸ����� �ݿø�)
select empno,ename,sal,round(sal*1.12,2) as "New Salary", (round(sal*1.12,2) - sal) as "Increase"
from emp;
