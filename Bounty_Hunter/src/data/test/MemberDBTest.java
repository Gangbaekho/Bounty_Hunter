package data.test;

import data.db.MemberDB;
import data.dto.MemberDTO;

public class MemberDBTest {
	
	public static void main(String[] args) {
		
		MemberDB db = new MemberDB();
		
		MemberDTO dto = new MemberDTO();
		dto.setEmail1("lasd");
		dto.setEmail2("naver.com");
		dto.setMobile("01029481828");
		dto.setMyid("leesol592");
		dto.setName("이솔");
		dto.setPass("1234");
	
		db.insertMember(dto);
		
	}
}
