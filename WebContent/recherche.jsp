<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Page de Recherche</title>

<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Yomate"/>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="ressources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="ressources/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="ressources/css/buttons.css" rel="stylesheet" type="text/css" media="all" />

<!-- js -->
<script src="ressources/js/jquery-1.11.1.min.js"></script>
<!-- //js -->

<!-- FlexSlider -->
<link rel="stylesheet" href="ressources/css/flexslider.css" type="text/css" media="screen" />
<script defer src="ressources/js/jquery.flexslider.js"></script>
<script type="text/javascript">
						$(window).load(function(){
						  $('.flexslider').flexslider({
							animation: "slide",
							start: function(slider){
							  $('body').removeClass('loading');
							}
						  });
						});
					  </script>
<!-- //FlexSlider -->

<!-- header & footer -->
<script type="text/javascript"> 
	$(function(){
		$("#header").load("header.jsp");
		$("#footer").load("footer.jsp");
	});
</script>
<!-- //header & footer -->

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
</head>

<body>
<!-- header -->
	<div id="header"></div>
<!-- //header -->


<!-- footer -->
	<div id="footer"></div>
<!-- //footer -->

<!-- for bootstrap working -->
	<script src="ressources/js/bootstrap.js"> </script>
<!-- //for bootstrap working -->

</body>
</html>