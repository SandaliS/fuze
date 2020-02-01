package controller;

import beans.unibean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "unisignin", urlPatterns = {"/unisignin"})
public class unisignin extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            unibean unibean = new unibean();
            
            unibean.setUname(request.getParameter("uname"));
            unibean.setPassword(request.getParameter("pass"));
            
            String uname = unibean.getUname();
            String password = unibean.getPassword();
            
            HttpSession session = request.getSession();
            session.setAttribute("name", uname);
            
            ResultSet rs = DB.search("SELECT * FROM `university` WHERE `uname` ='" + uname + "' AND `pass` ='" + password + "'AND `approved` = '1'");
            if (rs.next()) {
                response.sendRedirect("index4.jsp?message=hello+" + uname + "");                
            } else {
                response.sendRedirect("uniloginfail.jsp");
            }
        } catch (Exception ex) {
            Logger.getLogger(unisignin.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
