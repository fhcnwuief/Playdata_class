/**��(view)**/
-- �ϳ� �̻��� �⺻ ���̺��̳� �ٸ� �並 �̿��Ͽ� �����Ǵ� ���� ���̺�
-- ��ü �������߿��� �Ϻθ� ������ �� �ֵ��� ����
-- ���̺��� �Ļ��� ��ü ���̺�� �����ϰ� ���
-- �信 ���� ���� ����� �並 ������ �⺻ ���̺� ����
-- �並 ���� �� �⺻ ���̺��� ���ǵ� ���Ἲ ���� ���� ���

/*���� ���̺�*/
-- ���̺��� ��ũ�� ������ �Ҵ�Ǿ� �����͸� ����
-- ��z �����͵�ųʸ� ���̺� �信 ���� ���Ǹ� ����
-- ��ũ ������� �Ҵ��� �ȵ�

/*����*/
-- �����͸� ��ȣ�ϱ� ���� ����
-- ����� ���Ǽ�

/*�ܼ� �� : �ϳ��� �⺻ ���̺� ���� ������ ��,
        DML ��ɹ��� ���� ��� �⺻ ���̺� �ݿ�
���� �� : �ΰ� �̻��� �⺻ ���̺�� ������ ��
        ���Ἲ ��������, ǥ����, group by���� ������ ���� DML ��ɹ��� ������ ���
*/



/**���� ����**/
/*CREATE VIEW : �� ���� �� Į�� �̸��� ��� ���� ������ �⺻ ���̺��� Į�� �̸� ���
            �Լ��� ǥ���Ŀ� ���� ���� �� Į���� ������ �̸��� ���*/

-- �ܼ� ��
create view v_stud_dept101 as
select studno, name, deptno
from student
where deptno = 101;
-- ���� ��
create view v_stud_dept102
as select s.studno, s.name, s.grade, d.dname
from student s, department d
where s.deptno = d.deptno and s.deptno = 102;

select * from v_stud_dept102;
-- �Լ��� ����Ͽ� �� ����
create view v_prof_avg_sal
as select deptno, sum(sal) sum_sal, avg(sal) avg_sal
from professor
group by deptno;

/**�ζ��� ��**/
/*from ������ �����ϴ� ���̺��� ũ�Ⱑ Ŭ ���,
�ʿ��� ��� �÷������� ������ ������ ������ �Ͽ� ���ǹ� ȿ���� ����*/

select dname, avg_height, avg_weight
from (select deptno, avg(height) avg_height, avg(weight) avg_weight
        from student
        group by deptno)s, department d
where s.deptno = d.deptno;


-- �а��� �ִ� Ű�� ���ϰ� �ִ�Ű�� ���� �л��� �а���, 
-- �ִ�Ű ,�̸�, Ű ���
select * from department;
select * from student;



select d.dname, a.max_height, s.name, s.height
from (select deptno, max(height) max_height
        from student
        group by deptno) a, department d, student s
where s.deptno = a.deptno
and s.height = a.max_height
and s.deptno = d.deptno;


/**�信 ���� ������ �������� ó�� ����**/
-- user_view ������ ��ųʸ����� �信 ���� ���� �� ��ȸ
-- �⺻ ���̺� ���� ���� ���� ������ Ȯ��
-- �信 ���� ���Ǹ� �⺻ ���̺� ���� ���� �� ��ȯ
-- �⺻ ���̺� ���� ���Ǹ� ���� �����͸� �˻�
-- �˻��� ����� ���

select view_name, text
from user_views;


/**���� ����**/
-- ���� �信 ���� ���Ǹ� ������ �� �����

/*�ܼ� ��*/
-- �⺻ ���̺�� �����ϰ� DML ��ɹ� ���
-- ���������� �⺻ ���̺� ���� �����͸� ����
-- �信 ���� ���Ἲ �������ǵ� �⺻ ���̺� ���� �� ���Ἲ �������� ����

/*���� ��*/
-- DML ��ɾ� ��� ����


/*���� ����*/
-- ��� ��ü�� ���� ���� ���̺��̹Ƿ� ������ ��ųʸ��� ����� ���� ���Ǹ� ����
-- �並 ���� �� �⺻ ���̺��� ������ �����Ϳ��� ���� ���� ����
drop view v_stud_dept101;

drop view v_stud_dept102;