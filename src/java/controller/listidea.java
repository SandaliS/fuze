package controller;

import beans.projectbean;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "listidea", urlPatterns = {"/listidea"})
public class listidea extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<projectbean> pd = progectdetails();
            request.setAttribute("progects", pd);
            RequestDispatcher r = request.getRequestDispatcher("ideapage.jsp");
            r.forward(request, response);
            String message = request.getAttribute("message").toString();
             response.sendRedirect("ideapage.jsp?message="+message+"");
        } catch (Exception ex) {
            Logger.getLogger(listidea.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<projectbean> progectdetails() throws Exception {
        ArrayList<projectbean> progs = new ArrayList<projectbean>();

        ResultSet rs = DB.search("SELECT * FROM `projects`");
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
