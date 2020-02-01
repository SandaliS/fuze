package controller;

import beans.projectbean;
import beans.sponsored_project_bean;
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

@WebServlet(name = "sponsored", urlPatterns = {"/sponsored"})
public class sponsored extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            String name = session.getAttribute("name").toString();
            List<sponsored_project_bean> pd = progectdetails(name);
            request.setAttribute("progects", pd);
            RequestDispatcher r = request.getRequestDispatcher("view_sponsored.jsp");
            r.forward(request, response);
        } catch (Exception ex) {
            PrintWriter writer = response.getWriter();
            writer.print(ex);
        }

    }

    public List<sponsored_project_bean> progectdetails(String name) throws Exception {
        ArrayList<sponsored_project_bean> progs = new ArrayList<sponsored_project_bean>();
        String id = "";
        
        try {

            ResultSet search = DB.search("SELECT `id` FROM `user` WHERE `un` = '" + name + "'");
            if (search.next()) {
                id = search.getString("id");
            }
           
                ResultSet spor = DB.search("SELECT * FROM `projects_has_company`,projects,company WHERE projects.pid = projects_has_company.projects_pid AND projects_has_company.company_cid = company.cid AND projects.user_id ='"+id+"'");
                while (spor.next()) {
                    sponsored_project_bean spb = new sponsored_project_bean();

                    spb.setProgid(spor.getString(1));
                    spb.setCompid(spor.getString(2));
                    spb.setCompname(spor.getString(12));
                    spb.setMoney(spor.getString(3));
                    spb.setDescription(spor.getString(4));
                    spb.setP_name(spor.getString(6));
                    spb.setP_type(spor.getString(7));
                    spb.setP_desc(spor.getString(8));
                    progs.add(spb);

                }

            

        } catch (Exception ex) {
            Logger.getLogger(sponsored.class.getName()).log(Level.SEVERE, null, ex);
        }
        return progs;
    }
}
