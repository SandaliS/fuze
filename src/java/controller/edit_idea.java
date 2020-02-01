package controller;

import beans.ideabean;
import beans.projectbean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "edit_idea", urlPatterns = {"/edit_idea"})
public class edit_idea extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String name = session.getAttribute("name").toString();
            List<projectbean> pd = progectdetails(name);
            request.setAttribute("progects", pd);
            RequestDispatcher r = request.getRequestDispatcher("editidea.jsp");
            r.forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(listidea.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            ideabean ib = new ideabean();
            ib.setId(request.getParameter("progid"));
            ib.setName(request.getParameter("idea"));
            ib.setType(request.getParameter("type"));
            ib.setDescription(request.getParameter("desc"));

            if (!ib.getDescription().equals("") && !ib.getName().equals("")) {

                DB.iud("UPDATE `projects` SET `name`='" + ib.getName() + "',`type`='" + ib.getType() + "',`description`='" + ib.getDescription() + "',`sponsored`='0' WHERE `pid` = '" + ib.getId() + "'");
                doGet(request, response);
                response.sendRedirect("editidea.jsp?message=successfully inserted");

            } else {

                response.sendRedirect("editidea.jsp?message=oops something went bad");
            }
        } catch (Exception ex) {

        }

    }

    public List<projectbean> progectdetails(String name) throws Exception {
        String id = "";
        ResultSet rs2 = DB.search("SELECT * FROM `user` WHERE `un` = '" + name + "'");
        if (rs2.next()) {
            id = rs2.getString(1);
        }
        ArrayList<projectbean> progs = new ArrayList<projectbean>();

        ResultSet rs = DB.search("SELECT * FROM `projects` WHERE `sponsored` = '0' AND `user_id` = '" + id + "'");
        while (rs.next()) {
            projectbean pb = new projectbean();

            pb.setProgid(rs.getString(1));
            pb.setName(rs.getString(2));
            pb.setType(rs.getString(3));
            pb.setDescription(rs.getString(4));
            pb.setUid(rs.getString(5));
            progs.add(pb);

        }

        return progs;
    }

}
