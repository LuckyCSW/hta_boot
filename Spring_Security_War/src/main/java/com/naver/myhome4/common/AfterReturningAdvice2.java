package com.naver.myhome4.common;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/*
 *  Advice : 횡단 관심에 해당하는 공통 기능을 의미하며 독립된 클래스의 메소드로 작성됩니다.
 *  AfterReturningAdvice : 타겟 메소드가 성공적으로 결과값을 반환 후에 어드바이스 기능을 수행합니다. 
 */
//@Service
//@Aspect
public class AfterReturningAdvice2 {
	private static final Logger logger = LoggerFactory.getLogger(AfterReturningAdvice2.class);
	
	@AfterReturning(pointcut="execution(* com.naver.myhome4..*Impl.get*(..))", returning="obj")
	public void afterReturningLog(Object obj) {
		logger.info("============================================================");
		logger.info("[AfterReturningAdvice2]: 비즈니스 로직 수행 후 동작입니다.");
		logger.info("[AfterReturningAdvice2] obj : " + obj.toString());
		logger.info("============================================================");
	}
}
