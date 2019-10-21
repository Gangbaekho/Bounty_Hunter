package data.test;

import data.db.BoardDB;
import data.db.MemberDB;
import data.dto.BoardDTO;

public class BoardDBTest {
	
	public static void main(String[] args) {
		
		BoardDB db = new BoardDB();
		
		BoardDTO dto = new BoardDTO();
		
		dto.setTitle("안녕");
		dto.setContent("시간 순삭");
		
		db.insertBoard(1, dto);
	}
}
