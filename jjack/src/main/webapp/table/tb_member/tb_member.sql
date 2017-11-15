create table TB_MEMBER(
m_no NUMBER(10) primary key,
m_id varchar2(32) unique,
m_pw varchar2(32) not null,
m_name varchar2(20) not null,
m_sex char(1) not null,
m_birth datel,
m_email varchar2(100) not null, 
m_loc varchar2(16) not null, 
m_joindate date default sysdate
--그 데이터를 폼에서 받지 않아도 DB에서 자동적으로 
--행이 추가 될 때마다 SYSDATE를 입력하게 해주는 것 
--deault sysdate

); 