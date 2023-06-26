/**테이블 생성**/

create table address
(id number(3),
name varchar2(50),
addr varchar2(100),
phone varchar2(30),
email varchar2(100));

select * from tab;

desc address;

/**서브쿼리를 이용한 테이블 생성**/

insert into address
values(1,'HGDDNG','SEOUL','123-4567','gdhong@wunet.ac.kr');

commit;

select * from address;

create table addr_second(id,name, addr, phone,e_mail)
as select * from address;

desc addr_second;
-- 구조만 가져오고 데이터값은 가져오지 않음
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

-- 테이블 삭제
select * from tab;

drop table addr_third;

select * from tab
where tname = 'addr_third';

/* truncate 명령문*/

select * from client_address;

truncate table client_address;

select * from client_address;

select * from tab;

-- 주석 추가
comment on table address
is '고객 주소록을 관리하기 위한 테이블';

select * from address;

comment on column address.name
is '고객 이름';
-- 주석 확인
select comments from user_tab_comments
where table_name='ADDRESS';
-- 컬럼 주석 확인
select * from user_col_comments
where table_name = 'ADDRESS';

--주석 삭제
comment on table address is '';

select comments from user_tab_comments
where table_name='ADDRESS';

--컬럼 주석 삭제
comment on column address.name is '';

select * from user_col_comments
where table_name = 'ADDRESS';

/** 데이터 사전 **/

select table_name from user_tables;

select owner, table_name from all_tables;


select owner, table_name from dba_tables