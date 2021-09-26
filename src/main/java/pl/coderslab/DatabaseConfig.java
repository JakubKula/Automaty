package pl.coderslab;

import com.zaxxer.hikari.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import javax.sql.DataSource;

@Configuration
public class DatabaseConfig {

    @Value("jdbc:mysql://localhost:3306/automaty")
    private String dbUrl;

    @Bean
    public DataSource dataSource() {
        HikariConfig config = new HikariConfig();
        config.setUsername("root");
        config.setPassword("coderslab");
        config.setJdbcUrl(dbUrl);
        return new HikariDataSource(config);
    }
}