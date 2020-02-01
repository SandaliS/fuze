package controller;

import beans.companybean;
import beans.userbean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "company_sign_up", urlPatterns = {"/company_sign_up"})
public class company_sign_up extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int count = 0;
            companybean cb = new companybean();

            cb.setName(request.getParameter("name"));
            cb.setEmail(request.getParameter("email"));
            cb.setCnum(request.getParameter("cnum"));
            cb.setUsername(request.getParameter("uname"));
            cb.setPassword(request.getParameter("pass"));

            String name = cb.getName();
            String email = cb.getEmail();
            String cnum = cb.getCnum();
            String username = cb.getUsername();
            String password = cb.getPassword();

            ResultSet search = DB.search("SELECT COUNT(*) FROM `company`");
            if (search.next()) {
                count += Integer.parseInt(search.getString(1));
            }
            String id = "" + count;

            DB.iud("INSERT INTO `company`(`cid`, `name`, `email`, `contact`, `uname`, `password`) VALUES ('"+id+"','"+name+"','"+email+"','"+cnum+"','"+username+"','"+password+"')");
            response.sendRedirect("comp_login.jsp?message=successfully signed in");
        } catch (Exception ex) {
            PrintWriter writer = response.getWriter();
            writer.print(ex);
        }
    }

}
