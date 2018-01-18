package com.archmage.authentication;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.archmage.dao.UserInfoDao;
import com.archmage.model.UserInfo;

@Service
public class MyDBAuthenticationService implements UserDetailsService {
	
	@Autowired
	private UserInfoDao userInfoDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserInfo userInfo = userInfoDao.findUserInfo(username);
		System.out.println("***userinfo = " + userInfo);
		if (userInfo == null) {
			throw new UsernameNotFoundException("***user: " + username + " was not found");
		}
		
		List<String> roleList = userInfoDao.getUserRoles(username);
		List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
		if (roleList != null) {
			for (String role : roleList) {
				GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + role);
				grantList.add(authority);
			}
		}
		
		UserDetails userDetails = (UserDetails) new User(
				userInfo.getUserName(), userInfo.getPassword(), grantList);
		return userDetails;
	}
}
