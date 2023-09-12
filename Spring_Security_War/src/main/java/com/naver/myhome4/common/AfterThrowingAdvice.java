package com.naver.myhome4.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/*
 *  Advice : 횡단 관심에 해당하는 공통 기능을 의미하며 독립된 클래스의 메소드로 작성됩니다.
 *  after-throwing : 타겟 메소드가 수행 중 예외를 던지게 되면 어드바이스 기능을 수행합니다.
   
 *  BoardServiceImpl.java에서 getBoardList()안에
 	double i = 1/0; 
 		추가합니다.
 */

public class AfterThrowingAdvice {
	private static final Logger logger = LoggerFactory.getLogger(AfterThrowingAdvice.class);
	
	public void afterThrowingLog(Throwable exp) {
		logger.info("============================================================");
		logger.info("[AfterThrowing] : 비즈니스 로직 수행 중 오류가 발생하면 동작입니다.");
		logger.info("ex : " + exp.toString());
		logger.info("============================================================");
	}
}
