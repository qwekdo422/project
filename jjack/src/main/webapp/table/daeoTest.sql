select * from TB_EVENT;

select * from tb_member;


select * from TB_Apply;

select a_cond from  TB_APPLY where m_no = 31;

2017-11-04
31


		SELECT 
			NVL(max(A_COND), 0)
		FROM
			TB_APPLY
		WHERE
			M_NO = 31
		AND
			E_EVENTDATE = '2017-11-04'
			
		
		SELECT NVL(A_COND, 0)
		FROM TB_APPLY RIGHT OUTER JOIN DUAL
		ON M_NO = 31
		AND E_EVENTDATE = '2017-11-04'
		
		SELECT NVL(A_COND, 0)
			FROM TB_APPLY, dual(+) 
		WHERE M_NO = 31
			AND E_EVENTDATE = '2017-11-04'
		
		
			
		SELECT 
			count(*)
		FROM
			TB_APPLY
		WHERE
			M_NO = 31
		AND
			E_EVENTDATE = '2017-11-04'
		
		where 	
		(SELECT 
			count(*)
		FROM
			TB_APPLY
		WHERE
			M_NO = 31
		AND
			E_EVENTDATE = '2017-11-04')
			
			
			
		SELECT 
			NVL(MAX(A_COND), 0) AS cond,
			A_NO 				AS aNo, 
			M_NO 				AS mNo,
			A_APDATE 			AS apDay,
			A_INTEREST 			AS interest, 
			A_PIC 				AS pic,
			A_TEL 				AS tel,
			E_EVENTDATE 		AS eventdate
		FROM
			TB_APPLY
		WHERE
			M_NO = 31
		AND
			E_EVENTDATE = '2017-11-04'
			
		SELECT (SELECT 
					NVL(MAX(A_COND), 0)
				FROM
					TB_APPLY
				WHERE
					M_NO = 31
				AND
					E_EVENTDATE = '2017-11-04') as cond,
				A_TEL AS tel, A_INTEREST AS interest 
		FROM 
			TB_APPLY
		WHERE
			M_NO = 31
		
			
			
		SELECT 
			NVL(A_COND, 0) AS cnt, 
			A_TEL AS tel
		FROM 
			TB_APPLY RIGHT OUTER JOIN DUAL
		ON 	
			M_NO = 31
		AND 
			E_EVENTDATE = '2017-11-04'
			
		
		
		
		SELECT 
			(SELECT 
				NVL(MAX(A_COND), 0)
			FROM
				TB_APPLY
			WHERE
				M_NO = 31
			AND
				E_EVENTDATE = '2017-11-04') AS cond, A.A_TEL AS tel, M.M_LOC AS loc 
		FROM 
			TB_APPLY A, TB_MEMBER M
		WHERE
			A.M_NO = 31
		AND
			A.M_NO = M.M_NO
		
SELECT NVL(MAX(A_NO), 0) + 1 FROM TB_APPLY;


		SELECT 
			(
			SELECT 
				NVL(MAX(A_COND), 0)
			FROM
				TB_APPLY
			WHERE
				M_NO = 31
			AND
				E_EVENTDATE = '2017-11-11'
			)			AS cond, 
			A_TEL		AS tel,
			A_INTEREST	AS interest,
			A_PIC 		AS pic,
			A_NO		AS aNo
		FROM 
			TB_APPLY
		WHERE
			M_NO = 31
		AND
			E_EVENTDATE = '2017-11-11'
			
		
		SELECT 
			NVL(A_COND, 0)	AS cond,
			A_TEL			AS tel,
			A_INTEREST		AS interest,
			A_PIC 			AS pic,
			A_NO			AS aNo
		FROM
			TB_APPLY RIGHT OUTER JOIN DUAL 
		ON
			M_NO = 31
		AND
			E_EVENTDATE	= '2017-11-04'
		

			
			
			
update TB_Review set r_title = '여자 5호의 슬픈 언약식', r_contents = '<p>커풀이 안되어서 너무 속상해요~</p>' 
where r_no = 51   
			
			
			
	SELECT
		*
	FROM 
		(select
			rownum as resultno,
		    rt.*
		from
		     (select
		        r.r_no AS rno,
		        TO_CHAR(r.r_wdate) AS rdate,
		        e.e_gisoo AS gisoo,
		        gm.g_nick AS nickname,
		        DECODE(gm.g_course, 'S', '-', gp.g_nick) AS jjackname,
		        r.r_title AS rtitle,
		        (SELECT COUNT(cc.r_no) AS cCount FROM TB_Comment cc WHERE cc.c_Isshow='Y' AND r.r_no = cc.r_no) AS recnt,
		        r.r_hits AS rhis
		    FROM
		        TB_Review r,
		        TB_Event e,
		        TB_Guest gm,
		        TB_Guest gp,
		        TB_Apply a,
		        TB_Member m    
		    WHERE
		        m.m_no = a.m_no
		        AND gm.a_no = a.a_no
		        AND r.g_no = gm.g_no
		        AND gm.g_choice= gp.g_no
		        AND a.e_eventdate=e.e_eventdate
		        AND r.r_Isshow='Y'  
		    ORDER BY
		        r.r_no DESC ) rt) 
	where 
	     resultno BETWEEN 1 AND 9;
			
			
select * from TB_Review where r_no between 509 and 513;			
			
