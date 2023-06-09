/**昔畿什**/
-- SQL 誤敬庚税 坦軒 紗亀研 狽雌獣徹奄 是背 町軍拭 企背 持失馬澗 梓端
-- 匂昔闘研 戚遂馬食 砺戚鷺拭 煽舌吉 汽戚斗研 沓棋 衝室什馬奄 是敗

/*壱政 昔畿什*/
-- 政析廃 葵聖 亜走澗 町軍拭 企背 持失馬澗 昔畿什稽
-- 乞窮 昔畿什 徹澗 砺戚鷺税 馬蟹税 楳引 尻衣
-- 幻析 採辞 戚硯戚 掻差鞠檎 壱政 昔畿什亜 持失鞠走 省製
create unique index idx_dept_name
on department(dname);

/*搾壱政 昔畿什*/
-- 掻差吉 葵聖 亜走澗 町軍拭 企背 持失馬澗 昔畿什稽
-- 蟹馬税 昔畿什 徹澗 砺戚鷺税 食君 楳引 尻衣吃 呪 赤陥
create index idx_stud_birthdate
on student(birthdate);

/*舘析 昔畿什*/
-- 馬蟹税 町軍生稽幻 姥失吉 昔畿什
/*衣杯 昔畿什*/
-- 砧 鯵 戚雌税 町軍聖 衣杯馬食 持失馬澗 昔畿什
create index idx_stud_dno_grade
on student(deptno,grade);

/*DESCENDING INDEX*/
-- 町軍紺稽 舛慶 授辞研 紺亀稽 走舛馬食
-- 衣杯 昔畿什研 持失馬奄 是廃 号狛
create index fidx_stud_no_name 
on student(deptno desc, name asc);

/*敗呪 奄鋼 昔畿什*/
-- upper(column_name)/lower(column_name)徹趨球稽 舛税吉
-- 敗呪奄鋼 昔畿什研 紫遂馬檎 企社庚切 姥歳 蒸戚 伊事 亜管

create index uppercase_idx on emp (upper(ename));
select * from emp where upper(ename) = 'KING';

/* 俳持 砺戚鷺拭辞 俳持級税 搾幻亀 著舛聖 是背 妊層 端掻聖 姥馬壱切 敗
妊層 端掻拭 企廃 敗呪 奄鋼 昔畿什 持失 */

create index idx_standard_weight on student((height-100)*0.9);


/**昔畿什 叔楳 井稽 溌昔**/
-- 叔楳 井稽 : 誤敬庚戚 鎧採旋生稽 坦軒鞠澗 井稽
-- cmd 但拭辞 叔楳 暁澗
-- F10聖 刊牽檎 叔楳 井稽 溌昔 亜管

/*俳引 砺戚鷺拭辞 俳引 戚硯戚 '舛左耕巨嬢俳採'昔 俳引 腰硲研
伊事廃 衣引拭 企廃 叔楳井稽研 歳汐馬虞. dname 鎮軍拭 壱政 昔畿什亜
持失鞠嬢 責陥*/
select deptno, dname
from department
where dname = '舛左耕巨嬢俳採';

-- idx_dept_name 昔畿什 肢薦
drop index idx_dept_name;
-- dname町軍拭 持失吉 昔畿什亜 肢薦鞠嬢 穿端 砺戚鷺聖 伊事
select deptno, dname
from department
where dname = '舛左耕巨嬢俳採';

/*俳持 砺戚鷺拭辞 持析戚'79/04/02'昔 俳持 戚硯聖 伊事廃 衣引拭 企廃
叔楳 井稽研 歳汐
birthdate 町軍拭 企背 搾壱政 昔畿什亜 持失鞠嬢 責製*/

-- birthdate 町軍拭 持失吉 idx_stud_birthdate 昔畿什研 戚遂廃 沓棋植室什
select name, birthdate
from student
where birthdate = '79/04/02';

/**昔畿什 舛左 繕噺**/
-- 昔畿什 戚硯引 戚晴失 食採 去聖 溌昔

select index_name, uniqueness
from user_indexes
where table_name = 'STUDENT';

-- 昔畿什税 戚硯, 昔畿什亜 持失吉 砺戚鷺 戚硯引 町軍 戚硯 去聖 溌昔
select index_name, column_name
from user_ind_columns
where table_name = 'STUDENT';

--昔畿什 肢薦 : drop index

/*昔畿什 仙姥失*/
-- 昔畿什研 舛税廃 砺戚鷺税 町軍 葵拭 企背 痕井 拙穣戚 切爽 降持馬食,
-- 災琶推馬惟 持失吉 昔畿什 鎧採 葛球研 舛軒馬澗 拙穣

alter index stud_no_pk rebuild;




儀 鎧惟 背爽室食 薦降ばぬばぬば 2腰戚蟹 逃奄澗惟 嬢距辞っ ばぬ