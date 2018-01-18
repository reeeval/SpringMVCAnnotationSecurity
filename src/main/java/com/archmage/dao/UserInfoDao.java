package com.archmage.dao;

import java.util.List;

import com.archmage.model.Contact;
import com.archmage.model.UserInfo;

public interface UserInfoDao {
	
	public UserInfo findUserInfo(String userName);
	
	public List<String> getUserRoles(String userName);
	
	public List<Contact> getAllContact();
	
	public void createContact(Contact contact);
	
	public void updateContact(Contact contact);
	
	public void deleteContact(int contactId);
	
	public Contact getContactById(int contactId);
}
