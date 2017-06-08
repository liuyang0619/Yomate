<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>

<html>
<head>
<title>Yomate!</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8" />
<meta name="keywords" content="Yomate" />
<!-- //for-mobile-apps -->
<link href="<c:url value="${path}/ressources/css/bootstrap.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/font-awesome.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/yomate-style.css" />" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src=<c:url value="${path}/ressources/js/jquery-1.11.1.min.js" /> ></script>
<script src=<c:url value="${path}/ressources/js/bootstrap.js" /> ></script>
<script src=<c:url value="${path}/ressources/js/yomate.js" /> ></script>
<!-- //js -->

<!-- header & footer -->
<script type="text/javascript">
	$(function() {
		$("#header").load("/Yomate/header.jsp");
		$("#footer").load("/Yomate/footer.jsp");
	});
</script>
<!-- //header & footer -->

<body>
	<!-- header -->
	<div id="header" class="bottom-margin-0"></div>
	<!-- //header -->
	
	<!-- video background -->
	<div class="video-container top-margin-0">
	   <div align="center" class="embed-responsive embed-responsive-16by9">
		    <video autoplay loop class="embed-responsive-item" poster="/Yomate/ressources/videos/chat-image.png">
		        <source src="/Yomate/ressources/videos/chat-demo.mp4" type=video/mp4>
		    </video>
		</div>
	<!-- //video background -->
	
	<!-- footer -->
	<div id="footer"></div>
	<!-- //footer -->
</body>
</html>