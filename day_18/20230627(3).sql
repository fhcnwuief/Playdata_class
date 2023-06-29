select * from emp;
select * from dept;

/*emp,dept ���̺��� ��ȸ�Ͽ� �μ���ȣ�� �μ��� �ִ� �޿�, �μ��� ���*/
select e.deptno, d.dname, max_sal
from (select deptno ,max(sal) max_sal
        from emp
        group by deptno) e, dept d
where e.deptno = d.deptno
order by deptno;
/*empno, ename, deptno ������ �����ϴ� emp ���̺��� ������ ���ʷ�
emp1���̺��� ����, �� ���̺��� ID, LAST_NAME�� DEPT_ID�� �� �̸� ����*/
create table emp1(id,last_name,dept_id)
as
select empno, ename,deptno from emp;

/*���� �ܰ迡�� ������ EMP1���̺��� LAST_NAME �ʵ带 10--> 30 ����*/
alter table emp1
modify last_name varchar2(30);
/*SYSTEM�̳� SYS������ EMPLOYEE ���̺��� �����ϰ� �����͸� �ϳ� �Է�*/

/*SYSTEM�� EMPLOYEE ���̺� ���� PUB_EMPLOYEE ��� ���� ���Ǿ� ����*/
/*���� �ܰ迡�� ������ ���� ���Ǿ ���� SYSTEM ������ EMPLOYEE ���̺���
HR������ ��ȸ�ϵ���*/
/*���뵿�Ǿ� PUB_EMPLOYEE ����*/
