package controller;

import beans.userbean;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "user_login_control", urlPatterns = {"/user_login_control"})
public class user_login_control extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            userbean ub = new userbean();
            ub.setUsername(request.getParameter("uname"));
            ub.setPassword(request.getParameter("pass"));
            
            String pass = ub.getPassword();
            String uname = ub.getUsername();
            
            HttpSession session = request.getSession();
            session.setAttribute("name", uname);
            
            String sql = "SELECT * FROM `user` WHERE `un` = '" + uname + "' AND `ps` = '" + pass + "'";
            ResultSet search = DB.search(sql);
            if (search.next()) {
                response.sendRedirect("index2.jsp?name="+uname+"");
            } else {
                response.sendRedirect("loginfail.jsp");
            }
        } catch (Exception ex) {
            Logger.getLogger(user_login_control.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
