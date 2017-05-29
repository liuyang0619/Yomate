<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Yomate!</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Yomate" />
<!-- //for-mobile-apps -->
<link href="<c:url value="${path}/ressources/css/bootstrap.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/font-awesome.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/bootstrap-social.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/yomate-style.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/buttons.css" />" rel="stylesheet" type="text/css" media="all" />

<!-- js -->
<script src=<c:url value="${path}/ressources/js/jquery-1.11.1.min.js" /> ></script>
<script src=<c:url value="${path}/ressources/js/bootstrap.js" /> ></script>
<!-- //js -->

<!-- initAutocomplete -->
<script>
function initAutocomplete() {
	autocomplete = new google.maps.places.Autocomplete((document
			.getElementById('search-city')), {
		types : [ '(cities)' ],
		componentRestrictions : {
			country : "fr"
		}
	});
}
</script>
<!-- //initAutocomplete -->

<!-- header & footer -->
<script type="text/javascript">
	$(function() {
		$("#header").load("/Yomate/header.jsp");
		$("#footer").load("/Yomate/footer.jsp");
	});
</script>
<!-- //header & footer -->

<!-- search by city -->
<script type="text/javascript">
function search() {
	
}
</script>
<!-- //search by city -->

<body>
	<!-- header -->
	<div id="header"></div>
	<!-- //header -->
	<!-- page content -->
	<div class="container-fluid home-page">
		<!-- research -->
		<div class="row index-search">
			<div class="col-md-12 text-center"
				style="margin-bottom: 25px; margin-top: 80px;">
				<h1>Trouvez votre colocataire ideal</h1>
			</div>
			<div class="input-group"
				style="margin-top: 0px; positon: relative; margin-bottom: 80px">
				<input type="text" id="search-city" class="form-control"
					placeholder="Nom de ville" autocomplete="on"> <span
					class="input-group-btn">
					<button class="btn button-action btn-search" onclick="search()">Recherche</button>
				</span>
			</div>
			<div class="row bottom-margin-20">
				<div class="col-md-12 banner-info-left text-center">
					<h2>Les villes populaires</h2>
				</div>
			</div>
			<div class="row bottom-margin-20" style="text-align: center;">
				<span class=" index-span col-md-12 text-center"> <span
					class=" index-span " style="padding-right: 20px"> <a
						href="http://localhost:8080/Yomate/">Paris</a>
				</span> <span class="index-span" style="padding-right: 20px"> <a
						href="http://localhost:8080/Yomate/">Lyon</a>
				</span> <span class="index-span " style="padding-right: 20px"> <a
						href="http://localhost:8080/Yomate/">ile de France</a>
				</span> <span class="index-span " style="padding-right: 20px"> <a
						href="http://localhost:8080/Yomate/">Compiegne</a>
				</span>
				</span>
			</div>
		</div>
		<!-- //researche  -->
		<!-- introduction of users  -->
		<div class="index-utilisateurs row">
			<div class="text-center col-md-12">
				<span class="red ">5729 </span> <span> utilisateurs sont a la
					recherche de colocataire </span>
			</div>
			<div class="col-md-12 clearfix" style="text-align: center;">
				<div class="col-md-3 inline-block">
					<img src="/Yomate/ressources/images/4.png" class="img "
						style="width: 70px; height: 70px">
					<div class="row">
						<p style="font-weight: bolder; font-size: 12px">Paul Babiste</p>
						<p style="font-size: 12px">Homme, 23 ans</p>
						<p style="font-size: 12px">Je cherche une colocataire...</p>
					</div>
				</div>

				<div class="col-md-3 inline-block">
					<img src="/Yomate/ressources/images/4.png" class="img"
						style="width: 70px; height: 70px">
					<div class="row">
						<p style="font-weight: bolder; font-size: 12px">Paul Babiste</p>
						<p style="font-size: 12px">Homme, 23 ans</p>
						<p style="font-size: 12px">Je cherche une colocataire...</p>
					</div>
				</div>
				<div class="col-md-3 inline-block">
					<img src="/Yomate/ressources/images/4.png" class="img"
						style="width: 70px; height: 70px">
					<div class="row">
						<p style="font-weight: bolder; font-size: 12px">Paul Babiste</p>
						<p style="font-size: 12px">Homme, 23 ans</p>
						<p style="font-size: 12px">Je cherche une colocataire...</p>
					</div>
				</div>
				<div class="col-md-3 inline-block">
					<img src="/Yomate/ressources/images/4.png" class="img"
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
		<div class="row banner-info-left text-center bottom-margin-20">
			<h3>YoMate! Trouvez votre colocataire ideal</h3>
		</div>
		<!-- //about us  -->
	</div>

	<!-- footer -->
	<div id="footer"></div>
	<!-- //footer -->

	<!-- for autoComplete working -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDBYWCDw3df4KmbFKZ-9e51hPizIipPnlM&libraries=places&callback=initAutocomplete"
		async defer></script>
	<!-- //for autoComplete working -->

</body>
</html>