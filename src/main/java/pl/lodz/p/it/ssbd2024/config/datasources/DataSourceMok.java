package pl.lodz.p.it.ssbd2024.config.datasources;

import com.atomikos.jdbc.AtomikosDataSourceBean;
import com.atomikos.jdbc.AtomikosNonXADataSourceBean;
import jakarta.persistence.EntityManagerFactory;
import lombok.RequiredArgsConstructor;
import org.postgresql.xa.PGXADataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;

import java.util.Properties;

@Configuration
@EnableJpaRepositories(
        entityManagerFactoryRef = "entityManagerFactoryMok",
        basePackages = {"pl.lodz.p.it.ssbd2024.mok.repositories"}
)
@RequiredArgsConstructor
public class DataSourceMok {

    private final JpaVendorAdapter jpaVendorAdapter;

    @Value("${driver_classname}")
    private String driverClassName;

    @Value("${url}")
    private String url;

    @Value("${default_transaction_isolation}")
    private int transactionIsolation;

    @Value("${db.mok.username}")
    private String username;

    @Value("${db.mok.password}")
    private String password;

    private AtomikosDataSourceBean dataSource() {
        PGXADataSource PGDataSource = new PGXADataSource();
        if(System.getenv("DATABASE_URL") != null) {
            url = System.getenv("DATABASE_URL");
        }
        PGDataSource.setUrl(url);
        PGDataSource.setUser(username);
        PGDataSource.setPassword(password);

        AtomikosDataSourceBean dataSource = new AtomikosDataSourceBean();
        dataSource.setXaDataSource(PGDataSource);
        dataSource.setUniqueResourceName("mok");
        dataSource.setTestQuery("SELECT 1");
        dataSource.setDefaultIsolationLevel(transactionIsolation);
        return dataSource;
    }

    @Bean
    public EntityManagerFactory entityManagerFactoryMok() {
        AtomikosDataSourceBean dataSource = dataSource();
        LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
        em.setJtaDataSource(dataSource);
        em.setPersistenceUnitName("ssbd02mok");
        em.setPackagesToScan("pl.lodz.p.it.ssbd2024.model");
        em.setJpaVendorAdapter(jpaVendorAdapter);
        Properties properties = PublicProperties.getProperties();
        em.setJpaProperties(properties);
        em.afterPropertiesSet();
        return em.getObject();
    }
}
