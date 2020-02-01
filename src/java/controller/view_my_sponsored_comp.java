
package controller;

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


@WebServlet(name = "view_my_sponsored_comp", urlPatterns = {"/view_my_sponsored_comp"})
public class view_my_sponsored_comp extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
             HttpSession session = request.getSession();
             String name = session.getAttribute("name").toString();
            List<projectbean> pd = progectdetails(name);
            request.setAttribute("progects", pd);
             RequestDispatcher r = request.getRequestDispatcher("viewsponsored.jsp");
            r.forward(request, response);
          
        } catch (Exception ex) {
            Logger.getLogger(listidea.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

 public List<projectbean> progectdetails(String name) throws Exception {
        ArrayList<projectbean> progs = new ArrayList<projectbean>();
//        String cid = "";
//        ResultSet search = DB.search("SELECT * FROM `company` WHERE `uname` = '"+name+"'");
//        if (search.next()) {
//         cid = search.getString(1);
//     }
        ResultSet rs = DB.search("SELECT * FROM `projects`,`projects_has_company`,`company` WHERE `projects`.`pid` = `projects_has_company`.`projects_pid` AND `projects_has_company`.`company_cid` = `company`.`cid` AND `company`.`uname` = '"+name+"'");
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
