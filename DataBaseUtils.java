package mei.xin.gallery.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DataBaseUtils {

    private static DataSource ds=null;
    private static String driverClass=null;
    private static String url=null;
    private static String username=null;
    private static String password=null;

    static
    {
        try
        {
            Context context = new InitialContext();
            ds = (DataSource) context.lookup("java:comp/env/jdbc/library");
        } catch (NamingException e) {
            try
            {
                //加载数据库配置文件
                Properties properties =new Properties();
                properties.load(DataBaseUtils.class.getResourceAsStream("db.properties"));
                driverClass=properties.getProperty("driverClass");
                url=properties.getProperty("url");
                username=properties.getProperty("username");
                password=properties.getProperty("password");

                //注册数据库驱动程序
                Class.forName(driverClass);

            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }
    }

    public static Connection getConnection()
    {
        Connection conn=null;
        try
        {
            if(ds!=null)
                conn = ds.getConnection();
            else
                conn = DriverManager.getConnection(url,username,password);

        } catch (SQLException e) {
            System.out.println("获取Connection时异常!");
        }
        return conn;
    }


    public static void relaseResouce(ResultSet rs,Statement st,Connection con)
    {
        try
        {
            if(rs!=null)
                rs.close();

            if(st!=null)
                st.close();

            if(con!=null)
                con.close();
        } catch (SQLException e1)
        {
            e1.printStackTrace();
        }
    }


}

