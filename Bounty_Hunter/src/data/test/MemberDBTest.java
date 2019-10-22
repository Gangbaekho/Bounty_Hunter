package data.test;

import static org.junit.Assert.*;

import org.junit.Test;

import data.db.MemberDB;
import data.dto.MemberDTO;

public class MemberDBTest {

	private MemberDB db = new MemberDB();
	
/*	@Test
	public void MemberDBInsertAndRead() {
		
		db.deleteAllMember();
		
		MemberDTO dto1 = new MemberDTO();
		dto1.setEmail1("vv888vv");
		dto1.setEmail2("naver.com");
		dto1.setMobile("01029482818");
		dto1.setMyid("jajajaja");
		dto1.setName("1234");
		dto1.setPass("hahaha");
		
		db.insertMember(dto1);
		
		
		
	}*/
	
/*	@Test
	public void MemberUpdateTest() {
		
		MemberDTO dto1 = new MemberDTO();
		dto1.setEmail1("vv888vv");
		dto1.setEmail2("naver.com");
		dto1.setMobile("01029482818");
		dto1.setMyid("jajajaja");
		dto1.setName("1234");
		dto1.setPass("hahaha");
		dto1.setBounty(10000);
		
		db.updateMember(dto1);
		
	}*/
	
/*	@Test
	public void MemberDeleteTest() {
		
		db.deleteMember(7);
	}*/
	
	@Test
	public void MemberReadTest() {
		
		MemberDTO dto = db.getMember(8);
		
		
		
	}

}
