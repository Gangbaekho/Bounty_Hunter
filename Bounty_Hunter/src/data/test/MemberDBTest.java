package data.test;

import data.db.MemberDB;
import data.dto.MemberDTO;

public class MemberDBTest {
	
	public static void main(String[] args) {
		
		MemberDB db = new MemberDB();
		
		MemberDTO dto = new MemberDTO();
		dto.setEmail1("leesol529");
		dto.setEmail2("naver.com");
		dto.setMobile("01027749429");
		dto.setName("이솔");
		dto.setPass("5252");
		dto.setNum(5);
		dto.setBounty(100);
		
	
		db.updateMember(dto);
		
	}
}
