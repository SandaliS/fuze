<%-- 
    Document   : company_add_event_step_2
    Created on : Jul 13, 2018, 9:45:34 PM
    Author     : Saroj
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="beans.unieventbean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Uni_header.jsp" />
    </head>
    <script type="text/javascript">
        function showImage() {
            if (this.files && this.files[0]) {
                var obj = new FileReader();
                obj.onload = function (data) {
                    var image = document.getElementById("image");
                    image.src = data.target.result;
                    image.style.display = "block";
                }
                obj.readAsDataURL(this.files[0]);
            }
        }
    </script>
    <body>
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
                                <a href="index4.jsp">Home</a>
                            </li>
                            <li class="nav-item active">
                                <a href="uni_add_event_step1.jsp">Create an event</a>
                            </li>
                            <li class="nav-item">
                                <a href="viewuniidea">view My event</a>
                            </li>
                            <li class="nav-item">
                                <a href="uni_view_comp_events">View other events</a>
                            </li>
                            
                            <li class="nav-item">
                                <a href="unilogout">logout</a>
                            </li>                            
                        </ul>
                    </div>

                </div>
                <!-- /.container-fluid -->
            </nav>
        </header>
        <section id="content-3-6" class="content-block content-3-6" wp-cz-section="blocks_content_3_6" wp-cz-section-title="Content 3-6" wp-cz-control="blocks_content_3_6_source" wp-cz-control-label="Content source" wp-cz-control-type="custom" wp-cz-control-type-custom="WP_BlocksContentDropdown_Customize_Control" wp-cz-control-section="blocks_content_3_6">
            <div class="container">
                <div class="row">
                    <!-- Feature Box 1 -->
                    <% String x = "";%>
                    <%
                        ArrayList<unieventbean> posts = (ArrayList<unieventbean>) request.getAttribute("progects");
                        for (unieventbean post : posts) {
                    %>
                    <div class="col-sm-4 col-xs-12" style="background-color: white;" wp-loop="blocks" wp-loop-post_parent="get_theme_mod('blocks_content_3_6_source')" wp-loop-post-type-custom="blocks_content" wp-loop-post-status="publish" wp-loop-nopaging="true" wp-loop-order="ASC" wp-loop-orderby="menu_order" wp-loop-clear-columns>
                        <div class="feature-box">
                            <div class="icon">
                                <span class="fa fa-pencil" wp-meta-value wp-meta-value-key="icon" wp-meta-value-set="attr" wp-meta-value-set-attr="class" wp-meta-value-set-attr-append="true" wp-remove-class="fa-pencil"></span>
                            </div>


                            <h3 wp-the-title>Event Number : <%=post.getEid()%></h3>
                            <h3 wp-the-title>Event title : <%=post.getTitle()%></h3>
                            <h3 wp-the-title>Event type : <%=post.getType()%></h3>
                            <h3 wp-the-title>Event location : <%=post.getLocation()%></h3>
                            <h3 wp-the-title>Event address : <%=post.getAddress()%></h3>
                            <h3 wp-the-title>Event start date : <%=post.getStartdate()%></h3>
                            <h3 wp-the-title>Event start time : <%=post.getStarttime()%></h3>
                            <h3 wp-the-title>Event end date : <%=post.getEnddate()%></h3>
                            <h3 wp-the-title>Event end time : <%=post.getEndtime()%></h3>
                            <h3 wp-the-title>Event description : <%=post.getDesc()%></h3><% x = post.getEid();%>



                        </div>
                    </div>
                    <!-- Feature Box 2 -->
                    <!-- Feature Box 3 -->
                    <%}%>
                </div>
                <!-- Row Ends -->
            </div>

            <!-- Container Ends -->
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
                            <h1 wp-cz-control="blocks_header_3_title" wp-cz-control-label="Title" wp-cz-control-section="blocks_header_3" wp-cz-theme-mod="blocks_header_3_title">Create Event</h1>
                        </div>
                        <div class="editContent">
                            <p class="lead" wp-cz-control="blocks_header_3_text" wp-cz-control-label="Text" wp-cz-control-type="textarea" wp-cz-control-section="blocks_header_3" wp-cz-theme-mod="blocks_header_3_text">Step 2 of 3</p>
                            <form name="myform" role="form" action="unievent_image_controller" method="POST" enctype="multipart/form-data"> 
                                <div class="form-group"> 
                                    <label class="control-label" for="exampleInputEmail1">ID</label>                                     
                                    <input type="hidden" name="id" class="form-control" id="exampleInputEmail1" placeholder="Enter title" required="required" value="<% out.print(x); %>"> 
                                </div>  
                                 <div class="form-group"> 
                                    <label class="control-label" for="exampleInputEmail1">image</label>                                     
                                    <input type="file" name="picture" class="form-control" id="exampleInputEmail1" placeholder="select image" onchange="showImage.call(this)" required="required"> 
                                </div> 
                                <div class="form-group"> 
                                    <label class="control-label" for="exampleInputEmail1">preview</label>                                     
                                    <img src="" class="img-responsive" alt=" Image" style="display: none;" height="200;" id="image"wp-the-post-thumbnail="large">
                                </div>   
                               
                               
                               
                                 
                                                               
                                                               
                                <button type="submit" class="btn btn-info">Proceed</button>
                                <% unieventbean un = new unieventbean();
                            un.setEid(x);%>                                 
                            </form>
                        </div>
                    </div>
                </div>
               
            </section>

    </body>
</html>

