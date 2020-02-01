<%-- 
    Document   : uni_add_event
    Created on : Jul 8, 2018, 3:53:03 PM
    Author     : Saroj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Uni_header.jsp" />
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
                            <h1 wp-cz-control="blocks_header_3_title" wp-cz-control-label="Title" wp-cz-control-section="blocks_header_3" wp-cz-theme-mod="blocks_header_3_title">Create Event</h1>
                        </div>
                        <div class="editContent">
                            <p class="lead" wp-cz-control="blocks_header_3_text" wp-cz-control-label="Text" wp-cz-control-type="textarea" wp-cz-control-section="blocks_header_3" wp-cz-theme-mod="blocks_header_3_text">Step 1 of 3</p>
                            <form name="myform" role="form" action="unievent_controller" method="POST" > 
                                <div class="form-group"> 
                                    <label class="control-label" for="exampleInputEmail1">title</label>                                     
                                    <input type="text" name="title" class="form-control" id="exampleInputEmail1" placeholder="Enter title" required="required"> 
                                </div>  
                                 <div class="form-group"> 
                                    <label class="control-label" for="exampleInputEmail1">type</label>                                     
                                    <input type="text" name="type" class="form-control" id="exampleInputEmail1" placeholder="Enter type" required="required"> 
                                </div> 
                                <div class="form-group"> 
                                    <label class="control-label" for="exampleInputEmail1">Contact Number</label>                                     
                                    <input type="numeber" name="cnum" class="form-control" id="exampleInputEmail1" placeholder="Enter contact number" required="required"> 
                                </div>   
                                 <div class="form-group"> 
                                    <label class="control-label" for="exampleInputEmail1">Location name</label>                                     
                                    <input type="text" name="location" class="form-control" id="exampleInputEmail1" placeholder="Location" required="required"> 
                                </div> 
                                <div class="form-group" data-pg-collapsed> 
                                    <label class="control-label" for="formInput26">Address</label>     

                                    <textarea name="address" class="form-control" rows="3" id="formInput26" placeholder="Address" required="required"></textarea>
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label" for="exampleInputEmail1">Start date</label>                                     
                                    <input type="date" name="startdate" class="form-control" id="exampleInputEmail1" placeholder="startdate" required="required"> 

                                    <label class="control-label" for="exampleInputEmail1">Start time</label>                                     
                                    <input type="time" name="starttime" class="form-control" id="exampleInputEmail1" placeholder="starttime" required="required"> 
                                </div> 
                                 <div class="form-group"> 
                                    <label class="control-label" for="exampleInputEmail1">End date</label>                                     
                                    <input type="date" name="enddate" class="form-control" id="exampleInputEmail1" placeholder="enddate" required="required"> 

                                    <label class="control-label" for="exampleInputEmail1">End time</label>                                     
                                    <input type="time" name="endtime" class="form-control" id="exampleInputEmail1" placeholder="endtime" required="required"> 
                                </div>
                                  <div class="form-group" data-pg-collapsed> 
                                    <label class="control-label" for="formInput26">Description</label>     

                                    <textarea name="desc" class="form-control" rows="3" id="formInput26" placeholder="decription of your event" required="required"></textarea>
                                </div>
                                                               
                                                               
                                <button type="submit" class="btn btn-info">Proceed</button>                                 
                            </form>
                        </div>
                    </div>
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
