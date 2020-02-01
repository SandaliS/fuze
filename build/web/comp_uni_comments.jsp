<%@page import="java.sql.ResultSet"%>
<%@page import="controller.DB"%>
<%@page import="beans.unieventbean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html> 
<html lang="en" style="height:100%;" wp-site wp-site-is-master-page>
    <head> 
        <jsp:include page="Company_header.jsp"/>        
    </head>     
    <body data-spy="scroll" data-target="nav">
           <header id="header-2" class="soft-scroll header-2" wp-cz-section="blocks_header_2" wp-cz-section-title="Header 2">
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <h1>Konnect</h1>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-collapse">
                        <ul class="nav navbar-nav navbar-right" wp-nav-menu="primary" wp-nav-menu-depth="2" wp-nav-menu-type="bootstrap">
                            <li class="nav-item ">
                                <a href="index3.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a href="listidea">view an idea</a>
                            </li>
                            <li class="nav-item">
                                <a href="view_my_sponsored_comp">view sponsored ideas</a>
                            </li>
                            <li class="nav-item">
                                <a href="company_add_event_step_1.jsp">Create an event</a>
                            </li>
                            <li class="nav-item">
                                <a href="view_comp_idea">View my events</a>
                            </li>
                            <li class="nav-item active">
                                <a href="comp_comservlet">View other events</a>
                            </li>
                            <li class="nav-item">
                                <a href="clogout">logout</a>
                            </li>                            
                        </ul>
                    </div>

                </div>
                <!-- /.container-fluid -->
            </nav>
        </header>
        <section class="content-block team-1 team-1-1" wp-cz-section="blocks_team_1_1" wp-cz-section-title="Team 1-1" wp-cz-control="blocks_team_1_1_source" wp-cz-control-label="Content source" wp-cz-control-type="custom" wp-cz-control-type-custom="WP_BlocksContentDropdown_Customize_Control" wp-cz-control-section="blocks_team_1_1">
            <div class="container">
                <div class="row">
                    <%
                        String id = "";
                        String uid = "";
                        ArrayList<unieventbean> posts = (ArrayList<unieventbean>) request.getAttribute("progects");
                        for (unieventbean post : posts) {
                    %>
                    <div class="col-md-12" wp-loop="blocks" wp-loop-clear-columns wp-loop-post_parent="get_theme_mod('blocks_team_1_1_source')" wp-loop-post-type-custom="blocks_content" wp-loop-post-status="publish" wp-loop-nopaging="true" wp-loop-order="ASC" wp-loop-orderby="menu_order">
                        <div class="col-md-12">
                            <img src="uni_images/<%=post.getSavepath()%>" class="img-responsive" alt="Member Image" wp-the-post-thumbnail="large">
                            <div class="team-details">
                                <% id = post.getEid();%>
                                <% uid = post.getEid();%>
                                <input type="hidden" name="uniid" value="<%=post.getUniid()%>" readonly="readonly" />

                                <h4 class="member-name" wp-the-title>Title : <%=post.getTitle()%></h4>
                                <hr>
                                <h4 class="member-name" wp-the-title>Type : <%=post.getType()%></h4>
                                <hr>
                                <h4 class="member-name" wp-the-title>Location : <%=post.getLocation()%></h4>
                                <hr>
                                <h4 class="member-name" wp-the-title>Address : <%=post.getAddress()%></h4>
                                <hr>
                                <h4 class="member-name" wp-the-title>Start :<%=post.getStartdate()%> &nbsp;&nbsp; at : <%=post.getStarttime()%></h4>
                                <hr>
                                <h4 class="member-name" wp-the-title>End : <%=post.getEnddate()%> &nbsp;&nbsp; at : <%=post.getEndtime()%></h4>
                                <hr>
                                <h4 class="member-name" wp-the-title>Description : <%=post.getDesc()%></h4>
                                <hr>

                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </section>
     
            <section class="hero" wp-cz-control="blocks_header_3_bck" wp-cz-control-label="Background image" wp-cz-control-type="media" wp-cz-control-mime-type="image" wp-cz-control-section="blocks_header_3" wp-attachment-bck wp-attachment-bck-theme-mod="blocks_header_3_bck" wp-attachment-bck-size="large">
                <div class="container">
                    <div class="brand">
                        <a href="#" wp-href="url"></a>
                    </div>
                    <div class="navicon">
                    </div>
                    <div class="col-md-8 col-md-offset-2 text-center">

                        <div class="editContent">
                            <p class="lead" wp-cz-control="blocks_header_3_text" wp-cz-control-label="Text" wp-cz-control-type="textarea" wp-cz-control-section="blocks_header_3" wp-cz-theme-mod="blocks_header_3_text">Comments</p>
                            <form role="form" action="comp_comservlet" method="POST"> 
                                <div class="form-group"> 
                                    <input type="hidden" name="eid" value="<%= id%>" />
                                    <input type="hidden" name="uniid" value="<%= uid%>" />
                                    <label class="control-label" for="exampleInputEmail1">Your Comment</label>                                     
                                    <input type="text" name="comment" class="form-control" id="exampleInputEmail1" placeholder="Enter comment"> 
                                </div>                                 

                                <button type="submit" class="btn btn-info">Comment</button>                                 
                            </form>
                        </div>
                    </div>
                </div>
                
            </section>
        
        <section class="content-block team-1 team-1-1" wp-cz-section="blocks_team_1_1" wp-cz-section-title="Team 1-1" wp-cz-control="blocks_team_1_1_source" wp-cz-control-label="Content source" wp-cz-control-type="custom" wp-cz-control-type-custom="WP_BlocksContentDropdown_Customize_Control" wp-cz-control-section="blocks_team_1_1" data-pg-collapsed>
            <div class="container">
                <div class="underlined-title">
                    <h1 wp-cz-control="blocks_team_1_1_title" wp-cz-control-label="Title" wp-cz-control-section="blocks_team_1_1" wp-cz-theme-mod="blocks_team_1_1_title" wp-cz-control-type="textarea">Comments</h1>
                    <hr>
                </div>
                <%try {
                        ResultSet rs = DB.search("SELECT * FROM `user_uni_event_comment`,`user` WHERE `user_uni_event_comment`.`uid` = `user`.`id`"
                                + " AND `user_uni_event_comment`.`eid` = '" + id + "'");
                        while (rs.next()) {
                %>
                <div class="row">
                    <div class="col-sm-12 team-member-wrap" wp-loop="blocks" wp-loop-clear-columns wp-loop-post_parent="get_theme_mod('blocks_team_1_1_source')" wp-loop-post-type-custom="blocks_content" wp-loop-post-status="publish" wp-loop-nopaging="true" wp-loop-order="ASC" wp-loop-orderby="menu_order">
                        <div class="col-lg-12">
                            <div class="team-details">
                                <h4 class="member-name" wp-the-title><%=rs.getString(7)%></h4>
                                <p class="position" wp-meta-value wp-meta-value-key="position" wp-if-get-post-meta="|position"><%=rs.getString(5)%></p>
                                <!-- /.social -->
                            </div>
                        </div>
                    </div>
                    <!-- /.team-member-wrap -->
                    <!-- /.team-member-wrap -->
                    <!-- /.team-member-wrap -->
                </div>
                <!-- /.row -->
                <%}
                     } catch (Exception e) {
                     }%>
                     
                       <%try {
                        ResultSet rss = DB.search("SELECT * FROM `comp_uni_event_comment`,`company` WHERE `comp_uni_event_comment`.`uid` = `company`.`cid`"
                                + " AND `comp_uni_event_comment`.`eid` = '" + id + "'");
                        while (rss.next()) {
                %>
                <div class="row">
                    <div class="col-sm-12 team-member-wrap" wp-loop="blocks" wp-loop-clear-columns wp-loop-post_parent="get_theme_mod('blocks_team_1_1_source')" wp-loop-post-type-custom="blocks_content" wp-loop-post-status="publish" wp-loop-nopaging="true" wp-loop-order="ASC" wp-loop-orderby="menu_order">
                        <div class="col-lg-12">
                            <div class="team-details">
                                <h4 class="member-name" wp-the-title><%=rss.getString(7)%></h4>
                                <p class="position" wp-meta-value wp-meta-value-key="position" wp-if-get-post-meta="|position"><%=rss.getString(5)%></p>
                                <!-- /.social -->
                            </div>
                        </div>
                    </div>
                    <!-- /.team-member-wrap -->
                    <!-- /.team-member-wrap -->
                    <!-- /.team-member-wrap -->
                </div>
                <!-- /.row -->
                <%}
                     } catch (Exception e) {
                     }%>
            </div>
            <!-- /.container -->
        </section>


        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>         
        <script type="text/javascript" src="js/bootstrap.min.js"></script>         
        <script type="text/javascript" src="js/plugins.js"></script>
        <script src="https://maps.google.com/maps/api/js?sensor=true"></script>
        <script type="text/javascript" src="js/bskit-scripts.js"></script>         
    </body>     
</html>
