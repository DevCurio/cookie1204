package common;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;


public class MvcUtils {
	
	//  비밀번호 암호화해서 넘기기 
	public static String getEncryptedPassword(String password) {
		String encryptedPassword = null;
		try {
			// 1. 암호화객체생성
			MessageDigest md = MessageDigest.getInstance("SHA-512");

			// 2. 문자열 -> byte[] -> 암호화객체에 전달 및 암호화
			byte[] bytes = password.getBytes("UTF-8");
			md.update(bytes);
			byte[] encryptedBytes = md.digest();
			System.out.println(new String(encryptedBytes));
			//3. 암호화된 byte[] -> 인코더Base64를 통한 문자열변환
			encryptedPassword = Base64.getEncoder().encodeToString(encryptedBytes);
			System.out.println(encryptedPassword);
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} 


      return encryptedPassword;
}
	
	public static String getPageBar(int totalContents, int cPage, int numPerPage, String url) {
		
		String pageBar = "";
		
		int pageBarSize = 5;
		int totalPage = (int)Math.ceil((double)totalContents / numPerPage);

		// /mvc/admin/memberList?cpage=
		// /mvc/admin/memberFinder?searchType=memberId&searchKeyward=a&cpage=
		url = url + (url.indexOf("?") > -1 ? "&" : "?") + "cPage=";
		
		// 1 2 3 4 5 : pageStart 1 ~ pageEnd 5 
		// 6 7 8 9 10 : pageStart 6 ~ pageEnd 10 
		int pageStart = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageStart + pageBarSize - 1;
		
		//증감변수
		int pageNo = pageStart;
		
		//이전 영역
		if(pageNo == 1) {
			
		}
		else {
			// /mvc/admin/memberList?cpage=5
			pageBar += "<a href='" + url + (pageNo - 1) + "'>&lt;</a>\n";
		}
		
		//페이지 No 영역
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			//현재페이지인 경우, 링크비활성화
			if(pageNo == cPage) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>\n";
			}
			else {
				pageBar += "<a href='" + url + pageNo + "'>" + pageNo + "</a>\n";
			}
			pageNo++;
		}
		//다음 영역
		if(pageNo > totalPage) {
			
		}
		else {
			pageBar += "<a href='" + url + pageNo + "'>&gt;</a>\n";
		}
		return pageBar;
	}

}
