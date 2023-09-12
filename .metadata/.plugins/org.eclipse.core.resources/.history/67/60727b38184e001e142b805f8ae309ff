package com.naver.myhome4.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.naver.myhome4.domain.Board;
/*
 *  Mapper 인터페이스란 매퍼 파일에 기재된 SQL을 호출하기 위한 인터페이스입니다.
 *  MyBatis-Spring은 Mapper 인터페이스를 이용해서 실제 SQL 처리가 되는 클래스를 자동으로 생성합니다.
 */
public interface BoardMapper {

	// 글의 갯수 구하기
	public int getListCount();

	// 글 목록 보기
	public List<Board> getBoardList(HashMap<String, Integer> map);
	
	// 글 내용 보기
	public Board getDetail(int num);

	// 글 답변
	public int boardReply(Board board);

	// 글 수정
	public int boardModify(Board modifyboard);

	// 글 삭제
	public int boardDelete(Board board);

	// 조회수 업데이트
	public int setReadCountUpdate(int num);
	
	//글쓴이인지 확인
	public Board isBoardWriter(HashMap<String, Object> map);
	
	// 글 등록하기
	public void insertBoard(Board board) ;
	
    //BOARD_RE_SEQ값 수정
	public int boardReplyUpdate(Board board);
	
}
