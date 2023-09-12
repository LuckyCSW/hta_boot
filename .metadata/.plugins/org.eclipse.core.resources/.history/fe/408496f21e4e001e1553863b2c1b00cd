package com.naver.myhome4.mybatis.mapper;

import java.util.List;
import java.util.Map;

import com.naver.myhome4.domain.Member;
/*
 *  Mapper 인터페이스란 매퍼 파일에 기재된 SQL을 호출하기 위한 인터페이스입니다.
 *  MyBatis-Spring은 Mapper 인터페이스를 이용해서 실제 SQL 처리가 되는 클래스를 자동으로 생성합니다.
 */
public interface MemberMapper {

	public Member isId(String id);
	
	public int insert(Member m);
	
	public int update(Member m);
	
	public void delete(String id);
	
	public int getSearchListCount(Map<String, String> map);
	
	public List<Member> getSearchList(Map<String, Object> map);
	
	
}
