package librarySystem.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.io.IOException;

@Configuration
@ComponentScan(basePackages = {"librarySystem.dao"})
@PropertySource(value = "classpath:db.properties")
public class RootConfig {
    @Bean(destroyMethod = "close")
    public DataSource dataSource(Environment env) {
        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        try {
            dataSource.setDriverClass(env.getProperty("driver"));
            dataSource.setJdbcUrl(env.getProperty("url"));
            dataSource.setUser("root");
            dataSource.setPassword("sorry");
            dataSource.setInitialPoolSize(Integer.parseInt(env.getProperty("initialSize")));
            dataSource.setMaxPoolSize(Integer.parseInt(env.getProperty("maxActive")));
            dataSource.setMaxIdleTime(Integer.parseInt(env.getProperty("maxIdle")));
            dataSource.setMaxConnectionAge(Integer.parseInt(env.getProperty("maxWait")));
        } catch (PropertyVetoException e) {
            e.printStackTrace();
        }
        return dataSource;
    }

    @Bean
    public DataSourceTransactionManager transactionManager(DataSource dataSource){
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean
    public SqlSessionFactoryBean sqlSessionFactory(DataSource dataSource){
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        bean.setTypeAliasesPackage("librarySystem.domain");
        String mapping = "librarySystem/mapper/*.xml";
        try {
            bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(mapping));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bean;
    }

    @Bean
    public MapperScannerConfigurer mapperScannerConfigurer(){
        MapperScannerConfigurer configurer = new MapperScannerConfigurer();
        configurer.setBasePackage("librarySystem.dao");
        configurer.setSqlSessionFactoryBeanName("sqlSessionFactory");
        return configurer;
    }
}
