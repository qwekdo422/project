create table TB_MEMBER(
m_no NUMBER(10) not null,
m_id varchar2(32) not null,
m_pw varchar2(32) not null,
m_name varchar2(20) not null,
m_sex char(1) not null,
m_birth date not null,
m_email varchar2(100), 
m_loc varchar2(16) not null, 
m_joindate date default sysdate
); 

-- 제약조건 추가
ALTER TABLE TB_MEMBER ADD CONSTRAINT m_no_pk PRIMARY KEY(m_no);
ALTER TABLE TB_MEMBER ADD CONSTRAINT m_id_uk UNIQUE(m_id);