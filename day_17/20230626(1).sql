/**���̺� ����**/

create table address
(id number(3),
name varchar2(50),
addr varchar2(100),
phone varchar2(30),
email varchar2(100));

select * from tab;

desc address;

/**���������� �̿��� ���̺� ����**/

insert into address
values(1,'HGDDNG','SEOUL','123-4567','gdhong@wunet.ac.kr');

commit;

select * from address;

create table addr_second(id,name, addr, phone,e_mail)
as select * from address;

desc addr_second;
-- ������ �������� �����Ͱ��� �������� ����
create table addr_fourth
as select id, name from address
where 1=2;

desc addr_fourth;

select * from addr_fourth;

create table addr_third
as select id, name from address;

desc addr_third;

select* from addr_third;

alter table address
add (birth date);

desc address;

alter table address
add(commments varchar2(200) default 'no comment');

desc address;

select * from address;

alter table address drop column commments;

select * from address;

alter table address
modify phone varchar2(50);

desc address;

rename addr_second to client_address;

select * from tab;

-- ���̺� ����
select * from tab;

drop table addr_third;

select * from tab
where tname = 'addr_third';

/* truncate ��ɹ�*/

select * from client_address;

truncate table client_address;

select * from client_address;

select * from tab;

-- �ּ� �߰�
comment on table address
is '�� �ּҷ��� �����ϱ� ���� ���̺�';

select * from address;

comment on column address.name
is '�� �̸�';
-- �ּ� Ȯ��
select comments from user_tab_comments
where table_name='ADDRESS';
-- �÷� �ּ� Ȯ��
select * from user_col_comments
where table_name = 'ADDRESS';

--�ּ� ����
comment on table address is '';

select comments from user_tab_comments
where table_name='ADDRESS';

--�÷� �ּ� ����
comment on column address.name is '';

select * from user_col_comments
where table_name = 'ADDRESS';

/** ������ ���� **/

select table_name from user_tables;

select owner, table_name from all_tables;


select owner, table_name from dba_tables