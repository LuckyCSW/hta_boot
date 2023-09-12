package com.naver.myhome4.common;

import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/*
 *  Advice : 횡단 관심에 해당하는 공통 기능을 의미하며 독립된 클래스의 메소드로 작성됩니다.
 *  AfterReturningAdvice : 타겟 메소드가 성공적으로 결과값을 반환 후에 어드바이스 기능을 수행합니다. 
 */

public class AfterReturningAdvice {
	private static final Logger logger = LoggerFactory.getLogger(AfterReturningAdvice.class);
	
	public void afterReturningLog(Object obj) {
		logger.info("============================================================");
		logger.info("[AfterReturningAdvice] obj : " + obj.toString());
		logger.info("============================================================");
	}
}
