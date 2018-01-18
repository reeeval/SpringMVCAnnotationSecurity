package com.archmage.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.archmage.dao.UserInfoDao;

@Configuration
@ComponentScan("com.archmage.*")
@EnableTransactionManagement
@PropertySource("classpath:datasource-cfg.properties")
public class ApplicationContextConfig {
	@Autowired
	private Environment env;
	@Autowired
	private UserInfoDao userInfoDao;
	
	@Bean
	public ResourceBundleMessageSource messageSource() {
		ResourceBundleMessageSource rb = new ResourceBundleMessageSource();
		rb.setBasenames(new String[] {"messages/validator"});
		return rb;
	}
	
	@Bean(name = "viewResolver")
	public InternalResourceViewResolver getViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/pages/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	
	@Bean(name = "dataSource")
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(env.getProperty("ds.database-driver"));
		dataSource.setUrl(env.getProperty("ds.url"));
		dataSource.setUsername(env.getProperty("ds.username"));
		dataSource.setPassword(env.getProperty("ds.password"));
		System.out.println("## getDataSource: " + dataSource);
		return dataSource;
	}
	
	@Autowired
	@Bean(name = "transactionManager")
	public DataSourceTransactionManager geTransactionManager(DataSource dataSource) {
		DataSourceTransactionManager transactionManager = new DataSourceTransactionManager(dataSource);
		return transactionManager;
	}

	public UserInfoDao getUserInfoDao() {
		return userInfoDao;
	}

	public void setUserInfoDao(UserInfoDao userInfoDao) {
		this.userInfoDao = userInfoDao;
	}
}
