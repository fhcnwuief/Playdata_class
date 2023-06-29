/**�ε���**/
-- SQL ��ɹ��� ó�� �ӵ��� ����Ű�� ���� Į���� ���� �����ϴ� ��ü
-- ����Ʈ�� �̿��Ͽ� ���̺� ����� �����͸� ���� �׼����ϱ� ����

/*���� �ε���*/
-- ������ ���� ������ Į���� ���� �����ϴ� �ε�����
-- ��� �ε��� Ű�� ���̺��� �ϳ��� ��� ����
-- ���� �μ� �̸��� �ߺ��Ǹ� ���� �ε����� �������� ����
create unique index idx_dept_name
on department(dname);

/*����� �ε���*/
-- �ߺ��� ���� ������ Į���� ���� �����ϴ� �ε�����
-- ������ �ε��� Ű�� ���̺��� ���� ��� ����� �� �ִ�
create index idx_stud_birthdate
on student(birthdate);

/*���� �ε���*/
-- �ϳ��� Į�����θ� ������ �ε���
/*���� �ε���*/
-- �� �� �̻��� Į���� �����Ͽ� �����ϴ� �ε���
create index idx_stud_dno_grade
on student(deptno,grade);

/*DESCENDING INDEX*/
-- Į������ ���� ������ ������ �����Ͽ�
-- ���� �ε����� �����ϱ� ���� ���
create index fidx_stud_no_name 
on student(deptno desc, name asc);

/*�Լ� ��� �ε���*/
-- upper(column_name)/lower(column_name)Ű����� ���ǵ�
-- �Լ���� �ε����� ����ϸ� ��ҹ��� ���� ���� �˻� ����

create index uppercase_idx on emp (upper(ename));
select * from emp where upper(ename) = 'KING';

/* �л� ���̺��� �л����� �񸸵� ������ ���� ǥ�� ü���� ���ϰ��� ��
ǥ�� ü�߿� ���� �Լ� ��� �ε��� ���� */

create index idx_standard_weight on student((height-100)*0.9);


/**�ε��� ���� ��� Ȯ��**/
-- ���� ��� : ��ɹ��� ���������� ó���Ǵ� ���
-- cmd â���� ���� �Ǵ�
-- F10�� ������ ���� ��� Ȯ�� ����

/*�а� ���̺��� �а� �̸��� '�����̵���к�'�� �а� ��ȣ��
�˻��� ����� ���� �����θ� �м��϶�. dname �÷��� ���� �ε�����
�����Ǿ� �մ�*/
select deptno, dname
from department
where dname = '�����̵���к�';

-- idx_dept_name �ε��� ����
drop index idx_dept_name;
-- dnameĮ���� ������ �ε����� �����Ǿ� ��ü ���̺��� �˻�
select deptno, dname
from department
where dname = '�����̵���к�';

/*�л� ���̺��� ������'79/04/02'�� �л� �̸��� �˻��� ����� ����
���� ��θ� �м�
birthdate Į���� ���� ����� �ε����� �����Ǿ� ����*/

-- birthdate Į���� ������ idx_stud_birthdate �ε����� �̿��� ����������
select name, birthdate
from student
where birthdate = '79/04/02';

/**�ε��� ���� ��ȸ**/
-- �ε��� �̸��� ������ ���� ���� Ȯ��

select index_name, uniqueness
from user_indexes
where table_name = 'STUDENT';

-- �ε����� �̸�, �ε����� ������ ���̺� �̸��� Į�� �̸� ���� Ȯ��
select index_name, column_name
from user_ind_columns
where table_name = 'STUDENT';

--�ε��� ���� : drop index

/*�ε��� �籸��*/
-- �ε����� ������ ���̺��� Į�� ���� ���� ���� �۾��� ���� �߻��Ͽ�,
-- ���ʿ��ϰ� ������ �ε��� ���� ��带 �����ϴ� �۾�

alter index stud_no_pk rebuild;




�� ���� ���ּ��� ���ߤФ̤Ф̤� 2���̳� ƨ��°� ������� �Ф�