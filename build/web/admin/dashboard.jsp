<%@page import="controller.DB"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html> 
<html lang="en" style="height:100%;">
    <head> 
        <jsp:include page="admin_header.jsp"/>       
    </head>     
    <body data-spy="scroll" data-target="nav">
        <section id="content-3-5" class="content-block content-3-5">
            <div class="container">
                <div class="row">
                    <!-- Feature Box 1 -->
                    <div class="col-md-6 col-xs-12 col-xs-12">
                        <div class="feature-box">
                            <div class="icon">
                                <span class="fa fa-pencil"></span>
                            </div>
                            <h3>Requested Companies</h3>



                            <%try {
                                    ResultSet rs = DB.search("SELECT COUNT(*) FROM `company` WHERE `approved` = '0'");
                                    while (rs.next()) {
                            %>
                            <h3><%= rs.getString(1) %></h3> <a href = "admin_approve_com.jsp" class="btn btn-outline btn-outline outline-light">Try the demo</a>
                            <%}
                    } catch (Exception e) {
                    }%>


                        </div>
                    </div>
                    <div class="col-md-6 col-xs-12 col-xs-12">
                        <div class="feature-box">
                            <div class="icon">
                                <span class="fa fa-pencil"></span>
                            </div>
                            <h3>Requested Universities</h3>
                            

                            <%try {
                                    ResultSet rss = DB.search("SELECT COUNT(*) FROM `university` WHERE `approved` = '0'");
                                    while (rss.next()) {
                            %>
                            <h3><%= rss.getString(1) %></h3> <a href = "admin_approve_uni.jsp" class="btn btn-outline btn-outline outline-light">Try the demo</a>
                            <%}
                    } catch (Exception e) {
                    }%>
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-12 col-xs-12">
                        <div class="feature-box">
                            <div class="icon">
                                <span class="fa fa-pencil"></span>
                            </div>
                            <h3>Company Events</h3>
                               <%try {
                                    ResultSet rsss = DB.search("SELECT COUNT(*) FROM `comp_event`");
                                    while (rsss.next()) {
                            %>
                            <h3><%= rsss.getString(1) %></h3> <a href = "admin_approve_uni.jsp" class="btn btn-outline btn-outline outline-light">Try the demo</a>
                            <%}
                    } catch (Exception e) {
                    }%>
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-12 col-xs-12">
                        <div class="feature-box">
                            <div class="icon">
                                <span class="fa fa-pencil"></span>
                            </div>
                            <h3>University Events</h3>
                               <%try {
                                    ResultSet rssss = DB.search("SELECT COUNT(*) FROM `uni_event`");
                                    while (rssss.next()) {
                            %>
                            <h3><%= rssss.getString(1) %></h3> <a href = "admin_approve_uni.jsp" class="btn btn-outline btn-outline outline-light">Try the demo</a>
                            <%}
                    } catch (Exception e) {
                    }%>
                        </div>
                    </div>
                    <!-- Feature Box 2 -->
                    <!-- Feature Box 3 -->
                    <!-- Feature Box 4 -->
                </div>
                <!-- Row Ends -->
            </div>
            <!-- Container Ends -->
        </section>
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>         
        <script type="text/javascript" src="js/bootstrap.min.js"></script>         
        <script type="text/javascript" src="js/plugins.js"></script>
        <script src="https://maps.google.com/maps/api/js?sensor=true"></script>
        <script type="text/javascript" src="js/bskit-scripts.js"></script>         
    </body>     
</html>
