package mei.xin.gallery.common;

import mei.xin.gallery.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserUtils {


    public static boolean checklogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");
        if (user != null && user.getUserid() != 0 && (!user.getUsername().equals(null))) {
            request.getSession().setAttribute("username", user.getUsername());
            return true;
        } else {
            return false;
        }
    }

    public static void doLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().invalidate();
    }
}
