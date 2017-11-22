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
		
		
