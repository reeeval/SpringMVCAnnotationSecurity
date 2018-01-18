package com.archmage.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.archmage.authentication.MyDBAuthenticationService;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	MyDBAuthenticationService myDBAuthenticationService;
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		//users in memory
		auth.inMemoryAuthentication().withUser("user1").password("12345").roles("USER");
		auth.inMemoryAuthentication().withUser("admin1").password("12345").roles("USER, ADMIN");
		//users in database
		auth.userDetailsService(myDBAuthenticationService);
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		
		//the page does not require login
		http.authorizeRequests().antMatchers("/", "/welcome", "/login", "/logout").permitAll();
		
		//userInfo page requires login as user or admin
		http.authorizeRequests().antMatchers("/userInfo").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");
		http.authorizeRequests().antMatchers("/insert").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");
		http.authorizeRequests().antMatchers("/chat").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");
		
		//for admin only
		http.authorizeRequests().antMatchers("/admin").access("hasRole('ROLE_ADMIN')");
		
		//not enough role access denied
		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/forbidden");
		
		//config for login form
		http.authorizeRequests().and().formLogin()
		.loginProcessingUrl("/j_spring_security_check")
		.loginPage("/login")
		.defaultSuccessUrl("/userInfo")
		.failureUrl("/login?error=true")
		.usernameParameter("username")
		.passwordParameter("password")
		.and().logout().logoutUrl("/logout").logoutSuccessUrl("/logoutSuccessful");
	}
}
