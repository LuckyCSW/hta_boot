package com.naver.myhome4.mybatis.mapper;

import java.util.List;
import java.util.Map;

import com.naver.myhome4.domain.Comment;
import com.naver.myhome4.domain.Member;
/*
 *  Mapper 인터페이스란 매퍼 파일에 기재된 SQL을 호출하기 위한 인터페이스입니다.
 *  MyBatis-Spring은 Mapper 인터페이스를 이용해서 실제 SQL 처리가 되는 클래스를 자동으로 생성합니다.
 */
public interface CommentMapper {

	// 글의 갯수 구하기
	public int getListCount(int board_num);

	// 댓글 목록 가져오기
	public List<Comment> getCommentList(Map<String, Integer> map);
	
	// 댓글 등록하기
	public int commentsInsert(Comment c);

	// 댓글 삭제
	public int commentsDelete(int num);

	// 댓글 수정
	public int commentsUpdate(Comment co);
	
}
