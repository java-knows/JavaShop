package utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import java.util.Properties;


public class DataSourceUtils {
    private static  String DRIVER_CLASS;
    private static  String JDBC_URL;
    private static  String USER;
    private static  String PASSWORD;
    private static Properties pro = new Properties();
    static {
        try{

            pro.load(DataSourceUtils.class.getClassLoader().getResourceAsStream("jdbc.properties"));
            DRIVER_CLASS = pro.getProperty("m_driver");
            JDBC_URL = pro.getProperty("m_url");
            USER = pro.getProperty("m_username");
            PASSWORD = pro.getProperty("m_password");
            Class.forName(DRIVER_CLASS);
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    private static DataSource ds;

    static {
        try {
            ComboPooledDataSource cpds = new ComboPooledDataSource();
            cpds.setDriverClass(DRIVER_CLASS);
            cpds.setJdbcUrl(JDBC_URL);
            cpds.setUser(USER);
            cpds.setPassword(PASSWORD);
            ds = cpds;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error initializing data source", e);
        }
    }

    private DataSourceUtils() {
    }

    public static DataSource getDataSource() {
        return ds;
    }

    public static Connection getConnection() throws SQLException {
        return ds.getConnection();
    }
}
