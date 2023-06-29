/**데이터베이스 권한**/
/*
권한 - 사용자가 데이터베이스 시스템을 관리하거나 객체를 이용할 수 있는 권리
권한의 종류
1. 시스템 권한
- 시스템 차원의 자원 관리나 사용자 스키마 객체 관리 등과 같은
데이터베이스 관리 작업을 할 수 있는 권한
2. 객체 권한
- 테이블, 뷰, 시퀀스, 함수 등과 같은 객체를 조작할 수 있는 권한
- 객체의 종류에 따라 서로 다른 유형의 객체 권한
- 테이블의 칼럼별로 insert, updatem references

데이터베이스 관리자가 가지는 시스템 권한
- 사용자 생성, 삭제, 사용자 계정에서 객체의 생성 또는 수정, 데이터베이스 백업 관리

일반 사용자가 가질 수 있는 시스템 권한
- 사용자가 생성한 객체를 관리, 내장 프로시저를 관리


1. 시스템 권한 부여
- 시스템 권한은 특정 사용자나 모든 사용자에게 부여 가능
- 롤에도 시스템 권한 부여 가능
- GRANT 명령문 사용

2, 시스템 권한 조회
- 현재 세션에서 사용자와 롤에 부여된 시스템 권한을 조회 가능

3. 시스템 권한 철회
- 데이터베이스 관리자나 권한을 부여한 사용자는 다른 사용자에게 부여한
시스템 권한 철회 가능

4-0. 객체 권한
- 테이블, 뷰, 시퀀스, 함수 등가 같이 객체별로 사용할 수 있는 권한
4. 객체 권한 부여
- 데이터베이스 관리자나 객체 소유자가 사용자와 롤에게 부여



1.encore 테이블스페이스 만들고
2.encore 유저가 디폴트테이블스페이스는 encore/tmp 사용
3.encore가 hrdml student select



*/



/*계층적 질의문*/

-- 계층적 질의문을 사용하여 부서 테이블에서 학과,학부, 단과대학을 검색하여
-- 단대, 학부 학과순으로 top-down 형식의 계층 구조로 출력
select deptno, dname, college
from department
start with deptno= 10
connect by prior deptno = college;


-- 계층적 질의문을 사용하여 부서 테이블에서 학과, 학부, 단과대학을 검색하여
-- 학과, 학부, 단대 순으로 bottom-up 형식의 계층 구조로 출력
select deptno, dname, college
from department
start with deptno = 102
connect by prior college = deptno;

-- 계층적 질의문을 사용하여 부서 테이블에서 부서 이름을 검색하여 단대, 학부, 학과순의
-- top-down 형식으로 출력, 단 시작 데이터는 '공과대학'이고, 각 레벨별로 우측으로 2칸

select level,lpad(' ',(level-1)*3)|| dname 조직도
from department
start with dname = '공과대학'
connect by prior deptno = college;

/** 계층 구조에서 가지 제거**/

-- 계층적 질의문을 사용하여 부서 테이블에서 dname 칼럼을 단대, 학부,학과 순으로
-- top-down 형식의 계층 구조로 출력
-- 단, 정보미디어학부를 제외

select deptno, college, dname, loc
from department
where dname != '정보미디어학부'
start with college is null
connect by prior deptno = college;

-- 계층적 질의문을 사용하여 부서 테이블에서 dname 칼럼을 단대, 학부,학과순으로
-- top-down 형식의 계층 구조로 출력
-- 단, 정보미디어학부와 정보미디어학부에 속한 모든 학과를 제외하고 출력
select deptno, college, dname, loc
from department
start with college is null
connect by prior deptno = college
and dname != '정보미디어학부';


/*계층적 질의문 응용 - CONNECT_BY_ROOT*/
--계층적 질의문을 사용하여 LEVEL이 1인 최상위로우의 정보를 얻어올 수가 잇다
select lpad(' ',4*(level-1)) || ename 사원명,
        empno 사번,
        connect_by_root empno 최상위사번,
        level
from emp
start with job = upper('President')
connect by prior empno = mgr;

/*계층적질의문 응용 - CONNECT_BY_ISLEAF*/
-- 로우의 최하위레벨 여부를 반환
select lpad(' ',4*(level-1)) || ename 사원명,
        empno 사번,
        connect_by_isleaf Leaf_YN,
        level
from emp
start with job = upper('President')
connect by prior empno = mgr;

/*계층적질의문 응용 - SYS_CONNECT_BY_PATH*/
select lpad(' ',4*(level-1)) || ename 사원명,
        empno 사번,
        sys_connect_by_path(ename,'/') path
from emp
start with job = upper('President')
connect by prior empno = mgr;

-- 계층적 질의문을 사용하여 leaf node만 전체 path 정보가 나오도록 할 수 잇다
select level,sys_connect_by_path(ename,'/') path
from emp
where connect_by_isleaf = 1
start with mgr is null
connect by prior empno = mgr;

/*계층적 질의문 응용 - ORDER SIBLINGS BY*/
-- TREE의 상관관계를 그대로 유지하면서 내부요소를 정렬
-- ORDER BY를 사용하였을 경우 TREE의 구조가 깨지기 때문에
-- TREE 구조를 그대로 유지하기위해 사용함
select lpad(' ',4*(level-1)) || ename 사원명,
        ename ename2,empno 사번, level
from emp
start with job = upper('President')
connect by prior empno = mgr
order siblings by ename;