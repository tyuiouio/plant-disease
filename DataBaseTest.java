package mei.xin.gallery.common;

import mei.xin.gallery.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DataBaseTest {
    public static void main(String[] args) throws SQLException {

        String sql = null;
        Connection conn = DataBaseUtils.getConnection();
        PreparedStatement pstmt = null;

        sql = "insert into user(username,password) values(?,?)";
        pstmt = conn.prepareStatement(sql);
//      pstmt.setInt(1, 3);
        pstmt.setString(1, "555");
        pstmt.setString(2, "555");
        pstmt.executeUpdate();

        Statement s = conn.createStatement();
        s.execute("insert into user(username) values('" + "555" + "')");
        System.out.println("执行插入语句成功");

        sql = "select * from user";
        List<User> userList = new ArrayList<>();
        pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            int userid = rs.getInt("userid");
            String username = rs.getString("username");
            String password = rs.getString("password");
            String usertoken = rs.getString("usertoken");
            User user = new User(username, password);
            userList.add(user);
        }
        System.out.println("size:" + userList.size());
        for (int i = 0; i < userList.size(); i++) {
            System.out.println(userList.get(i).toString());
        }

    }
}
