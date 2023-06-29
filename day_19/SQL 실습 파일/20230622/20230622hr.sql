/**��¥ �Լ�**/

-- �̹����� ������ ��¥�� ���ƿ��� �Ͽ����� ��¥
select sysdate, last_day(sysdate), next_day(sysdate,'��')
from dual;

select sysdate, last_day(sysdate), next_day(sysdate,1)
from dual;

-- trunc : �ð������� ������� ���ϳ��� ���
-- round : ������ ������ �������� ���(������ �ȳ����� trunc�� ��� �Ȱ���)
-- to_char : ��µ� ������ ����
select to_char(sysdate,'YY/MM/DD HH24:MI:SS') normal,
        to_char(trunc(sysdate),'YY/MM/DD HH24:MI:SS') trunc,
        to_char(round(sysdate),'YY/MM/DD HH24:MI:SS') round
from dual;


select to_char(hiredate,'YY/MM/DD HH24:MI:SS') hiredate,
--�Ի����� ���� �������� �ݿø�
        to_char(round(hiredate,'dd'),'YY/MM/DD') round_dd,
--�Ի����� ���� �������� �ݿø�
        to_char(round(hiredate,'mm'),'YY/MM/DD') round_mm,
--�Ի����� ������ �������� �ݿø�
        to_char(round(hiredate,'yy'),'YY/MM/DD') round_yy
from professor
where deptno = 101;

desc student;


--to_char �Լ�
select studno, birthdate ����, to_char(birthdate,'YY-MM') birthdate
from student
where name='������';

select name, grade, to_char(birthdate,'Day Month Mon DD,YYYY') BIRTHDATE
FROM STUDENT
WHERE DEPTNO = 102;


-- ������ Ÿ�� ��� ����
alter session set nls_language = American;
alter session set nls_language = Korean;

select name,to_char(hiredate,'MONTH DD, YYYY HH24:MI:SS:PM') hiredate
from professor
where deptno = 101;

select name, position, to_char(hiredate,'mon "the" DDTH "of" YYYY') hiredate
from professor
where deptno = 101;


-- ���ڸ� ���� �������� ��ȯ
select name, sal, to_char((sal+comm)*12, '9,999') anual_sal
from professor
where comm is not null;

-- to_nuber : ���ڷ� ������ ���ڿ��� ���� �����ͷ� ��ȯ
select to_number('1') num
from dual;

-- to_date : ���ڿ� ���ڷ� ������ ���ڿ��� ��¥ �����ͷ� ��ȯ
select name, hiredate
from professor
where hiredate = to_date('june 01, 01','MONTH DD, YY');

-- ������� ���� °
select trunc(sysdate - to_date('1999/12/18','YYYY/MM/DD')) as "Lived day"
from dual;

select trunc(sysdate - to_date('1999/12/18','YYYY/MM/DD')) as "Lived day",
        trunc(months_between(sysdate,to_date('1999/12/18','YYYY/MM/DD'))) as "Lived month" 
from dual;


--��ø �Լ�
select to_char(to_date(substr(idnum,1,6),'YYMMDD'),'YY/MM/DD') as "birthdate"
from student;



/**�Ϲ� �Լ�**/

--NVL : NULL�� 0 �Ǵ� �ٸ� ������ ��ȯ
select name, position,sal, comm,sal+comm,
        sal+NVL(comm,0) s1,NVL(sal+comm,sal) s2
from professor
where deptno = 201;

-- NVL2 �Լ� 
select name, position, sal, comm, NVL2(comm, sal+comm,sal) total
from professor
where deptno = 102;

select ename, sal, comm, sal+comm, NVL2(comm,sal+comm,sal), sal+NVL(comm,0)
from emp;

select ename , NVL2(comm,to_char(comm),'no') as comm2
from emp;

select * from emp;

desc emp;

select name, userid, lengthb(name),lengthb(userid), nullif(lengthb(substr(name,1,2)),lengthb(userid)) nullif_result
from professor;
-- COLESCE ; null�� �ƴ� ù ��° �μ��� ��ȯ
select name, comm,sal,coalesce(comm,sal,0) co_result
from professor;

--decode �Լ� : if��/case ���� ���
select name, deptno,
        decode(deptno,101,'��ǻ�Ͱ��а�',102,'��Ƽ�̵���а�',201,'���ڰ��а�','�����а�') dname
from professor;

-- �л� ���̺��� �а���ȣ�� �̸�, �а����� ����ϵ�
-- 191�� �а� �л��� 'Computer Science'�� ���, 101���� �ƴ� �л����� �а����� "ETC"

select deptno,name,decode(deptno,101,'Computer Science','ETC') dname
from student
where deptno is not null;

-- case �Լ�
select name, deptno,sal,
    case when deptno = 101 then sal*0.1
        when deptno = 102 then sal*0.2
        when deptno = 201 then sal*0.3
        else 0
    end bobus
from professor;

select * from student;
-- �л� ���̺��� ������Ͽ��� ���� �����Ͽ� �¾ �б⸦ ���
select name, to_char(birthdate,'MM') month, 
    case when to_char(birthdate,'Q') = 1 then  '1/4'
    when to_char(birthdate,'Q') = 2 then  '2/4'
    when to_char(birthdate,'Q') = 3 then  '3/4'
    else '4/4'
    end �б�
from student;



/**GROUP �Լ�**/


--COUNT �Լ�
select count(comm)
from professor
where deptno=101;

select count(job)
from emp;

select count(distinct(job)) 
from emp;

-- AVG SUM �Լ�
select avg(weight), sum(weight)
from student
where deptno = 101;

-- MIN MAX �Լ�
select max(height),min(height)
from student
where deptno = 102;

select studno, name, height, deptno
from student
where deptno = 102
order by height;

select max(sal) Maximum, min(sal) Minimum, sum(sal) Sum, round(avg(sal)) Average
from emp;

-- STDDEV,VARIANCE : ǥ�������� �л�
select stddev(sal),variance(sal)
from professor;

/**group by**/

select deptno, count(*), count(comm)
from professor
group by deptno
order by deptno;

-- ���� Į���� �̿��� �׷���
select deptno, avg(sal), min(sal),max(sal)
from professor
group by deptno
order by deptno;


select deptno, profno, sal
from professor
order by deptno;

select deptno, grade, count(*), round(avg(weight))
from student
group by deptno, grade;

--rollup ������
select deptno, sum(sal)
from professor
group by rollup(deptno);

select deptno, position, count(*)
from professor
group by rollup(deptno, position);

select deptno, position, count(*)
from professor
group by cube(deptno, position);


--grouping �Լ�

select deptno, grade, count(*),
        grouping(deptno) grp_dno,
        grouping(grade) grp_grade
from student
where deptno is not null
group by rollup(deptno,grade);

--grouping sets �Լ�

select deptno, grade, null,count(*)
from student
group by deptno, grade
union all
select deptno, null,to_char(birthdate,'YYYY'), count(*)
from student
group by deptno, to_char(birthdate,'YYYY');


select deptno, grade, to_char(birthdate, 'YYYY') birthdate, count(*)
from student
group by grouping sets((deptno, grade),(deptno, to_char(birthdate,'YYYY')));


/**HAVING��**/
select grade, count(*), round(avg(height)) avg_height,
        round(avg(weight)) avg_weight
from student
group by grade
order by avg_height desc;


select grade, count(*), round(avg(height)) avg_height,
        round(avg(weight)) avg_weight
from student
group by grade
having count(*) > 4
order by avg_height desc;


select deptno, avg(weight)
from student
group by deptno;

select deptno, max(avg(weight)) max_weight
from student
group by deptno;


select * from emp;
/*��� ���̺��� �޿��� 1500�̻� �޴� ����� �߿���
��� �޿��� 2000�̻��� �μ���ȣ, ���� �޿�, �μ������� ����*/
select deptno, round(avg(sal))
from emp
where sal>=1500
group by  deptno
having avg(sal)>=2000
order by deptno;

select studno
from student;

select max(count(studno)) max_cnt, min(count(studno)) min_cnt
from student
group by deptno;