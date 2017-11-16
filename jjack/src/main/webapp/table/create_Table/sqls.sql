-- 회원정보
CREATE TABLE TB_Member (
	m_no NUMBER(10) CONSTRAINT mno_pk PRIMARY KEY, -- 회원번호
	m_id VARCHAR2(32) NOT NULL, -- ID 
	m_pw VARCHAR2(32) NOT NULL, -- 비밀번호 
	m_name VARCHAR2(20) NOT NULL, -- 이름 
	m_sex CHAR(1) NOT NULL, -- 성별 
	m_birth DATE NOT NULL, -- 생년월일 
	m_email VARCHAR2(100) NOT NULL, -- 이메일 
	m_loc VARCHAR2(16) NOT NULL, -- 거주지 
	m_joindate DATE DEFAULT SYSDATE NOT NULL, -- 회원가입일 
	CONSTRAINT mmid_uk UNIQUE(m_id)
);



-- 신청자 
CREATE TABLE TB_Apply (
	a_no NUMBER(10) CONSTRAINT jano_pk PRIMARY KEY, -- 신청인덱스 
	m_no NUMBER(10) NOT NULL, -- 회원번호 
	a_apdate DATE DEFAULT SYSDATE NOT NULL, -- 신청한 날짜 
	a_cond NUMBER(2) DEFAULT 1 NOT NULL, -- 신청상태 
	a_interest VARCHAR2(10), -- 관심사 
	a_pic VARCHAR2(100) NOT NULL, -- 사진파일 
	a_tel VARCHAR2(20) NOT NULL, -- 전화번호
	e_eventdate VARCHAR2(8) NOT NULL, -- 입소날짜
	CONSTRAINT acond_ck CHECK(a_cond BETWEEN 1 AND 10),
	CONSTRAINT amno_fk FOREIGN KEY(m_no) REFERENCES TB_Member(m_no),
	CONSTRAINT aeeventdate_fk FOREIGN KEY(e_eventdate) REFERENCES TB_Event(e_eventdate)
);



-- 입소자 
CREATE TABLE TB_Guest (
	g_no NUMBER(10) CONSTRAINT gno_pk PRIMARY KEY, -- 입소자인덱스 
	a_no NUMBER(10) NOT NULL, -- 신청인덱스
	g_nick VARCHAR2(8) NOT NULL, -- 호칭 
	g_lunch NUMBER(10) CONSTRAINT glunch_fk REFERENCES TB_Guest(g_no), -- 도시락짝 
	g_choice NUMBER(10) CONSTRAINT gchoice_fk REFERENCES TB_Guest(g_no), -- 짝선택 
	g_course CHAR(1) CONSTRAINT gcourse_ck CHECK(g_course IN ('A', 'B', 'C', 'D', 'S')), -- 추천코스
	CONSTRAINT gano_fk FOREIGN KEY(a_no) REFERENCES TB_Apply(a_no)
);



-- 행사일정
CREATE TABLE TB_Event (
	e_eventdate VARCHAR2(8) CONSTRAINT eeventdate_pk PRIMARY KEY, -- 행사날짜
	e_eventend VARCHAR2(8) NOT NULL, -- 행사종료날짜
	e_gisoo NUMBER(5) NOT NULL, -- 기수
	e_loc VARCHAR2(16), -- 대상 거주지역
	e_age VARCHAR2(10), -- 대상 연령대
	e_title VARCHAR2(200) NOT NULL, -- 행사 제목
	e_contents VARCHAR2(2000), -- 행사 내용
	CONSTRAINT egisoo_uk UNIQUE(e_gisoo)
);



-- 공지게시판 
CREATE TABLE TB_Notice (
	n_no NUMBER(6) CONSTRAINT nno_pk PRIMARY KEY, -- 공지번호 
	n_date DATE DEFAULT SYSDATE NOT NULL, -- 공지날짜 
	n_title VARCHAR2(100) NOT NULL, -- 공지제목 
	n_contents CLOB NOT NULL, -- 공지내용 
	n_hits NUMBER(10) DEFAULT 0 NOT NULL, -- 공지조회수 
	n_IsShow CHAR(1) DEFAULT 'Y' NOT NULL, -- 공지존재여부
	CONSTRAINT nIsShow_ck CHECK(n_IsShow IN ('Y', 'N')) 
);


-- 후기게시판
CREATE TABLE TB_Review (
	r_no NUMBER(10) CONSTRAINT rno_pk PRIMARY KEY, -- 후기번호 
	g_no NUMBER(10) NOT NULL, -- 입소자인덱스 
	r_wdate DATE NOT NULL, -- 후기작성일 
	r_title VARCHAR2(200) NOT NULL, -- 후기제목 
	r_contents CLOB NOT NULL, -- 후기내용 
	r_hits NUMBER(10) DEFAULT 0 NOT NULL, -- 후기조회수 
	r_IsShow CHAR(1) DEFAULT 'Y' NOT NULL, -- 후기존재여부 
	CONSTRAINT rgno_fk FOREIGN KEY(g_no) REFERENCES TB_Guest(g_no),
	CONSTRAINT rIsShow_ck CHECK(r_IsShow IN ('Y', 'N'))
);



-- 후기 댓글 
CREATE TABLE TB_Comment (
	c_no NUMBER(20) CONSTRAINT cno_pk PRIMARY KEY, -- 댓글인덱스 
	c_wdate DATE DEFAULT SYSDATE NOT NULL, -- 댓글작성일 
	c_contents VARCHAR2(2000) NOT NULL, -- 댓글내용 
	c_IsShow CHAR(1) DEFAULT 'Y' NOT NULL, -- 댓글존재여부 
	m_no NUMBER(10) NOT NULL, -- 댓글단 회원번호 
	r_no NUMBER(10) NOT NULL, -- 후기번호
	CONSTRAINT cIsShow_ck CHECK(c_IsShow IN ('Y', 'N')),
	CONSTRAINT cmno_fk FOREIGN KEY(m_no) REFERENCES TB_Member(m_no),
	CONSTRAINT crno_fk FOREIGN KEY(r_no) REFERENCES TB_Review(r_no)
);
