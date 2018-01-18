package com.archmage.dao.impl;

import java.sql.Types;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.archmage.dao.UserInfoDao;
import com.archmage.mapper.ContactMapper;
import com.archmage.mapper.UserInfoMapper;
import com.archmage.model.Contact;
import com.archmage.model.UserInfo;

@Service
@Transactional
public class UserInfoDaoImpl extends JdbcDaoSupport implements UserInfoDao {
	
	@Autowired
	public UserInfoDaoImpl(DataSource dataSource) {
		this.setDataSource(dataSource);
	}

	@Override
	public UserInfo findUserInfo(String userName) {
		String q = "SELECT u.username, u.password FROM users u WHERE u.username = ? ";
		Object[] params = new Object[] {userName};
		UserInfoMapper mapper = new UserInfoMapper();
		try {
			UserInfo userInfo = this.getJdbcTemplate().queryForObject(q, params, mapper);
			return userInfo;
		}
		catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			return null;
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<String> getUserRoles(String userName) {
		String q = "SELECT r.user_role FROM user_roles r WHERE r.username = ? ";
		Object[] params = new Object[] {userName};
		List<String> roleList = this.getJdbcTemplate().queryForList(q, params, String.class);
		return roleList;
	}

	@Override
	public List<Contact> getAllContact() {
		String q = "SELECT * FROM contact ORDER BY createddate DESC";
		ContactMapper mapper = new ContactMapper();
		try {
			List<Contact> contactList = this.getJdbcTemplate().query(q, mapper);
			System.out.println("contactList: " + contactList);
			System.out.println("contactList.size(): " + contactList.size());
			return contactList;
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void createContact(Contact contact) {
		String q = "INSERT INTO contact (firstname, lastname, dob, email, createdby, createddate) VALUES (?, ?, ?, ?, ?, ?)";
		Object[] params = new Object[] {contact.getFirstName(), contact.getLastName(),
				contact.getDob(), contact.getEmail(),
				contact.getCreatedBy(), contact.getCreatedDate()};
		int[] types = new int[] {Types.VARCHAR, Types.VARCHAR, 
				Types.DATE, Types.VARCHAR, 
				Types.VARCHAR, Types.DATE};
		try {
			int result = this.getJdbcTemplate().update(q, params, types);
			System.out.println("***INSERT: " + result + " row inserted.");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateContact(Contact contact) {
		String q = "UPDATE contact SET firstname = ?,"
				+ " lastname = ?,"
				+ " dob = ?,"
				+ " email = ?,"
				+ " lastupdatedby = ?,"
				+ " lastupdateddate = ?"
				+ " WHERE contactid = ?";
		Object[] params = new Object[] {contact.getFirstName(), contact.getLastName(),
				contact.getDob(), contact.getEmail(),
				contact.getLastUpdatedBy(), contact.getLastUpdatedDate(),
				contact.getContactId()};
		int[] types = new int[] {Types.VARCHAR, Types.VARCHAR, 
				Types.DATE, Types.VARCHAR,
				Types.VARCHAR, Types.DATE,
				Types.INTEGER};
		try {
			int result = this.getJdbcTemplate().update(q, params, types);
			System.out.println("***UPDATE: " + result + " row updated.");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteContact(int contactId) {
		String q = "DELETE FROM contact WHERE contactid = ?";
		Object[] params = new Object[] {contactId};
		int[] types = new int[] {Types.INTEGER};
		try {
			int result = this.getJdbcTemplate().update(q, params, types);
			System.out.println("***DELETE: " + result + " row deleted.");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Contact getContactById(int contactId) {
		String q = "SELECT * FROM contact WHERE contactid = ?";
		ContactMapper mapper = new ContactMapper();
		Object[] params = new Object[] {contactId};
		int[] types = new int[] {Types.INTEGER};
		try {
			Contact contact = (Contact) this.getJdbcTemplate().queryForObject(q, params, types, mapper);
			return contact;
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
