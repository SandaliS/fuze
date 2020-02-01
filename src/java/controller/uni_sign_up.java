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

@WebServlet(name = "uni_sign_up", urlPatterns = {"/uni_sign_up"})
public class uni_sign_up extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String uid = "";
            int id = 0;
            unibean unibean = new unibean();
            unibean.setName(request.getParameter("name"));
            unibean.setEmail(request.getParameter("email"));
            unibean.setCnum(request.getParameter("cnum"));
            unibean.setUname(request.getParameter("uname"));
            unibean.setPassword(request.getParameter("pass"));
            ResultSet search = DB.search("SELECT COUNT(`id`) FROM `university`");
            if (search.next()) {
                id += Integer.parseInt(search.getString(1));
            }
            uid = "" + id;
            DB.iud("INSERT INTO `university`(`id`, `name`, `email`, `cnum`, `uname`, `pass`) VALUES ('" + uid + "','" + unibean.getName() + "','" + unibean.getEmail() + "','" + unibean.getCnum() + "','" + unibean.getUname() + "','" + unibean.getPassword() + "')");
            response.sendRedirect("uni_sign_in.jsp?message=successfully signed in");
        } catch (Exception ex) {
            Logger.getLogger(uni_sign_up.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
