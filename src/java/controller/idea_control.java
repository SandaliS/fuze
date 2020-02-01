package controller;

import beans.ideabean;
import beans.userbean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "idea_control", urlPatterns = {"/idea_control"})
public class idea_control extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            int count = 0;
            String id = null;
            try {
                ResultSet search = DB.search("SELECT COUNT(*) FROM `projects`");

                if (search.next()) {
                    count += Integer.parseInt(search.getString(1));
                }
                ideabean ib = new ideabean();
                ib.setId("" + count);
                ib.setName(request.getParameter("idea"));
                ib.setType(request.getParameter("type"));
                ib.setDescription(request.getParameter("desc"));

                String username = session.getAttribute("name").toString();
                ResultSet rs = DB.search("SELECT * FROM `user` WHERE `un` = '" + username + "'");
                if (rs.next()) {

                    id = rs.getString("id");

                }

                if (!ib.getDescription().equals("") && !ib.getName().equals("")) {

                    DB.iud("INSERT INTO `projects`(`pid`, `name`, `type`, `description`, `user_id`) VALUES ('" + ib.getId() + "','" + ib.getName() + "','" + ib.getType() + "','" + ib.getDescription() + "','" + id + "');");

                    response.sendRedirect("ideahub.jsp?message=successfully inserted");

                } else {

                    response.sendRedirect("ideahub.jsp?message=oops something went bad");
                }
            } catch (Exception ex) {

            }

        } else {
            response.sendRedirect("login.jsp");
        }
    }

}
