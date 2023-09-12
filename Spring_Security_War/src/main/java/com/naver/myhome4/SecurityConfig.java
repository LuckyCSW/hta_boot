package com.naver.myhome4;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.naver.security.CustomAccessDeniedHandler;
import com.naver.security.CustomUserDetailsService;
import com.naver.security.LoginFailHandler;
import com.naver.security.LoginSuccessHandler;


@EnableWebSecurity //스프링과 시큐리티 결합
@Configuration	
public class SecurityConfig {
	
	@Autowired
	private DataSource datasource;
	
	//SecurityFilterChain 를 빈으로 등록하는 방식을 권장
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		http.authorizeRequests().antMatchers("/resources/**/**").permitAll()
				.antMatchers("/member/login").permitAll()
				.antMatchers("/member/join").permitAll()
				.antMatchers("/member/idcheck").permitAll()
				.antMatchers("/member/joinProcess").permitAll()
				.antMatchers("/member/list").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/member/info").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/member/list/").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/**").access("hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')");
		
		http.formLogin().loginPage("/member/login")
				        .loginProcessingUrl("/member/loginProcess")
				        .usernameParameter("id")
				        .passwordParameter("password")
				        .successHandler(loginSuccessHandler())
				        .failureHandler(loginFailHandler());
		/*
		* (1) logoutSuccessUrl : 로그아웃 후 이동할 주소
		* (2) logoutUrl : (여기서 처리하기 때문에 컨트롤러 logout 제거 합니다. post방식을 요구합니다.)
		* (3) invalidateHttpSession : 로그아웃시 세션 속성들 제거
		* (4) deleteCookies : 쿠키 제거
		*/
		http.logout().logoutSuccessUrl("/member/login")
		.logoutUrl("/member/logout")
		.invalidateHttpSession(true)
		.deleteCookies("remember-me", "JSESSION_ID");
		
		http.rememberMe()
	      .rememberMeParameter("remember-me")
	      .userDetailsService(customUserService())
	      .tokenValiditySeconds(2419200)
	      .tokenRepository(tokenRepository());
		
		
		http.exceptionHandling().accessDeniedHandler(accessDeniedHandler());
		
		return http.build();
		
	}
	

	//추가
	AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration)
			throws Exception{
		return authenticationConfiguration.getAuthenticationManager();
	}
	
	//로그인 성공시 실행할 객체 생성
	@Bean
	public AuthenticationSuccessHandler loginSuccessHandler() {
		return new LoginSuccessHandler(); //패키지 com.naver.security에 존재하는 모든 클래스 파일에 @Service를 삭제합니다.
	}
	
	@Bean
    public UserDetailsService customUserService() {
       return new CustomUserDetailsService(); //패키지 com.naver.security에 존재하는 모든 클래스 파일에 @Service를 삭제합니다.
    }
  
    @Bean
    public PasswordEncoder passwordEncoder() {
       return new BCryptPasswordEncoder();
    }
  
    @Bean
    public AccessDeniedHandler accessDeniedHandler() {
       return new CustomAccessDeniedHandler();
    }
    
    @Bean
    public AuthenticationFailureHandler loginFailHandler() {
       return new LoginFailHandler();
    }
    
    @Bean
    public PersistentTokenRepository tokenRepository(){
    	//PersistentTokenRepository의 구현체인 JdbcTokenRepositoryImpl 클래스 사용합니다.
        JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
        jdbcTokenRepository.setDataSource(datasource); //dataSource 주입
        return jdbcTokenRepository;
    }
}
