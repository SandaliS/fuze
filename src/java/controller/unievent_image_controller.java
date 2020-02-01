package controller;

import beans.unieventbean;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "unievent_image_controller", urlPatterns = {"/unievent_image_controller"})
public class unievent_image_controller extends HttpServlet {

    String Eid = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String name = session.getAttribute("name").toString();
        PrintWriter out = response.getWriter();
        File file;
        int MAXSIZE = 1024 * 1024 * 10;
        int MAXFACTSIZE = 1024 * 1024 * 10;
        String path = "C:\\Users\\Saroj\\Documents\\NetBeansProjects\\Konnect\\web\\uni_images";
        String str = "";
        int idd = 0;
        int imid = 0;
        String id = "";

        String type = request.getContentType();
        out.print(type);

        try {
            ResultSet rss = DB.search("SELECT COUNT(`eid`) FROM `uni_event`");
            if (rss.next()) {
                idd += Integer.parseInt(rss.getString(1));
                imid = Integer.parseInt(rss.getString(1));
            }
            id = "" + idd;
            Eid = "" + imid;
        } catch (Exception e) {
        }

        if (type.indexOf("multipart/form-data") >= 0) {
            try {
                id = "" + idd;
                out.print("            multipart data");
                DiskFileItemFactory disFact = new DiskFileItemFactory();
                disFact.setSizeThreshold(MAXFACTSIZE);
                disFact.setRepository(new File("C:\\temp"));
                ServletFileUpload upload = new ServletFileUpload(disFact);
                upload.setSizeMax(MAXSIZE);
                List lis = upload.parseRequest(request);
                Iterator itr = lis.iterator();
                while (itr.hasNext()) {
                    FileItem item = (FileItem) itr.next();
                    out.println(item.isFormField());
                    if (!item.isFormField()) {
                        str = item.getName();

                        str = str.substring(0, 1) + id + "akpid" + str.substring(str.indexOf("."));
                        out.print(str);
                        file = new File(path, str);
                        item.write(file);
                        out.print("--------------uploaded");
                    }
                }

                out.print("           " + Eid);

                String query = "UPDATE `uni_event` SET `savepath` = '" + str + "' WHERE `eid` = '" + Eid + "'";
                DB.iud(query);
                doGet(request, response);

            } catch (FileUploadException ex) {

            } catch (Exception ex) {

            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<unieventbean> pd = progectdetails();
            request.setAttribute("progects", pd);
            RequestDispatcher r = request.getRequestDispatcher("uni_add_event_step3.jsp");
            r.forward(request, response);

        } catch (Exception ex) {
            Logger.getLogger(listidea.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<unieventbean> progectdetails() throws Exception {
        ArrayList<unieventbean> progs = new ArrayList<unieventbean>();

        ResultSet rs = DB.search("SELECT * FROM `uni_event` WHERE `eid` = '" + Eid + "'");
        while (rs.next()) {
            unieventbean pb = new unieventbean();
            pb.setEid(rs.getString(1));
            pb.setTitle(rs.getString(2));
            pb.setType(rs.getString(3));
            pb.setCnum(rs.getString(4));
            pb.setLocation(rs.getString(5));
            pb.setAddress(rs.getString(6));
            pb.setStartdate(rs.getString(7));
            pb.setStarttime(rs.getString(8));
            pb.setEnddate(rs.getString(9));
            pb.setEndtime(rs.getString(10));
            pb.setDesc(rs.getString(11));
            pb.setSavepath(rs.getString(14));
            pb.setUniid(rs.getString(15));

            progs.add(pb);

        }

        return progs;
    }

}
