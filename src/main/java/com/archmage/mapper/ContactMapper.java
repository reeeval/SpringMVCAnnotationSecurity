package com.archmage.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.archmage.model.Contact;

public class ContactMapper implements RowMapper<Contact>{
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public Contact mapRow(ResultSet rs, int rowNum) throws SQLException {
		int contactId = Integer.parseInt(rs.getString("contactid"));
		String firstName = rs.getString("firstname");
		String lastName = rs.getString("lastname");
		Date dob = null;
		String email = rs.getString("email");
		String createdBy = rs.getString("createdby");
		Date createdDate = null;
		String lastUpdatedBy = rs.getString("lastupdatedby");
		Date lastUpdatedDate = null;
		
		try {
			if (rs.getString("dob") != null) dob = sdf.parse(rs.getString("dob"));
			if (rs.getString("createddate") != null) createdDate = sdf.parse(rs.getString("createddate"));
			if (rs.getString("lastupdateddate") != null) lastUpdatedDate = sdf.parse(rs.getString("lastupdateddate"));
		}
		catch (ParseException pe) {
			pe.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return new Contact(contactId, firstName, lastName, dob, email, createdBy, createdDate, lastUpdatedBy, lastUpdatedDate);
	}

}
