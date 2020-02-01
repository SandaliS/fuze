package controller;

import beans.sponsorbean;
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

@WebServlet(name = "sonsor_control", urlPatterns = {"/sonsor_control"})
public class sonsor_control extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = "";
        try {
            HttpSession session = request.getSession();
            String name = session.getAttribute("name").toString();

            ResultSet rs = DB.search("SELECT `cid` FROM `company` WHERE `uname` = '" + name + "'");
            if (rs.next()) {
                id = rs.getString(1);

            }
            sponsorbean sb = new sponsorbean();
            sb.setCompid(id);
            sb.setProjectid(request.getParameter("progid"));
            sb.setMoney(request.getParameter("money"));
            sb.setDescription(request.getParameter("desc"));

            String projectid = sb.getProjectid();
            String compid = sb.getCompid();
            String money = sb.getMoney();
            String description = sb.getDescription();

            DB.iud("INSERT INTO `projects_has_company`(`projects_pid`, `company_cid`, `money`, `description`) VALUES ('" + projectid + "','" + compid + "','" + money + "','" + description + "')");
            DB.iud("UPDATE `projects` SET `sponsored`='1' WHERE `pid` = '" + projectid + "'");
            response.sendRedirect("listidea?message=successfully sponsored");
        } catch (Exception ex) {
            
        }

    }

}
