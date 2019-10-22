package data.test;

import data.db.BoardDB;
import data.db.MemberDB;
import data.dto.BoardDTO;
import data.dto.MemberDTO;

public class BoardDBTest {
	
	public static void main(String[] args) {
		
		BoardDB db = new BoardDB();
		
		BoardDTO dto = new BoardDTO();
		
		dto.setNum(4);
		dto.setTitle("안녕 업뎃 확인");
		dto.setContent("시간 순삭");
		
		db.updateBoard(dto);
	}
}
