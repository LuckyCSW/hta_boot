package com.naver.myhome4.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Service;

//공통으로 처리할 로직을 BeforeAdvice2 클래스에 beforeLog()메서드로 구현합니다.
//Advice : 횡단 관심에 해당하는 공통 기능을 의미하며 독립된 클래스의 메서드로 작성됩니다.
//Advice 클래스는 스프링 설정 파일에서 <bean>으로 등록하거나 @Service annotation을 사용합니다.

@Service
@Aspect // @Aspect가 설정된 클래스에는 Pointcut과 Advice를 결합하는 설정이 있어야 합니다.
public class BeforeAdvice2 {

   //Advice
   @Before("execution(* com.naver.myhome4..*Impl.get*(..))")
   public void beforeLog(JoinPoint proceeding) {

      System.out.println("===============================2==================================================");
      System.out.println("[BeforeAdvice] : 비지니스 로직 수행 전 동작입니다.");
      System.out.println("[BeforeAdvice] : " + proceeding.getTarget().getClass().getName() + "의 "
            + proceeding.getSignature().getName() + "() 호출합니다.");
      System.out.println("================================2=================================================");
   }

}