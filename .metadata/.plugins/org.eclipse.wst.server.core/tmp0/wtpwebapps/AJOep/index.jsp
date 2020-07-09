 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bike Rental Portal</title>
		<!--Bootstrap -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
		<link rel="stylesheet" href="assets/css/styles.css" type="text/css">
		<link rel="stylesheet" href="assets/css/owl.carousel.css" type="text/css">
		<link rel="stylesheet" href="assets/css/owl.transitions.css" type="text/css">
		<link href="assets/css/slick.css" rel="stylesheet">
		<link href="assets/css/bootstrap-slider.min.css" rel="stylesheet">
		<link href="assets/css/font-awesome.min.css" rel="stylesheet">
		<link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/images/favicon-icon/apple-touch-icon-144-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/images/favicon-icon/apple-touch-icon-114-precomposed.html">
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/images/favicon-icon/apple-touch-icon-72-precomposed.png">
		<link rel="apple-touch-icon-precomposed" href="assets/images/favicon-icon/apple-touch-icon-57-precomposed.png">
		<link rel="shortcut icon" href="assets/images/favicon-icon/24x24.png">
		<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
		<title>Biker's Portal</title>
</head>
<body>
			
	 <!-- DataBase -->
	 <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost/bikers_portal_db"  
     user="root"  password=""/>
	 <!-- /DataBase -->
	
	<!-- Header -->
	
	<header>
  	<div class="default-header">
    	<div class="container">
      		<div class="row">
        		<div class="col-sm-3 col-md-2">
          			<div class="logo"> <a href="index.jsp"><img src="assets/images/logg2.png" alt="image"/></a> </div>
        		</div>
        		<div class="col-sm-9 col-md-10">
          			<div class="header_info">
            			<div class="header_widgets">
              <div class="circle_icon"> <i class="fa fa-envelope" aria-hidden="true"></i> </div>
              <p class="uppercase_text">For Support Mail us : </p>
              <a href="mailto:bikersportal@portal.com">bikersportal@portal.com</a> </div>
            <div class="header_widgets">
              <div class="circle_icon"> <i class="fa fa-phone" aria-hidden="true"></i> </div>
              <p class="uppercase_text">Service Helpline Call Us: </p>
              <a href="tel:+91-98765432100">+91-98765432100</a> </div>
            <div class="social-follow">
              <ul>
                <li><a href="https://www.facebook.com/"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.twitter.com/"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.linkedin.com/"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.google.com/"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.instagram.com/"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
              </ul>
            </div>
            
            <c:choose>
            	<c:when test="${ sessionScope.userMail eq null }">
            		<div class="login_btn"> <a href="login.jsp" class="btn btn-xs uppercase" >Login / Register</a> </div>
            	</c:when>
            	<c:otherwise>
            		Welcome To Bike rental portal
            	</c:otherwise>
            </c:choose>
			  </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Navigation -->
  <nav id="navigation_bar" class="navbar navbar-default">
    <div class="container">
      <div class="navbar-header">
        <button id="menu_slide" data-target="#navigation" aria-expanded="false" data-toggle="collapse" class="navbar-toggle collapsed" type="button"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      </div>
      <div class="header_wrap">
        <div class="user_login">
          <ul>
            <li class="dropdown"> <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-circle" aria-hidden="true"></i>
            <sql:query dataSource="${db}" var="result">SELECT FullName FROM tblusers WHERE EmailId='${sessionScope.userMail }'</sql:query>
            <c:forEach var="row" items="${result.rows}"  >
            	<c:out value="${ row.FullName }"/>
            </c:forEach>		
            <i class="fa fa-angle-down" aria-hidden="true"></i></a>
              <ul class="dropdown-menu">
              	<c:choose>
              		<c:when test="${ sessionScope.userMail eq null }">
              			<li><a href="#loginform"  data-toggle="modal" data-dismiss="modal">Profile Settings</a></li>
              			<li><a href="#loginform"  data-toggle="modal" data-dismiss="modal">Update Password</a></li>
           		 		<li><a href="#loginform"  data-toggle="modal" data-dismiss="modal">My Booking</a></li>
            			<li><a href="#loginform"  data-toggle="modal" data-dismiss="modal">Sign Out</a></li>
              		</c:when>
              		<c:otherwise>
              			<li><a href="profile.jsp">Profile Settings</a></li>
          			    <li><a href="update-password.jsp">Update Password</a></li>
            			<li><a href="my-booking.jsp">My Booking</a></li>
            			<li><a href="logout.jsp">Sign Out</a></li>
              		</c:otherwise>
              	</c:choose>
              	
              	</ul>
            </li>
          </ul>
        </div>
        <div class="header_search">
          <div id="search_toggle"><i class="fa fa-search" aria-hidden="true"></i></div>
          <form action="#" method="get" id="header-search-form">
            <input type="text" placeholder="Search..." class="form-control">
            <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
          </form>
        </div>
      </div>
      <div class="collapse navbar-collapse" id="navigation">
        <ul class="nav navbar-nav">
          <li><a href="index.jsp">Home</a>    </li>

          <li><a href="page.jsp?type=aboutus">About Us</a></li>
          <li><a href="bike-listing.jsp">Bike Listing</a>
          <li><a href="page.jsp?type=faqs">FAQs</a></li>
          <li><a href="contact-us.jsp">Contact Us</a></li>

        </ul>
      </div>
    </div>
  </nav>
  <!-- Navigation end -->

</header>
              	
	<!-- /Header -->
		<!-- Banners -->
		<section id="banner" class="banner-section">
		  <div class="container">
		    <div class="div_zindex">
		      <div class="row">
		        <div class="col-md-5 col-md-push-7">
		          <div class="banner_content">
		            <h1>Find Your Perfect bike</h1>
		            <p>We have more than a thousand bikes for you to choose. </p>
		            <a href="bike-listing.jsp" class="btn">Read More <span class="angle_arrow"><i class="fa fa-angle-right" aria-hidden="true"></i></span></a> </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>
		<!-- /Banners -->
		   	 	
   		
		<!-- Resent Cat-->
		<section class="section-padding gray-bg">
  			<div class="container">
    			<div class="section-header text-center">
      				<h2>Find the Best <span>Bike For You</span></h2>
      				<p>You will be able to fully enjoy your holiday and your ride! Any problems? Our passionate team will be happy to help you!! No waste of time during your holidays to find a rental point on the spot! No language barrier, thanks to our multilingual team! At the same price you would pay on the spot! We have best bikes with best deals</p>
   				</div>
 			<div class="row">

	      <!-- Nav tabs -->
	      <div class="recent-tab">
	        <ul class="nav nav-tabs" role="tablist">
	          <li role="presentation" class="active"><a href="#resentnewcar" role="tab" data-toggle="tab">New Bike</a></li>
	        </ul>
	      </div>
	      <!-- Recently Listed New Bikes -->
	      
	      <div class="tab-content">
	        <div role="tabpanel" class="tab-pane active" id="resentnewcar"> 
	        
	         <sql:query dataSource = "${db}" var = "result">
        	    SELECT tblvehicles.VehiclesTitle,tblbrands.BrandName,tblvehicles.PricePerDay,tblvehicles.FuelType,tblvehicles.ModelYear,tblvehicles.id,tblvehicles.SeatingCapacity,tblvehicles.VehiclesOverview,tblvehicles.Vimage1 from tblvehicles join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand;
     	    </sql:query>
	        
	         <c:forEach var = "row" items = "${result.rows}">
	               <div class="col-list-3">
						<div class="recent-car-list">
							<div class="car-info-box"> <a href="vehical-details.php?vhid=${row.id }"><img src="admin/img/vehicleimages/${row.Vimage1}" class="img-responsive" alt="image"></a>
							<ul>
								<li><i class="fa fa-car" aria-hidden="true"></i><c:out value="${row.FuelType }"/></li>
								<li><i class="fa fa-calendar" aria-hidden="true"></i><c:out value="${row.ModelYear }"/> Model</li>
								<li><i class="fa fa-user" aria-hidden="true"></i><c:out value="${row.SeatingCapacity }"/> seats</li>
							</ul>
					</div>
					<div class="car-title-m">
						<h6><a href="vehical-details.jsp?vhid=${row.id }"><c:out value="${row.BrandName }"/> ,<c:out value="${row.VehiclesTitle }"/></a></h6>
						<span class="price"><c:out  value="${ row.PricePerDay }"/> /Day</span>
					</div>
					<div class="inventory_info_m">
						<p><c:out value="${ row.VehiclesOverview}"/></p>
				</div>
			</div>
		</div>
		
		 </c:forEach>
      </div>
    </div>
  </div>
		</section>
<!-- /Resent Cat -->
   		
<!-- Fun Facts-->
<section class="fun-facts-section">
  <div class="container div_zindex">
    <div class="row">
      <div class="col-lg-3 col-xs-6 col-sm-3">
        <div class="fun-facts-m">
          <div class="cell">
            <h2><i class="fa fa-calendar" aria-hidden="true"></i>40+</h2>
            <p>Years In Business</p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-xs-6 col-sm-3">
        <div class="fun-facts-m">
          <div class="cell">
            <h2><i class="fa fa-motorcycle " aria-hidden="true"></i>1000+</h2>
            <p>New Bikes For Sale</p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-xs-6 col-sm-3">
        <div class="fun-facts-m">
          <div class="cell">
            <h2><i class="fa fa-motorcycle " aria-hidden="true"></i>999+</h2>
            <p>Used Bikes For Sale</p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-xs-6 col-sm-3">
        <div class="fun-facts-m">
          <div class="cell">
            <h2><i class="fa fa-user-circle-o" aria-hidden="true"></i>850+</h2>
            <p>Satisfied Customers</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Dark Overlay-->
  <div class="dark-overlay"></div>
</section>
<!-- /Fun Facts-->


<!--Testimonial -->
<section class="section-padding testimonial-section parallex-bg">
  <div class="container div_zindex">
    <div class="section-header white-text text-center">
      <h2>Our Satisfied <span>Customer's Review</span></h2>
    </div>
    <div class="row">
      <div id="testimonial-slider">
   	  		     <sql:query dataSource = "${db}" var = "result">
        	    	SELECT tbltestimonial.Testimonial,tblusers.FullName from tbltestimonial join tblusers on tbltestimonial.UserEmail=tblusers.EmailId where tbltestimonial.status=1;
        	    </sql:query>
        	     <c:forEach var = "row" items = "${result.rows}">
        	     
        	     
        	     	<div class="testimonial-m">
          				<div class="testimonial-img"> <img src="assets/images/cat-profile.png" alt="" /> </div>
          				<div class="testimonial-content">
            				<div class="testimonial-heading">
              					<h5><c:out value="${ row.FullName }"/></h5>
            					<p><c:out value="${ row.Testimonial }"/></p>
         					</div>
        				</div>
        			</div>
			</c:forEach>

      </div>
    </div>
  </div>
  <!-- Dark Overlay-->
  <div class="dark-overlay"></div>
</section>
        	<!-- /Testimonial-->
        	  
 
<!--Back to top-->
<div id="back-top" class="back-top"> <a href="#top"><i class="fa fa-angle-up" aria-hidden="true"></i> </a> </div>
<!--/Back to top-->
 
 
<!-- Footer -->
<footer>
  <div class="footer-top">
    <div class="container">
      <div class="row">

        <div class="col-md-6">
          <h6>About Us</h6>
          <ul>


          <li><a href="page.jsp?type=aboutus">About Us</a></li>
            <li><a href="page.jsp?type=faqs">FAQs</a></li>
            <li><a href="page.jsp?type=privacy">Privacy</a></li>
          <li><a href="page.jsp?type=terms">Terms of use</a></li>
               <li><a href="admin/">Admin Login</a></li>
          </ul>
        </div>

        <div class="col-md-3 col-sm-6">
          <h6>Subscribe Newsletter</h6>
          <div class="newsletter-form">
            <form method="post">
              <div class="form-group">
                <input type="email" name="subscriberemail" class="form-control newsletter-input" required placeholder="Enter Email Address" />
              </div>
              <button type="submit" name="emailsubscibe" class="btn btn-block">Subscribe <span class="angle_arrow"><i class="fa fa-angle-right" aria-hidden="true"></i></span></button>
            </form>
            <p class="subscribed-text">*We send great deals and latest auto news to our subscribed users very week.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="footer-bottom">
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-md-push-6 text-right">
          <div class="footer_widget">
            <p>Connect with Us:</p>
            <ul>
            <li><a href="https://www.facebook.com/"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.twitter.com/"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.linkedin.com/"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.google.com/"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.instagram.com/"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                </ul>
          </div>
        </div>
        <div class="col-md-6 col-md-pull-6">
          <p class="copy-right">Copyright &copy; 2020 Bike Rental Portal. </p>
        </div>
      </div>
    </div>
  </div>
</footer> 
<!-- /Footer -->
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/interface.js"></script>
<!--bootstrap-slider-JS-->
<script src="assets/js/bootstrap-slider.min.js"></script>
<!--Slider-JS-->
<script src="assets/js/slick.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
 
</body>
</html>