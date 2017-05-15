<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Yomate!</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Yomate" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- //for-mobile-apps -->
<link href="ressources/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="ressources/css/yomate-style.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="ressources/css/buttons.css" rel="stylesheet" type="text/css"
	media="all" />

<!-- js -->
<script src="ressources/js/jquery-1.11.1.min.js"></script>
<script src="ressources/js/bootstrap.js">
	
</script>
<!-- //js -->

<!-- header & footer -->
<script type="text/javascript">
	$(function() {
		$("#header").load("header_index.jsp");
		$("#footer").load("footer.jsp");
	});
</script>
<!-- //header & footer -->
<body>
	<!-- header -->
	<div id="header"></div>
	<!-- //header -->
	<!-- page content -->
	<div class="container">
		<!-- researche  -->
		<div class="col-md-12" >
			<div class="col-md-12 banner-info-left " style="margin-bottom:25px; margin-top:200px;">
				<h1>Trouvez votre colocataire ideal</h1>
			</div>
			<div class="  input-group" style="margin-top: 0px; positon:relative; margin-bottom:100px">
				<input type="text" class=" form-control" placeholder="postal,ville">
				<span class="input-group-btn">
					<button class="btn btn-info btn-search">Recherche</button>
				</span>
			</div>
			<div class="row bottom-margin-20">
				<div class="col-md-12 banner-info-left text-center">
					<h2>Les villes populaires</h2>
				</div>
			</div>
			<div class="row bottom-margin-20" style="text-align :center;">
				<span class=" index-span col-md-12 text-center"> <span
					class=" index-span " style="padding-right: 20px"> <a
						href="http://localhost:8080/Yomate/">Paris</a>
				</span> <span class="index-span" style="padding-right: 20px">
						<a href="http://localhost:8080/Yomate/">Lyon</a>
				</span> <span class="index-span " style="padding-right: 20px">
						<a href="http://localhost:8080/Yomate/">ile de France</a>
				</span> <span class="index-span " style="padding-right: 20px">
						<a href="http://localhost:8080/Yomate/">Compiegne</a>
				</span>
				</span>
			</div>
		</div>
		<!-- //researche  -->
		<!-- introduction of users  -->
		<div class="index-utilisateurs col-md-12">
			<div class="text-center col-md-12">
				<span class="red ">5729 </span> <span> utilisateurs sont a la
					recherche de colocataire </span>
			</div>
			<div class="col-md-12 clearfix" style="text-align:center;">
				<div class="col-md-3 inline-block">
					<img src="ressources/images/4.png" class="img "
						style="width: 70px; height: 70px">
					<div class="row">
						<p style="font-weight: bolder; font-size: 12px">Paul Babiste</p>
						<p style="font-size: 12px">Homme, 23 ans</p>
						<p style="font-size: 12px">Je cherche une colocataire...</p>
					</div>
				</div>

				<div class="col-md-3 inline-block">
					<img src="ressources/images/4.png" class="img"
						style="width: 70px; height: 70px">
					<div class="row">
						<p style="font-weight: bolder; font-size: 12px">Paul Babiste</p>
						<p style="font-size: 12px">Homme, 23 ans</p>
						<p style="font-size: 12px">Je cherche une colocataire...</p>
					</div>
				</div>
				<div class="col-md-3 inline-block">
					<img src="ressources/images/4.png" class="img"
						style="width: 70px; height: 70px">
					<div class="row">
						<p style="font-weight: bolder; font-size: 12px">Paul Babiste</p>
						<p style="font-size: 12px">Homme, 23 ans</p>
						<p style="font-size: 12px">Je cherche une colocataire...</p>
					</div>
				</div>
				<div class="col-md-3 inline-block">
					<img src="ressources/images/4.png" class="img"
						style="width: 70px; height: 70px">
					<div class="row">
						<p style="font-weight: bolder; font-size: 12px">Paul Babiste</p>
						<p style="font-size: 12px">Homme, 23 ans</p>
						<p style="font-size: 12px">Je cherche une colocataire...</p>
					</div>
				</div>
			</div>
		</div>
		<!-- //introduction of users  -->
		<!-- about us  -->
		<div class="col-md-12 banner-info-left text-center">
			<h3>YoMate! Trouvez le colocataire ideal</h3>
		</div>
		<div class="col-md-12 index-nous ">
			<div class="row bottom-margin-20" style="text-align:center;">
				<span class=" index-span "> <span
					class=" index-span " style="padding-right: 30px"> <a
						href="http://localhost:8080/Yomate/">A propose de nous</a>
				</span> <span class="index-span " style="padding-right: 30px">
						<a href="http://localhost:8080/Yomate/">FAQ</a>
				</span> <span class="index-span " style="padding-right: 30px">
						<a href="http://localhost:8080/Yomate/">Contact</a>
				</span> <span class="index-span" style="padding-right: 30px">
						<a href="http://localhost:8080/Yomate/">Politiaue de
							confidentialite</a>
				</span>
				</span>
			</div>
		</div>
		<!-- //about us  -->
	</div>

	<!-- footer -->
	<div id="footer"></div>
	<!-- //footer -->

</body>
</html>