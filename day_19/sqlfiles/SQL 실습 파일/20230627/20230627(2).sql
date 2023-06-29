/**�����ͺ��̽� ����**/
/*
���� - ����ڰ� �����ͺ��̽� �ý����� �����ϰų� ��ü�� �̿��� �� �ִ� �Ǹ�
������ ����
1. �ý��� ����
- �ý��� ������ �ڿ� ������ ����� ��Ű�� ��ü ���� ��� ����
�����ͺ��̽� ���� �۾��� �� �� �ִ� ����
2. ��ü ����
- ���̺�, ��, ������, �Լ� ��� ���� ��ü�� ������ �� �ִ� ����
- ��ü�� ������ ���� ���� �ٸ� ������ ��ü ����
- ���̺��� Į������ insert, updatem references

�����ͺ��̽� �����ڰ� ������ �ý��� ����
- ����� ����, ����, ����� �������� ��ü�� ���� �Ǵ� ����, �����ͺ��̽� ��� ����

�Ϲ� ����ڰ� ���� �� �ִ� �ý��� ����
- ����ڰ� ������ ��ü�� ����, ���� ���ν����� ����


1. �ý��� ���� �ο�
- �ý��� ������ Ư�� ����ڳ� ��� ����ڿ��� �ο� ����
- �ѿ��� �ý��� ���� �ο� ����
- GRANT ��ɹ� ���

2, �ý��� ���� ��ȸ
- ���� ���ǿ��� ����ڿ� �ѿ� �ο��� �ý��� ������ ��ȸ ����

3. �ý��� ���� öȸ
- �����ͺ��̽� �����ڳ� ������ �ο��� ����ڴ� �ٸ� ����ڿ��� �ο���
�ý��� ���� öȸ ����

4-0. ��ü ����
- ���̺�, ��, ������, �Լ� � ���� ��ü���� ����� �� �ִ� ����
4. ��ü ���� �ο�
- �����ͺ��̽� �����ڳ� ��ü �����ڰ� ����ڿ� �ѿ��� �ο�



1.encore ���̺����̽� �����
2.encore ������ ����Ʈ���̺����̽��� encore/tmp ���
3.encore�� hrdml student select



*/



/*������ ���ǹ�*/

-- ������ ���ǹ��� ����Ͽ� �μ� ���̺��� �а�,�к�, �ܰ������� �˻��Ͽ�
-- �ܴ�, �к� �а������� top-down ������ ���� ������ ���
select deptno, dname, college
from department
start with deptno= 10
connect by prior deptno = college;


-- ������ ���ǹ��� ����Ͽ� �μ� ���̺��� �а�, �к�, �ܰ������� �˻��Ͽ�
-- �а�, �к�, �ܴ� ������ bottom-up ������ ���� ������ ���
select deptno, dname, college
from department
start with deptno = 102
connect by prior college = deptno;

-- ������ ���ǹ��� ����Ͽ� �μ� ���̺��� �μ� �̸��� �˻��Ͽ� �ܴ�, �к�, �а�����
-- top-down �������� ���, �� ���� �����ʹ� '��������'�̰�, �� �������� �������� 2ĭ

select level,lpad(' ',(level-1)*3)|| dname ������
from department
start with dname = '��������'
connect by prior deptno = college;

/** ���� �������� ���� ����**/

-- ������ ���ǹ��� ����Ͽ� �μ� ���̺��� dname Į���� �ܴ�, �к�,�а� ������
-- top-down ������ ���� ������ ���
-- ��, �����̵���кθ� ����

select deptno, college, dname, loc
from department
where dname != '�����̵���к�'
start with college is null
connect by prior deptno = college;

-- ������ ���ǹ��� ����Ͽ� �μ� ���̺��� dname Į���� �ܴ�, �к�,�а�������
-- top-down ������ ���� ������ ���
-- ��, �����̵���кο� �����̵���кο� ���� ��� �а��� �����ϰ� ���
select deptno, college, dname, loc
from department
start with college is null
connect by prior deptno = college
and dname != '�����̵���к�';


/*������ ���ǹ� ���� - CONNECT_BY_ROOT*/
--������ ���ǹ��� ����Ͽ� LEVEL�� 1�� �ֻ����ο��� ������ ���� ���� �մ�
select lpad(' ',4*(level-1)) || ename �����,
        empno ���,
        connect_by_root empno �ֻ������,
        level
from emp
start with job = upper('President')
connect by prior empno = mgr;

/*���������ǹ� ���� - CONNECT_BY_ISLEAF*/
-- �ο��� ���������� ���θ� ��ȯ
select lpad(' ',4*(level-1)) || ename �����,
        empno ���,
        connect_by_isleaf Leaf_YN,
        level
from emp
start with job = upper('President')
connect by prior empno = mgr;

/*���������ǹ� ���� - SYS_CONNECT_BY_PATH*/
select lpad(' ',4*(level-1)) || ename �����,
        empno ���,
        sys_connect_by_path(ename,'/') path
from emp
start with job = upper('President')
connect by prior empno = mgr;

-- ������ ���ǹ��� ����Ͽ� leaf node�� ��ü path ������ �������� �� �� �մ�
select level,sys_connect_by_path(ename,'/') path
from emp
where connect_by_isleaf = 1
start with mgr is null
connect by prior empno = mgr;

/*������ ���ǹ� ���� - ORDER SIBLINGS BY*/
-- TREE�� ������踦 �״�� �����ϸ鼭 ���ο�Ҹ� ����
-- ORDER BY�� ����Ͽ��� ��� TREE�� ������ ������ ������
-- TREE ������ �״�� �����ϱ����� �����
select lpad(' ',4*(level-1)) || ename �����,
        ename ename2,empno ���, level
from emp
start with job = upper('President')
connect by prior empno = mgr
order siblings by ename;