--4. ������ Ÿ��

desc student;
--char ������Ÿ��

-- ���̺� ����
create table ex_type
(c char(10), v varchar2(10));
-- ������ ����
insert into ex_type
values('sql','sql');
-- ��� Ȯ��
select *
from ex_type
where c='sql';
-- char�� varchar�� ���̰� �ٸ��Ƿ� �񱳰���� ����
select *
from ex_type
where c=v;


-- number ������ Ÿ��
-- date ������ Ÿ��
/*���� ��¥ ���*/
select sysdate from dual;
-- LOB ������ Ÿ��
-- ROEWID ������ Ÿ��(������ �ּ�)

select * from emp;
select rowid, empno,ename from emp;
select rowid, empno,ename from emp 
where rowid = 'AAAE5wAAEAAAAHsAAJ';


select rowid, name from professor;
select rowid, name from professor
where rowid = 'AAAE51AAEAAAAIUAAE';

--timestamp ������ Ÿ��
create table ex_time
(id  number(2),
basictime  timestamp,
standardtime timestamp with time zone,
localtime timestamp with local time zone);

insert into ex_time
values(1,sysdate,sysdate,sysdate);
-- cmdline������ ����Ǵ� �ڵ�
set linesize 100
select * from ex_time;

-- DUAL ���̺�
desc sys.dual;

select dummy from dual;
/*
����Ŭ�� ������ �� �����͵�ųʸ��� �ڵ� ����, ��� ����ڵ��� ���� ���
sys�� ������ ���̺� �����Ͱ� �ִ� ���̺��� �������� �ʴ� �����, �ǻ翭, ǥ���� ���� ����
�� ���� �����ų� ���� ��¥, �ð��� �˰��� �� �� �̸��� ���, ��¥���� � �ֿ� ���
*/
SELECT 20*30 from dual;

select (sysdate-1) Yesterday, sysdate Today, (sysdate + 1) Tomorrow 
from dual;

