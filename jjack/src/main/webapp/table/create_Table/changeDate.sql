-- 입소일자 형식 20171111 에서 2017-11-11로 일괄변경하기 쿼리 

update tb_apply set e_eventdate=(
    select substr(ed, 1,4)||'-'||substr(ed,5,2)||'-'||substr(ed,7,2)
    FROM (select e_eventdate AS ed, a_no AS ano FROM tb_apply)
    where ano = a_no
);

