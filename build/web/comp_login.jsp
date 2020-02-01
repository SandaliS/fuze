<%-- 
    Document   : login
    Created on : Jun 30, 2018, 10:27:07 AM
    Author     : Saroj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en" style="height:100%;" wp-site wp-site-is-master-page>
    <head> 
        <jsp:include page="Company_header.jsp" />        
    </head>     
    <body data-spy="scroll" data-target="nav">
        <header id="header-3" class="soft-scroll header-3" wp-cz-section="blocks_header_3" wp-cz-section-title="Header 3">
            <nav>
                <div class="container">
                    <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-8 col-xs-offset-2">
                        <nav class="pull">
                           
                        </nav>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </nav>
            <!-- /.nav -->
            <section class="hero" wp-cz-control="blocks_header_3_bck" wp-cz-control-label="Background image" wp-cz-control-type="media" wp-cz-control-mime-type="image" wp-cz-control-section="blocks_header_3" wp-attachment-bck wp-attachment-bck-theme-mod="blocks_header_3_bck" wp-attachment-bck-size="large">
                <div class="container">
                    <div class="brand">
                        <a href="#" wp-href="url"></a>
                    </div>
                    <div class="navicon">
</div>
                    <div class="col-md-8 col-md-offset-2 text-center">
                        <div class="editContent">
                            <h1 wp-cz-control="blocks_header_3_title" wp-cz-control-label="Title" wp-cz-control-section="blocks_header_3" wp-cz-theme-mod="blocks_header_3_title">Konnect</h1>
                        </div>
                        <div class="editContent">
                            <p class="lead" wp-cz-control="blocks_header_3_text" wp-cz-control-label="Text" wp-cz-control-type="textarea" wp-cz-control-section="blocks_header_3" wp-cz-theme-mod="blocks_header_3_text">Company Login to Konnect</p>
                            <form role="form" action="company_login_control" method="POST"> 
                                <div class="form-group"> 
                                    <label class="control-label" for="exampleInputEmail1">Username</label>                                     
                                    <input type="text" name="uname" class="form-control" id="exampleInputEmail1" placeholder="Enter username"> 
                                </div>                                 
                                <div class="form-group"> 
                                    <label class="control-label" for="exampleInputPassword1">Password</label>                                     
                                    <input type="password" name="pass" class="form-control" id="exampleInputPassword1" placeholder="Password"> 
                                </div>                                 
                                <button type="submit" class="btn btn-info">Login</button>                                 
                            </form>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <i style='font-size:30px;' class="fa fa-chevron-left">&nbsp;<a href="index3.jsp">back to home</a></i>
                </div>
            </section>
        </header>
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>         
        <script type="text/javascript" src="js/bootstrap.min.js"></script>         
        <script type="text/javascript" src="js/plugins.js"></script>
        <script src="https://maps.google.com/maps/api/js?sensor=true"></script>
        <script type="text/javascript" src="js/bskit-scripts.js"></script>         
    </body>     
</html>

