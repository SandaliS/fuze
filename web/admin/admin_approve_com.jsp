<%-- 
    Document   : admin_approve_com
    Created on : Jul 15, 2018, 7:37:36 PM
    Author     : Saroj
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="controller.DB"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="admin_header.jsp"/>
    </head>
    <body>
        <section id="content-3-6" class="content-block content-3-6" wp-cz-section="blocks_content_3_6" wp-cz-section-title="Content 3-6" wp-cz-control="blocks_content_3_6_source" wp-cz-control-label="Content source" wp-cz-control-type="custom" wp-cz-control-type-custom="WP_BlocksContentDropdown_Customize_Control" wp-cz-control-section="blocks_content_3_6">
            <div class="container">
                <div class="row">
                    <!-- Feature Box 1 -->
                    <%try {
                            ResultSet rs = DB.search("SELECT *FROM `company` WHERE `approved` = '0'");
                            while (rs.next()) {
                    %>
                    <form action="../admin_approve_comp" method="GET">
                    <div class="col-sm-4 col-xs-12" style="background-color: white;" wp-loop="blocks" wp-loop-post_parent="get_theme_mod('blocks_content_3_6_source')" wp-loop-post-type-custom="blocks_content" wp-loop-post-status="publish" wp-loop-nopaging="true" wp-loop-order="ASC" wp-loop-orderby="menu_order" wp-loop-clear-columns>
                        <div class="feature-box">
                            <div class="icon">
                                <span class="fa fa-pencil" wp-meta-value wp-meta-value-key="icon" wp-meta-value-set="attr" wp-meta-value-set-attr="class" wp-meta-value-set-attr-append="true" wp-remove-class="fa-pencil"></span>
                            </div>

                            <h3 wp-the-title>Company Number : <%=rs.getString(1)%></h3>
                            <h3 wp-the-title>Company Name : <%=rs.getString(2)%></h3>
                            <h3 wp-the-title>Company email : <%=rs.getString(3)%></h3>
                            <h3 wp-the-title>Company contact : <%=rs.getString(4)%></h3>
                            <h3 wp-the-title>Company username : <%=rs.getString(5)%></h3>
                            <a href="../admin_approve_comp?comid=<%= rs.getString(1) %>" class="btn btn-outline btn-outline outline-dark" wp-cz-control="blocks_content_3_10_button_label" wp-cz-control-label="Button Label" wp-cz-control-section="blocks_content_3_10" wp-cz-theme-mod="blocks_content_3_10_button_label" wp-cz-control-2="blocks_content_3_10_button_link" wp-cz-control-label-2="Button Link" wp-cz-control-section-2="blocks_content_3_10" wp-cz-theme-mod-attr="blocks_content_3_10_button_link" wp-cz-theme-mod-attr-set-attr="href">Approve</a>
                      
                        </div>
                    </div>
                    </form>
                    <!-- Feature Box 2 -->
                    <!-- Feature Box 3 -->
                    <%}
                        } catch (Exception e) {
                        }%>
                </div>
                <!-- Row Ends -->
            </div>

            <!-- Container Ends -->
        </section>

    </body>
</html>
