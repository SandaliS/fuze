package controller;

import beans.companybean;
import beans.userbean;
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

@WebServlet(name = "company_login_control", urlPatterns = {"/company_login_control"})
public class company_login_control extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            companybean ub = new companybean();
            ub.setUsername(request.getParameter("uname"));
            ub.setPassword(request.getParameter("pass"));

            String pass = ub.getPassword();
            String uname = ub.getUsername();

            HttpSession session = request.getSession();
            session.setAttribute("name", uname);

            String sql = "SELECT * FROM `company` WHERE `uname` ='" + uname + "' AND `password` = '" + pass + "'AND `approved` = '1'";
            ResultSet search = DB.search(sql);
            if (search.next()) {

                response.sendRedirect("index3.jsp?message=hello+" + uname + "");

            } else {
                response.sendRedirect("comp_login_fail.jsp");
            }
        } catch (Exception ex) {
            PrintWriter out = response.getWriter();
            out.print(ex);
        }

    }

}
