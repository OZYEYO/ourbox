package ourbox.config.ourbox;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;

/*<context:property-placeholder location="classpath:kr/or/ddit/config/db/db.properties"/>*/
@PropertySource("classpath:kr/or/ddit/config/db/db.properties")
@Configuration
public class DataSourceContext {

	@Autowired
	private Environment env;
	
	/*
	<bean id="dataSource" class="org.apache.commons.dbcp2.BasicDataSource">
	 	<property name="url" value="${jdbc.url}"/>
	 	<property name="driverClassName" value="${jdbc.driver}"/>
	 	<property name="username" value="${jdbc.username}"/>
	 	<property name="password" value="${jdbc.password}"/>
	 </bean>

	<!-- mybatisUtil 역할 -->
	<bean id="sqlSessionFactoryBean" class="org.mybatis.spring.SqlSessionFactoryBean">
		<property name="configLocation" value="classpath:kr/or/ddit/config/db/mybatis-config.xml"/>
		<property name="dataSource" ref="dataSource"/> <!-- springBean으로ㅗ 등록했기 때문에 ref속성을 사용한다 -->
	</bean>
	
	<!-- sqlSession -->
	<bean id="sqlSessionTemplate" class="org.mybatis.spring.SqlSessionTemplate">
		<constructor-arg ref="sqlSessionFactoryBean"/>
	</bean>
	 */
	
	@Bean
	public DataSource dataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setUrl(env.getProperty("jdbc.url"));
		dataSource.setDriverClassName(env.getProperty("jdbc.driver"));
		dataSource.setUsername(env.getProperty("jdbc.username"));
		dataSource.setPassword(env.getProperty("jdbc.password"));
		dataSource.setMaxTotal(2);
		dataSource.setMaxIdle(2);
		return dataSource;
	}

	
	/*
	 <!-- mybatisUtil 역할 -->
	<bean id="sqlSessionFactoryBean" class="org.mybatis.spring.SqlSessionFactoryBean">
		<property name="configLocation" value="classpath:kr/or/ddit/config/db/mybatis-config.xml"/>
		<property name="dataSource" ref="dataSource"/> <!-- springBean으로ㅗ 등록했기 때문에 ref속성을 사용한다 -->
	</bean>
	 */
	
	//bean선언과 매핑되는 부분
	@Bean
	public SqlSessionFactory sqlSessionFactoryBean() throws Exception {
		
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		
		//property(= setter)와 매핑되는 부분
		factoryBean.setConfigLocation(new ClassPathResource("kr/or/ddit/config/db/mybatis-config.xml"));
		factoryBean.setDataSource(dataSource());
		
		return factoryBean.getObject();
	}
	
	/*
	<!-- sqlSession -->
	<bean id="sqlSessionTemplate" class="org.mybatis.spring.SqlSessionTemplate">
		<constructor-arg ref="sqlSessionFactoryBean"/>
	</bean>
	 */

	@Bean
	public SqlSessionTemplate sqlSessionTemplate() throws Exception {
		SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactoryBean());
		
		return sqlSessionTemplate;
	}
	
}
