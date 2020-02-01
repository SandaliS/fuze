<%-- 
    Document   : signup
    Created on : Jul 5, 2018, 8:49:33 PM
    Author     : Saroj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en" style="height:100%;">
    <head> 
        <jsp:include page="user_header.jsp"/>       
    </head>     
    <body data-spy="scroll" data-target="nav">
        <section id="content-1-3" class="content-block content-1-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="underlined-title">
                            <h1>Every service under one roof</h1>
                            <hr>
                        </div>
                        <div class="services-wrapper">
                            <div class="col-md-4">
                                <div class="icon bg-crete">
                                    <span class="fa fa-user"></span>
                                </div>
                                <h4>Normal User</h4>
                                <a href="user_signup.jsp">
                                    <button type="button" class="btn btn-info">sign up</button>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <div class="icon bg-finn">
                                    <span class="fa fa-university"></span>
                                </div>
                                <h4>University</h4>
                                <a href="unisignup.jsp">
                                    <button type="button" class="btn btn-info">sign up</button>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <div class="icon bg-sunflower">
                                    <span class="fa fa-building"></span>
                                </div>
                                <h4>Company</h4>
                                <a href="comp_sign_up.jsp">
                                    <button type="button" class="btn btn-info">sign up</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container -->
        </section>
                 
    </body>     
</html>

