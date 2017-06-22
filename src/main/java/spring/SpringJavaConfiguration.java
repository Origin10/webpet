package spring;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;

import vo.Fri_VO;
import vo.Informfri_VO;
import vo.Mem_VO;
import vo.Pet_VO;
import vo.Share_VO;

@Configuration
@ComponentScan(basePackages={"service,dao"})
public class SpringJavaConfiguration {
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dmds = new DriverManagerDataSource();
		dmds.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		dmds.setUrl("jdbc:sqlserver://localhost:1433;database=DBproj");
		dmds.setUsername("sa");
		dmds.setPassword("sa123456");
		return dmds;
	}
	@Bean
	public SessionFactory sessionFactory() {
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());
		Properties props = new Properties();
		props.setProperty("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
		props.setProperty("hibernate.current_session_context_class", "thread");
		props.setProperty("hibernate.show_sql", "true");
		builder.addProperties(props);
		builder.addAnnotatedClasses(Fri_VO.class, Informfri_VO.class,Mem_VO.class,Pet_VO.class,Share_VO.class);
		
//		builder.configure("hibernate.cfg.xml");
		
		return builder.buildSessionFactory();
	}
}
