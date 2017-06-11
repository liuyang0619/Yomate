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
<link href="<c:url value="${path}/ressources/css/bootstrap-social.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/yomate-style.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/buttons.css" />" rel="stylesheet" type="text/css" media="all" />

<!-- js -->
<script src=<c:url value="${path}/ressources/js/jquery-1.11.1.min.js" /> ></script>
<script src=<c:url value="${path}/ressources/js/bootstrap.js" /> ></script>
<script src=<c:url value="${path}/ressources/js/yomate.js" /> ></script>
<!-- //js -->

<!-- initAutocomplete -->
<script>
function initAutocomplete() {
	autocomplete = new google.maps.places.Autocomplete((document.getElementById('search-city')), {
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

<!-- login -->
<script type="text/javascript">
function GetRequestResult(id, remember) {
	if (id != "") {
		if (id == "NonValid") {
			alert("Email ou mot de passe incorrect. VÃ©rifiez, svp.");
		} else {
			// Set user session
			if (remember) {
				setCookie("idUser", id, 7);
			} else {
				setCookie("idUser", id, 0.5);
			}
			// reload to index page
	   		window.location.href = "/Yomate/index.jsp";
		}
	}
}
</script>
<!-- //login -->

<script type="text/javascript">
function search() {
	var city = document.getElementById("search-city").value;
	if (city != "") {
    	var res = city.split(",");
    	searchcity(res[0].toLowerCase());
    }
}

function searchcity(city) {
	var user = getCookie("idUser");
    if (user == "") {
    	$('#header #login').modal('show');
    } else {
    	if (city != "") {
    		post('search/city/' + city);
        }
    }
}

</script>

<body>
	<script type="text/javascript">
		GetRequestResult('${idUser}', '${remember}');
	</script>
	<!-- header -->
	<div id="header" class="bottom-margin-0"></div>
	<!-- //header -->
	
	<!-- video background -->
	<div class="video-container top-margin-0">
	   <div align="center" class="embed-responsive embed-responsive-16by9">
		    <video autoplay loop class="embed-responsive-item" poster="/Yomate/ressources/videos/video-image.jpg">
		        <source src="/Yomate/ressources/videos/video-background.mp4" type=video/mp4>
		    </video>
		</div>
	     <div class="overlay-desc">
	     	<div class ="container">
		        <div class="row">
		        	<div class="col-md-12 home-text">Trouvez votre colocataire id�al</div>
		        </div>
		        <div class="row top-margin-20">
			        <div class="col-md-12 input-group"
						style="margin-top: 0px; positon: relative; margin-bottom: 80px">
						<input type="text" id="search-city" class="form-control"
							placeholder="Nom de ville" autocomplete="on"> 
						<span class="input-group-btn">
							<button class="btn button-action btn-search" onclick="search()">Recherche</button>
						</span>
					</div>
				</div>
	     	</div>
	     </div>
	</div>
	<!-- //video background -->
	
	<!-- page content -->
	<div class="container-fluid">	
		<!-- research -->		
		<div class="row index-search">
			<div class="row bottom-margin-20">
				<div class="col-md-12 banner-info-left text-center">
					<h2>Les villes populaires</h2>
				</div>
			</div>
			<div class="row bottom-margin-20" style="text-align: center;">
				<span class=" index-span col-md-12 text-center"> <span
					class=" index-span " style="padding-right: 20px"> <a
						style="cursor: pointer;" onclick="searchcity('paris')">Paris</a>
				</span> <span class="index-span" style="padding-right: 20px"> <a
						style="cursor: pointer;" onclick="searchcity('lyon')">Lyon</a>
				</span> <span class="index-span " style="padding-right: 20px"> <a
						style="cursor: pointer;" onclick="searchcity('toulouse')">Toulouse</a>
				</span> <span class="index-span " style="padding-right: 20px"> <a
						style="cursor: pointer;" onclick="searchcity('compiegne')">Compi�gne</a>
				</span>
				</span>
			</div>
		</div>
		<!-- //researche  -->
		<!-- introduction of users  -->
		<div class="index-utilisateurs row">
			<div class="text-center col-md-12">
				<span class="red ">5729</span> <span> colocataires recherchant une colocation - France</span>
			</div>
			<div class="col-md-12 clearfix" style="text-align: center;">
				<div class="col-md-3 inline-block">
					<img src="/Yomate/ressources/images/Oksana.jpg" class="img"
						style="width: 70px; height: 70px">
					<div class="row">
						<p style="font-weight: bolder; font-size: 12px">Oksanae</p>
						<p style="font-size: 12px">Femme, 19 ans</p>
						<p style="font-size: 12px">Nous somme un couple de futur �tudiants de Clermont-Ferrand qui recherchons une 
							chambre id�alement dans un 1er �tage/RDC</div>
				</div>

				<div class="col-md-3 inline-block">
					<img src="/Yomate/ressources/images/Morgane.jpg" class="img"
						style="width: 70px; height: 70px">
					<div class="row">
						<p style="font-weight: bolder; font-size: 12px">Morgane</p>
						<p style="font-size: 12px">Femme, 20 ans</p>
						<p style="font-size: 12px">Bonjour tout le monde,
							je reprend les cours à Lille en septembre et je recherche une colocation avec des personnes sympa. 
							Je souhaiterais emm�nager en ao�t et rester pour un peu plus de 6 mois.</p>
					</div>
				</div>
				<div class="col-md-3 inline-block">
					<img src="/Yomate/ressources/images/Sara.jpg" class="img"
						style="width: 70px; height: 70px">
					<div class="row">
						<p style="font-weight: bolder; font-size: 12px">Sara</p>
						<p style="font-size: 12px">Femme, 28 ans</p>
						<p style="font-size: 12px">Bonjour, Je m'appelle Sara, je cherche une chambre dans une colocation avec un loyer de 600 euro. 
							Si mon profil vous int�resse, envoyez moi un Message Flash ou un email. Merci, Sara</p>
					</div>
				</div>
				<div class="col-md-3 inline-block">
					<img src="/Yomate/ressources/images/Benjy.jpg" class="img"
						style="width: 70px; height: 70px">
					<div class="row">
						<p style="font-weight: bolder; font-size: 12px">Benjy</p>
						<p style="font-size: 12px">Homme, 19 ans</p>
						<p style="font-size: 12px">Bonjour, Je m'appelle Benjy, je cherche une chambre dans une colocation avec un loyer de 600 euro. 
						Si mon profil vous int�resse, envoyez moi un Message Flash ou un email. Merci, Benjy</p>
					</div>
				</div>
			</div>
		</div>
		<!-- //introduction of users  -->

		<!-- about us  -->
		<div class="row banner-info-left text-center bottom-margin-25">
			<h3>YoMate! Trouvez votre colocataire id�al</h3>
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