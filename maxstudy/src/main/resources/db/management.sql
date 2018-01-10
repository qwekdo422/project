-- 직원교육관리 메인테이블
CREATE TABLE EMP_TRAINING
(
	M_NO 			NUMBER(5) 			PRIMARY KEY, 	-- 인덱스 번호
	M_NAME 			VARCHAR2(50) 		NOT NULL,	 	-- 이름
	M_STARTDATE 	DATE,								-- 교육 시작일
	M_ENDDATE 		DATE, 								-- 교육 종료일
	M_TITLE 		VARCHAR2(200)		NOT NULL,		-- 교육과정명
	M_EVALUATION 	VARCHAR2(50)		NOT NULL,		-- 평가
	M_STATUS		VARCHAR2(50)		NOT NULL		-- 합격여부
)

-- 직원교육관리 서브테이블
CREATE TABLE EMP_TRAINING_SUB
(
	S_NO 			NUMBER(5) 			PRIMARY KEY, 	-- 인덱스 번호
	M_NO			NUMBER(5) 			NOT NULL,		-- 외래키 EMP_TRAINING 인덱스 번호
	S_NAME 			VARCHAR2(50) 		NOT NULL,	 	-- 이름
	S_DATE 			DATE,								-- 교육일자
	S_DAY 			VARCHAR2(3)			NOT NULL,		-- 요일
	S_CONTENT 		VARCHAR2(2000)		NOT NULL,		-- 교육내용
	S_EVALUATION 	VARCHAR2(50),						-- 평가
	S_COMMENT		VARCHAR2(500),						-- 비고
	CONSTRAINT EMP_TRAINING_FK FOREIGN KEY(M_NO) REFERENCES EMP_TRAINING(M_NO)
)


-- 직원교육관리 메인테이블 등록
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동', '2017/10/10', '2017/10/27', '신입교육','잘함', '합격');
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동1', '2017/10/10', '2017/10/27', '신입교육','노력요함', '불합격';
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동2', '2017/10/10', '2017/10/27', '경력3년차 교육', '잘함', '합격');
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동3', '2017/10/10', '2017/10/27', '경력3년차 교육', '잘함', '합격');
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동4', '2017/10/10', '2017/10/27', '경력3년차 교육', '잘함', '합격');
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동5', '2017/10/10', '2017/10/27', '경력3년차 교육', '잘함', '합격');
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동6', '2017/10/10', '2017/10/27', '경력3년차 교육', '잘함', '합격');
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동7', '2017/10/10', '2017/10/27', '경력3년차 교육', '잘함', '합격');
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동8', '2017/10/10', '2017/10/27', '경력3년차 교육', '잘함', '합격');
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동9', '2017/10/10', '2017/10/27', '경력3년차 교육', '잘함', '합격');
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동10', '2017/10/10', '2017/10/27', '경력3년차 교육', '잘함', '합격');
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동11', '2017/10/10', '2017/10/27', '경력3년차 교육', '잘함', '합격');
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동12', '2017/10/10', '2017/10/27', '경력3년차 교육', '잘함', '합격');
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동13', '2017/10/10', '2017/10/27', '경력3년차 교육', '잘함', '합격');
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동14', '2017/10/10', '2017/10/27', '경력3년차 교육', '잘함', '합격');
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동15', '2017/10/10', '2017/10/27', '경력3년차 교육', '잘함', '합격');
insert into EMP_TRAINING values((select nvl(max(m_no), 0) + 1 from EMP_TRAINING), '홍길동16', '2017/10/10', '2017/10/27', '경력3년차 교육', '노력요함', '불합격');



-- 직원교육상세관리 등록
insert into EMP_TRAINING_SUB values((select nvl(max(s_no), 0) + 1 from EMP_TRAINING_SUB), 15, '홍길동15', '20171010', '화', 'JAVA의 정석 책1권 학습', '잘함', NULL);
insert into EMP_TRAINING_SUB values((select nvl(max(s_no), 0) + 1 from EMP_TRAINING_SUB), 15, '홍길동15', '20171011', '수', 'STS,TOMCAT,ORACLE', '적절함', NULL);
insert into EMP_TRAINING_SUB values((select nvl(max(s_no), 0) + 1 from EMP_TRAINING_SUB), 15, '홍길동15', '20171012', '목', '게시판 학습', '조금만더', NULL);
insert into EMP_TRAINING_SUB values((select nvl(max(s_no), 0) + 1 from EMP_TRAINING_SUB), 15, '홍길동15', '20171013', '금', '프로젝트 UI생성', '노력요함', NULL);
insert into EMP_TRAINING_SUB values((select nvl(max(s_no), 0) + 1 from EMP_TRAINING_SUB), 15, '홍길동15', '20171016', '월', '프로젝트 페이징 작업', '잘함', NULL);
insert into EMP_TRAINING_SUB values((select nvl(max(s_no), 0) + 1 from EMP_TRAINING_SUB), 15, '홍길동15', '20171017', '화', '메일 템플릿 입력', '잘함', NULL);
insert into EMP_TRAINING_SUB values((select nvl(max(s_no), 0) + 1 from EMP_TRAINING_SUB), 15, '홍길동15', '20171018', '수', '유효성 검사', '잘함', NULL);
insert into EMP_TRAINING_SUB values((select nvl(max(s_no), 0) + 1 from EMP_TRAINING_SUB), 15, '홍길동15', '20171019', '목', 'SMTP 작동', '잘함', NULL);
insert into EMP_TRAINING_SUB values((select nvl(max(s_no), 0) + 1 from EMP_TRAINING_SUB), 15, '홍길동15', '20171020', '금', '다음 SMTP를 활용', '잘함', NULL);
insert into EMP_TRAINING_SUB values((select nvl(max(s_no), 0) + 1 from EMP_TRAINING_SUB), 15, '홍길동15', '20171023', '월', '메일 발송 시 기록남기기', '잘함', NULL);
insert into EMP_TRAINING_SUB values((select nvl(max(s_no), 0) + 1 from EMP_TRAINING_SUB), 15, '홍길동15', '20171024', '화', '전일 문제 있던 수신자 데이터 값처리', '잘함', NULL);
insert into EMP_TRAINING_SUB values((select nvl(max(s_no), 0) + 1 from EMP_TRAINING_SUB), 15, '홍길동15', '20171025', '수', '자바스크립트', '잘함', NULL);
insert into EMP_TRAINING_SUB values((select nvl(max(s_no), 0) + 1 from EMP_TRAINING_SUB), 15, '홍길동15', '20171026', '목', '제이쿼리', '잘함', NULL);
insert into EMP_TRAINING_SUB values((select nvl(max(s_no), 0) + 1 from EMP_TRAINING_SUB), 15, '홍길동15', '20171027', '금', 'HTML,CSS', '잘함', NULL);

select * from EMP_TRAINING where m_name = '홍길동15';

select * from EMP_TRAINING;
select * from EMP_TRAINING_SUB;


SELECT
	S_NO, M_NO, S_NAME, S_DATE, S_DAY, S_CONTENT, S_EVALUATION, S_COMMENT
FROM
	EMP_TRAINING_SUB
WHERE
	 M_NO = 15	
