package com.jjack.web.util;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

/**
 * 파일 업로드시 발생하는 여러 절차를 처리하기 위한 함수로 구성된 유틸리티 클래스
 * @author : daeo
 * @since : 2017. 11. 1.	
 */
public class FileUtil {
	
	/**
	 * 실제 업로드를 진행할 함수
	 * @author : daeo
	 * @since : 2017. 11. 1.
	 * @param : 파일, 파일오리이름, 파일저장경로
	 * @return : void
	 */
	public static String upload(MultipartFile oriFile, String name, String path) {
		//	oriFile -> 임시 저장된 파일의 정보
		//	name, path -> 임시 파일을 복사할 위치와 복사할 파일의 이름
		
		//	복사하기 전에 지금 복사할 이름이 중복되면 바꾸어서 복사를 해야 한다.
		name = renameFile(name, path);
		
		//	1.	복사할 파일을 File클래스로 만든다.
		File copyFile = new File(path+"\\"+name); //이 경로에 있는 파일을 가져와서 쓸 계획이다. 
	
		//	2.	복사를 시도한다.
		try {
			oriFile.transferTo(copyFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}
	
	/**
	 * 업로드 할 때 파일의 이름이 중복되는 경우 처리할 함수
	 * @author : daeo
	 * @since : 2017. 11. 1.
	 * @param : 파일원래이름, 파일저장경로
	 * @return : String
	 */
	public static String renameFile(String name, String path) {
		//	반환값	변경된 파일 이름
		//	파라메터	변경괸 파일의 이름과 저장 경로
		
		//	규칙	이름이 중복되면 이름 뒤에_번호를 이용해서 이름을 변경하도록 한다.
		//		예>	hong.txt	hong_1.txt로 바꿀 예정이다.
		//	_뒤에 불을 번호를 관리
		int count = 0;
		String oriName = name;
		File file = new File(path+"\\"+oriName);
		while (file.exists()) {
			//	이 파일은 이름을 바꾸어서 알려주어야 한다.
			//	방법
			//	1	.을 이용해서 앞의 내용과 뒤의 내용을 분리한다.
			//	hong.txt	hong	txt 분리한다.
			int pos = name.lastIndexOf(".");
			String first = name.substring(0, pos);
			String last = name.substring(pos + 1);
			//	2.	이 결과에 _번호를 붙여서 다시 재 조립한다.
			count++;
			first = first + "_" + count;	// hong_1
			oriName = first + "." + last;
			
			//	그런데 위에 이름도 있을 수 있다.
			file = new File(path + "\\" + oriName);
			
		}
		return oriName;
	}
}
