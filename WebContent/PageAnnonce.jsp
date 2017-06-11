<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<%-- <spring:url value="ressources/css/animate.css" var="animateCss" /> 
	<spring:url value="ressources/css/bootstrap.css" var="bootstrapCss" />  
	<spring:url value="ressources/css/yomate-style.css" var="yomateCss" />
	<spring:url value="ressources/js/jquery-1.11.1.min.js" var="jqueryJs" /> 
	<spring:url value="ressources/css/flexslider.css" var="flexsliderCss" /> 
	<spring:url value="ressources/js/jquery.flexslider.js" var="jqueryFlexsliderJs" /> 
	<spring:url value="ressources/js/bootstrap.js" var="boostrapJs" /> --%>
	
	
<title>Page d'annonce</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Yomate" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>

<!-- css -->
<link href="<c:url value="${path}/ressources/css/bootstrap.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/yomate-style.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/buttons.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/bootstrap-datetimepicker.min.css" />" rel="stylesheet" type="text/css" media="all" />
<!-- //css -->

<!-- js -->
<script src=<c:url value="${path}/ressources/js/jquery-1.11.1.min.js" /> ></script>
<script src=<c:url value="${path}/ressources/js/bootstrap.js" /> ></script>
<script src=<c:url value="${path}/ressources/js/moment.min.js" /> ></script>
<script src=<c:url value="${path}/ressources/js/bootstrap-datetimepicker.min.js" /> ></script>
<script src=<c:url value="${path}/ressources/js/yomate.js" /> ></script>
<!-- //js -->


<link href='https://fonts.googleapis.com/css?family=UnifrakturMaguntia' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:600,600italic,700,400' rel='stylesheet' type='text/css'>

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
<!-- date debut picker -->
<script type="text/javascript">
$(function () {
    $('#dateDebutPicker').datetimepicker({format: 'YYYY-MM-DD'});
});
</script>

<!-- date fin picker -->
<script type="text/javascript">
$(function () {
    $('#dateFinPicker').datetimepicker({format: 'YYYY-MM-DD'});
});
</script>

<script type="text/javascript"> 
	$(function(){
		$("#header").load("/Yomate/header.jsp");
		$("#footer").load("/Yomate/footer.jsp");
	});
</script>
<!-- //FlexSlider -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css' />



<style>
.switch {
  position: relative;
  display: inline-block;
  width: 120px;
  height: 34px;
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(84px);
}

.on
{
  display: none;
}

.on, .off
{
  color: white;
  position: absolute;
  transform: translate(-50%,-50%);
  top: 50%;
  left: 50%;
  font-size: 10px;
  font-family: Verdana, sans-serif;
}

input:checked+ .slider .on
{display: block;}

input:checked + .slider .off
{display: none;}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>

<!-- editer filtre -->
<script type="text/javascript">
function editerFiltre(){
	var filtre = document.getElementById("filtre");
	filtre.style.display="none";
	document.getElementById("filtreModifiable").style.display="block";
}
</script>
<!-- //editer filtre-->

<!-- check pet -->
<script type="text/javascript">
function checkPet(pet){
	var animal;
	if(pet==="0")
		animal = "non";
	else if(pet==="1")
		animal = "oui";
	return animal;
}
</script>
<!-- check pet -->


<!-- check langue -->
<script type="text/javascript">
function checkLangue(langueValue){
	var langue;
	switch(langueValue) {
    case "27":
    	langue = "français";
        break;
    case "20":
    	langue = "chinois";
        break;
    case "3":
    	langue = "anglais";
        break;
    case "1":
    	langue = "allemand";
        break;
    case "36":
    	langue = "italien";
        break;
    case "73":
    	langue = "autres";
        break;
    default:
    	langue = "autres";
	} 
	return langue;
}
</script>
<!-- check langue -->

<!-- check profession -->
<script type="text/javascript">
function checkProfession(professionValue){
	var profession;
	switch(professionValue) {
    case "39":
    	profession = "étudiant";
    	//alert("profession étudiant");
        break;
    case "69":
    	profession = "salarié";
        break;
    case "68":
    	profession = "retraité";
        break;
    case "13":
    	profession = "autres";
        break;
    default:
    	profession = "autres";
	} 
	return profession;
}
</script>
<!-- check profession -->

<!-- check nationnalite -->
<script type="text/javascript">
function checkNationnalite(nationnaliteValue){
	var nationnalite;
	switch(nationnaliteValue) {
    case "64":
    	nationnalite = "Français";
        break;
    case "41":
    	nationnalite = "Chinois";
        break;
    case "83":
    	nationnalite = "Italien";
        break;
    case "148":
    	nationnalite = "Russe";
        break;
    case "14":
    	nationnalite = "Bahamien";
        break;
    case "196":
    	nationnalite = "autres";
        break;
    default:
    	nationnalite = "autres";
	} 
	return nationnalite;
}
</script>
<!-- check nationnalite -->

<!-- check loisir -->
<script type="text/javascript">
function checkLoisir(loisirValue) {
	var loisir;
	switch(loisirValue) {
    case "2":
    	loisir = "voyage";
        break;
    case "3":
    	loisir = "sport";
        break;
    case "5":
    	loisir = "cuisine";
        break;
    case "19":
    	loisir = "jeux vidéo";
        break;
    case "9":
    	loisir = "lecture";
        break;
    case "35":
    	loisir = "autres";
        break;
    default:
    	loisir = "autres";
	} 
	return loisir;
}
</script>
<!-- //check loisir -->
<!-- check sex -->
<script type="text/javascript">
function checkSex(strSex) {
	var sexe;
	if (strSex === "0")
	{
		sexe = "homme";
	}
	else if (strSex === "1")
	{
		sexe = "femme";
	}
	return sexe;
}
</script>
<!-- //check sex -->

<!-- calculate age -->
<script type="text/javascript">
/*æ ¹æ®åºçæ¥æç®åºå¹´é¾*/
function jsGetAge(strBirthday) {var returnAge;
			var strBirthdayArr = strBirthday.split("-");
			var birthYear = strBirthdayArr[0];
			var birthMonth = strBirthdayArr[1];
			var birthDay = strBirthdayArr[2];

			d = new Date();
			var nowYear = d.getFullYear();
			var nowMonth = d.getMonth() + 1;
			var nowDay = d.getDate();

			if (nowYear == birthYear) {
				returnAge = 0;//åå¹´ åä¸º0å²  
			} else {
				var ageDiff = nowYear - birthYear; //å¹´ä¹å·®  
				if (ageDiff > 0) {
					if (nowMonth == birthMonth) {
						var dayDiff = nowDay - birthDay;//æ¥ä¹å·®  
						if (dayDiff < 0) {
							returnAge = ageDiff - 1;
						} else {
							returnAge = ageDiff;
						}
					} else {
						var monthDiff = nowMonth - birthMonth;//æä¹å·®  
						if (monthDiff < 0) {
							returnAge = ageDiff - 1;
						} else {
							returnAge = ageDiff;
						}
					}
				} else {
					returnAge = -1;//è¿å-1 è¡¨ç¤ºåºçæ¥æè¾å¥éè¯¯ æäºä»å¤©  
				}
			}
			return returnAge;//è¿åå¨å²å¹´é¾  
		}
</script>
<!-- //calculate age -->


<script type="text/javascript">
function allowDrop(ev)
{
	ev.preventDefault();
}

function drag(ev)
{
	ev.dataTransfer.setData("Text",ev.target.id);
}

function drop(ev)
{
	ev.preventDefault();
	var data=ev.dataTransfer.getData("Text");
	ev.target.appendChild(document.getElementById(data));
}
</script>
</head>

<!-- <body style="background-color:#ffffaa"> -->
<body>
<!-- banner -->
	<!-- <div class="banner">
		<h>This is the banner</h>
	</div>  -->
	<div id="header"></div>
	
	<div class="contact">
	<div class="col-md-12">
				<br />
				<br />
			</div>
	<div class="container">
	<div class="row top-margin-20 bottom-margin-20"> 
		<div class="col-md-12" >
			<div class="row" style="vertical-align:middle">
				<div class="col-md-2">
					<div id="id_avatar">
						<img src="/Yomate/ressources/images/1.png">
					</div>
				</div>		
				<div class="col-md-4">
					<label style="font-size:30px"><strong><span id="nom"></span><span id="prenom" style="margin:10px"></span></strong></label>
					<div><span id="sexe"></span></div>
					<div><span id="age"></span></div>
					<div><span id="description"></span></div>
				</div>
			</div> 
		</div>
		<div class="col-md-8" >
			<!-- <div class="row" style="vertical-align:middle">
				<div class="col-md-4">
					<div id="id_avatar">
				   		<img src="/Yomate/ressources/images/1.png">
					</div>
				</div>		
				<div class="col-md-6">
					<label style="font-size:30px"><strong><span id="nom"></span><span id="prenom" style="margin:10px"></span></strong></label>
					<div><span id="sexe"></span></div>
					<div><span id="age"></span></div>
					<div><span id="description"></span></div>
				</div>
			</div> -->
			<div class="row">
				<br />
			</div>
			<div class="sap_tabs perso-profile">	
						<div id="horizontalTabProfilPhoto">
							<ul class="resp-tabs-list">
								<li class="resp-tab-item perso-profile-tab" aria-controls="tab_item-0" role="tab" style = "padding:10px 10px 10px 10px"><span>Profil personnel</span></li>
							</ul>	
							<div class="resp-tabs-container perso-profile-info">
								<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Nationnalité:</span>
											<span id = "nationnalite"></span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Langue(s): </span>
											<span id = "langue"></span>
										</div>
									</div>
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Profession:</span>
											<span id = "profession"></span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Loisir(s): </span>
											<span id = "loisir"></span>
										</div>
									</div>
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Situation Familiale:</span>
											<span id = "situationF"></span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Animaux d'accompagnie: </span>
											<span id = "animal"></span>
										</div>
									</div>
									<div class = "row">
										<div class = "col-md-12">
											<a id="editerProfil" class = "btn btn-success search-btn perso-edit-btn" onClick="goToProfil()">Editer<span class="glyphicon glyphicon-edit"></span></a>
										</div>
									</div> 
								</div>
							</div>
						</div>
					</div>
			<div class="row">
				<br />
			</div>
			<div class="sap_tabs perso-profile">	
				<div id="horizontalTabAnnonce">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item perso-profile-tab" aria-controls="tab_item-0" role="tab" style = "padding:10px 10px 10px 10px"><span>Informations d'annonce</span></li>
					</ul>
					<div class="resp-tabs-container perso-profile-info">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
							<div class = "row">
								<div class = "col-md-6">
									<span style = "font-weight: bold">Lieu:</span>
									<span id = "lieuA"></span>
								</div>
								<div class = "col-md-6">
									<span style = "font-weight: bold">Sexe:</span>
									<span id = "sexeA"></span>
								</div>
							</div>
							<div class = "row">
								<div class = "col-md-6">
									<span style = "font-weight: bold">Budget:</span>
									<span id = "budget"></span>
								</div>
							</div>
							<div class = "row">
								<div class = "col-md-6">
									<span style = "font-weight: bold">Période:</span>
									<span id="dateD"></span><span> - </span><span id="dateF"></span>
								</div>
							</div>
							<div class = "row">
								<div class = "col-md-6">
									<span style = "font-weight: bold">Age:</span>
									<span id="ageMin"></span><span> - </span><span id="ageMax"></span>
								</div>
							</div>
							
							<div class = "row">
								<div class = "col-md-6">
									<span style = "font-weight: bold">Animal d'accompagnie:</span>
									<span id="animalA"></span>
								</div>
							</div>
							<div class = "row">
								<div class = "col-md-6">
									<span style = "font-weight: bold">Logement:</span>
									<span id="logementA"></span>
								</div>
							</div>
							
							<div class = "row">
								<div class = "col-md-6">
									<span style = "font-weight: bold">Situation/Profession:</span>
									<span id = "situationP"></span>
								</div>
							</div>
							<div class = "row">
								<div class = "col-md-6">
									<span style = "font-weight: bold">Situation familiale:</span>
									<span id = "situationFA"></span>
								</div>
							</div>
							<div class = "row">
								<div class = "col-md-6">
									<span style = "font-weight: bold">Nationnalité:</span>
									<span id="nationnaliteA"></span>
								</div>
							</div>
							<div class = "row">
								<div class = "col-md-6">
									<span style = "font-weight: bold">Langues parlées:</span>
									<span id="langueA"></span>
								</div>
							</div>
							<div class = "row">
								<div class = "col-md-6">
									<span style = "font-weight: bold">Loisir:</span>
									<span id="loisirA"></span>
								</div>
							</div> 
							<!-- <div class="row">
				    			<div class="col-md-6">
				    				<span style = "font-weight: bold">Description</span>
				    				<span id="descriptionA"></span>
				    			</div>
				    		</div> -->
							<div class = "row">
								<div class = "col-md-12">
									<button type="button" id="editerAnnonce" id="editerAnnonce" class="btn btn-success search-btn perso-edit-btn" data-toggle="modal" data-target="#annonce">Editer<span class="glyphicon glyphicon-edit"></span></button>
								</div>
							</div> 
						</div>
					</div>
				</div>
			</div> 
			<div class="row">
				<br />
			</div>
			
			<div class="row" id="filtre">
			<div class="col-md-12">
				<div class="sap_tabs perso-profile">	
					<div id="horizontalTabFiltre">
						<ul class="resp-tabs-list">
							<li class="resp-tab-item perso-profile-tab" aria-controls="tab_item-0" role="tab" style = "padding:10px 10px 10px 10px"><span>Filtre de profil</span></li>
						</ul>
						<div class="resp-tabs-container perso-profile-info">
							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
								<div class="row top-margin-5">
									<div class="col-md-12" id="o1" >
										<strong><span style="font-size:20px" id="obligatoire1" ondrop="drop(event)" ondragover="allowDrop(event)" >Obligatoires:</span></strong>
									</div>
								</div>
								<div class="row top-margin-5">
									<div class="col-md-12" id="i1">
										<strong><span style="font-size:20px" id="important1" ondrop="drop(event)" ondragover="allowDrop(event)">Importants:</span></strong>
									</div>
								</div>
								<div class="row top-margin-5">
									<div class="col-md-12" id="p1">
										<strong><span style="font-size:20px" id="vautMieux1" ondrop="drop(event)" ondragover="allowDrop(event)">Vaut mieux:</span></strong>
									</div>
								</div>
								<div class = "row top-margin-5">
									<div class = "col-md-12">
										<a id="editerFiltre" class = "btn btn-success search-btn perso-edit-btn" onClick="editerFiltre()">Editer<span class="glyphicon glyphicon-edit"></span></a>
									</div>
								</div> 
							</div>
							
						</div>
					</div>
				</div>
			</div>
			</div>
			<div class="row" id="filtreModifiable">
			<div class="col-md-9">
			<div class="sap_tabs perso-profile">	
				<div id="horizontalTabFiltreModifiable">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item perso-profile-tab" aria-controls="tab_item-0" role="tab" style = "padding:10px 10px 10px 10px"><span>Filtre de profil</span></li>
					</ul>
					<div class="resp-tabs-container perso-profile-info">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
							<div class="row top-margin-5">
								<div class="col-md-12" id="o2" >
									<strong><span style="font-size:20px" id="obligatoire2" ondrop="drop(event)" ondragover="allowDrop(event)">Obligatoires:</span></strong>
								</div>
							</div>
							<div class="row top-margin-5">
								<div class="col-md-12" id="i2">
									<strong><span style="font-size:20px" id="important2" ondrop="drop(event)" ondragover="allowDrop(event)">Importants:</span></strong>
								</div>
							</div>
							<div class="row top-margin-5">
								<div class="col-md-12" id="p2">
									<strong><span style="font-size:20px" id="peutetre2" ondrop="drop(event)" ondragover="allowDrop(event)">Vaut mieux:</span></strong>
								</div>
							</div>
							<div class = "row top-margin-5">
									<div class = "col-md-12">
										<a id="envoyerFiltre" class = "btn btn-success search-btn perso-edit-btn" onClick="envoyerFiltre()">Envoyer<span class="glyphicon glyphicon-edit"></span></a>
									</div>
								</div> 
						</div>
						
					</div>
				</div>
			</div>
			</div>
			<div class="col-md-3" style="border-radius:5px 5px 5px 5px; border:3px solid #408080">
							<div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)" style="min-height: 15px" >
								<p draggable="true" ondragstart="drag(event)" id="tag1" style="margin:2px; color: #8a6d3b; background-color: #fcf8e3; border-style:dotted; border-color: white; display: inline-block" >sexe</p>
								<!-- <p draggable="true" ondragstart="drag(event)" id="tag2" style="color: #3c763d; background-color: #dff0d8; display: inline-block" >age</p> -->
							</div>
							<div id="div2" ondrop="drop(event)" ondragover="allowDrop(event)" style="min-height: 15px">
								<p draggable="true" ondragstart="drag(event)" id="tag2" style="margin:2px; color: #3c763d; background-color: #dff0d8; border-style:dotted; border-color: white; display: inline-block" >age</p>
							</div>
							<div id="div3" ondrop="drop(event)" ondragover="allowDrop(event)" style="min-height: 15px">
								<p draggable="true" ondragstart="drag(event)" id="tag3" style="margin:2px; color: #3c763d; background-color: #fcf8e3; border-style:dotted; border-color: white; display: inline-block" >budget</p>
							</div>
							<div id="div4" ondrop="drop(event)" ondragover="allowDrop(event)" style="min-height: 15px">
								<p draggable="true" ondragstart="drag(event)" id="tag4" style="margin:2px; color: #3c763d; background-color: #dff0d8; border-style:dotted; border-color: white; display: inline-block" >loisir</p>
							</div>
							<div id="div5" ondrop="drop(event)" ondragover="allowDrop(event)" style="min-height: 15px">
								<p draggable="true" ondragstart="drag(event)" id="tag5" style="margin:2px; color: #3c763d; background-color: #fcf8e3; border-style:dotted; border-color: white; display: inline-block" >nationnalité</p>
							</div>
							<div id="div6" ondrop="drop(event)" ondragover="allowDrop(event)" style="min-height: 15px">
								<p draggable="true" ondragstart="drag(event)" id="tag6" style="margin:2px; color: #3c763d; background-color: #dff0d8; border-style:dotted; border-color: white; display: inline-block" >langue</p>
							</div>
							<div id="div7" ondrop="drop(event)" ondragover="allowDrop(event)" style="min-height: 15px">
								<p draggable="true" ondragstart="drag(event)" id="tag7" style="margin:2px; color: #3c763d; background-color: #fcf8e3; border-style:dotted; border-color: white; display: inline-block" >animal</p>
							</div>
							<div id="div8" ondrop="drop(event)" ondragover="allowDrop(event)" style="min-height: 15px">
								<p draggable="true" ondragstart="drag(event)" id="tag8" style="margin:2px; color: #3c763d; background-color: #dff0d8; border-style:dotted; border-color: white; display: inline-block" >logement</p>
							</div>
						</div> 
			</div>
		</div>
		<!-- <hr style="width:2px;height:100px; "></hr> -->
		<div class="col-md-4">
			<div class="row">
				<hr style="width: 80%; color: #408080; height: 2px; background-color:#408080;" />
			</div>
			<div id="status" class="row"> 
				
				<span style="font-size:20px; margin-left:40px"><strong>Status d'annonce</strong></span> 
				<br />
				<br />
				<div class="row">
					<center>
						<label class="switch" style="float:center" > 
							  <input type="checkbox" checked>
							  <div class="slider">
							  <span class="on">Ouvert</span><span class="off">Ferme</span>
							 </div>
						</label>
					</center>
				</div>
				<br />
			</div>
			<div id="contactButton" class="row" style="margin: 0 auto;text-align:center;"> 
				<br />
				<a class="interestButton btn btn-primary" style="height:40px;width:200px" href="/Yomate/messagerie.jsp"><strong>Contactez-lui</strong></a>
				<br />
			</div>
			<div class="row">
				<hr style="width: 80%; color: #408080; height: 2px; background-color:#408080;" />
			</div>
			<div class="row">
				<span style="font-size:20px; margin-left:40px"><strong>Vue par</strong></span>
				<div class="row" style="margin: 30px; text-align:center;">
					<div id="id_avatar1" style="display: inline">
				   		<img style="height: 50px; width: 50px" src="/Yomate/ressources/images/1.png">
					</div>
					<div id="id_avatar2" style="display: inline">
				   		<img style="height: 50px; width: 50px" src="/Yomate/ressources/images/1.png">
					</div>
					<div id="id_avatar3" style="display: inline">
				   		<img style="height: 50px; width: 50px" src="/Yomate/ressources/images/1.png">
					</div>
				</div>
			</div>
			<div class="row">
				<hr style="width: 80%; color: #408080; height: 2px; background-color:#408080;" />
			</div>
			<div class="row">
				<span style="font-size:20px; margin-left:40px"><strong>Colocataires concernés</strong></span>
				<div class="row" style="margin: 30px; text-align:center"">
					<div id="id_avatar4" style="display: inline">
				   		<img style="height: 50px; width: 50px" src="/Yomate/ressources/images/1.png">
					</div>
					<div id="id_avatar5" style="display: inline">
				   		<img style="height: 50px; width: 50px" src="/Yomate/ressources/images/1.png">
					</div>
				</div>
			</div>
			<div class="row">
				<hr style="width: 80%; color: #408080; height: 2px; background-color:#408080;" />
			</div>
			<div class="row" id="correspondance">
				<span style="font-size:20px; margin-left:40px"><strong>Correspondance à votre profil</strong></span>
				<div style="font-size:30px; background-color: lightblue; text-align:center; margin:30px">78%</div>
			</div>
			<div class="row">
				<hr id="line" style="width: 80%; color: #408080; height: 2px; background-color:#408080;" />
			</div>
			<div class="row">
				<script>
					//document.getElementById("interet").onclick=function(){displayDate()};
					function changeColor(x){
						if(x.style.color=="rgb(255, 255, 255)"){
							x.style.color="rgb(255, 0, 0)";
						}
						else if(x.style.color=="rgb(255, 0, 0)"){
							x.style.color="rgb(255, 255, 255)";
						}   
					}
				</script>
				<div class="wrapper"  style="margin: 0 auto;text-align:center;">
					<button class="interestButton btn btn-primary" id="interest" style="height:40px;width:200px; text-align:center; color:rgb(255, 255, 255)" onclick="changeColor(this)"><strong>Je suis interesse(e)</strong></button>
				</div>		
				<!-- <button id="interet" type="button" class="btn btn-primary" style="text-align:center; float:center; color:rgb(255, 255, 255); margin: 30px" onclick="changeColor(this)">Je suis interesse(e)</button> -->
			</div>
		</div>
	</div>
	</div>
	</div>
	
	
	<!-- Editer l'annonce	 --> 
	<div class="modal fade" id="annonce">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="purchaseLabel">Editez votre annonce</h4>
                </div>
                <div class="modal-body">
                	<div class="container-fluid">
                		
                		<!-- Lieu & budget -->
	                	<div class="row">
		                	<label class="col-md-2">Lieu</label>
		                	<div class="col-md-4">
								<input type="text" class="form-control input-sm" placeholder="Lieu" id="lieuNew"></input>
			    			</div>
			    			<label class="col-md-2">Budget</label>
			    			<div class="col-md-2">
								<input type="text" class="col-md-3 form-control input-sm" placeholder="Budget" id="budgetNew"></input>
				    		</div>
				    		<div class="col-md-2">
				    			<p>euros</p>
				    		</div>
			    		</div>
							
						<div class="row top-margin-10">	
							<label class="col-md-2">Sexe</label>
							<div class="col-md-6">
								<div class="row perso-edit-sex top-margin-5">
					    			<div class="col-md-6">
						    			<label class="radio-inline"><input type="radio" value="0" name="sexeNew">Homme</label>
						    		</div>
						    		<div class="col-md-6">
										<label class="radio-inline"><input type="radio" value="1" name="sexeNew">Femme</label>
									</div>
		    					</div>
							</div>
			    		</div>
                	
			    		<!-- Date de naissance -->
			    		<div class="row top-margin-10">
			    			<label class="col-md-2">Période</label>
				    			<div class="col-md-4">
					    			<div class="input-group" id="dateDebutPicker">
					                    <input type="text" class="form-control input-sm" id="dateDNew" placeholder="Date de debut"/>
					                    <span class="input-group-addon">
					                        <span class="glyphicon glyphicon-calendar"></span>
					                    </span>
					                </div>
								</div>
								<div class="col-md-4">
					    			<div class="input-group" id="dateFinPicker">
					                    <input type="text" class="form-control input-sm" id="dateFNew" placeholder="Date de fin"/>
					                    <span class="input-group-addon">
					                        <span class="glyphicon glyphicon-calendar"></span>
					                    </span>
					                </div>
					             </div>
			    		</div>
			    		<!-- //Date de naissance -->
			    		
			    		<div class="row top-margin-10">
			    			<label class="col-md-2">Age</label>
			    			
				    		<div class="col-md-3">
			    				<input type="text" class="form-control input-sm" placeholder="Min" id="ageMinNew"></input>
			    			</div>
			    			<div class="col-md-1">
			    				<p>-</p>
			    			</div>
			    			<div class="col-md-3">
			    				<input type="text" class="form-control input-sm" placeholder="Max" id="ageMaxNew"></input>
			    			</div>
			    			<div class="col-md-1">
			    				<p>ans</p>
			    			</div>
		    		
			    		</div>
			    		
			    		<div class="row top-margin-10">
			    			<label class="col-md-6">Animaux d'accompagnie</label>
					    	<div class="col-md-2">
						    	<label class="radio-inline"><input type="radio" value="1" name="animalNew">oui</label>
						    </div>
						    <div class="col-md-2">
								<label class="radio-inline"><input type="radio" value="0" name="animalNew">non</label>
							</div>
		    			</div>
		    			<div class="row top-margin-10">
							<label class="col-md-4 search-filter-item-name">Logement</label>
							<div class="col-md-8">
								<select class="form-control input-sm" id="logementNew">
									<option value="" selected disabled></option>
									<option value="0">Je n'ai pas de logement</option>
									<option value="1">J'ai un logement</option>
								</select>
							</div>
						</div>

						<!-- Situation -->
			    		<div class="row top-margin-10">
			    			<label class="col-md-4" for="situation">Situation/Profession</label>
			    			<div class="form-group col-md-8">
								<select id="professionNew" class="form-control">
									<option value="0" selected disabled></option>
									<option value="39">étudiant</option>
									<option value="69">salarié</option>
									<option value="68">retraité</option>
									<option value="13">autres</option>
							    </select>
							</div>
			    		</div>
			    		<!-- //Situation -->
			    		
				    	<!-- Situation Familiale-->
			    		<div class="row">
			    			<label class="col-md-4" for="situ-fam">Situation Familiale</label>
			    			<div class="form-group col-md-8">
								<select id="situationFNew" class="form-control" required>
									<option value="0" selected disabled></option>
									<option value="Célibataire">Célibataire</option>
									<option value="Couple">Couple</option>
									<option value="Marié">Marié</option>
									<option value="Autre">Autre</option>
							    </select>
							</div>
			    		</div>
			    		<!-- //Situation Familiale-->
					    		
					    <!-- NationalitÃ©-->
			    		<div class="row">
			    			<label class="col-md-4" for="selectnationalite">Nationalité</label>
			    			<div class="col-md-8 form-group">
			    				<select id="nationnaliteNew" class="form-control" required>
									<option value="0" selected disabled></option>
									<option value="64">Française</option>
									<option value="41">Chinoise</option>
									<option value="83">Italienne</option>
									<option value="148">Russee</option>
									<option value="14">Bahamienne</option>
									<option value="196">autre</option>
							    </select>
							</div>
			    		</div>
			    		<!-- //Nationalité-->
			    		
			    		<!-- Langue parlé -->
			    		<div class="row">
			    			<!-- Langue parlé-->
			    			<label class="col-md-4" for="annonceLangue">Langue</label>
			    			<div class="col-md-8 form-group">
			    				<select id="langueNew" class="form-control" required>
									<option value="0" selected disabled></option>
									<option value="27">française</option>
									<option value="20">chinoise mandarin</option>
									<option value="3">anglaise</option>
									<option value="1">allemande</option>
									<option value="36">italienne</option>
									<option value="73">autres</option>
							    </select>
							</div>
						</div>
			    		<!-- Langue parlé-->
			    		
			    		<!-- Loisirs-->
			    		<div class="row">
			    			<label class="col-md-4" for="annonceLoisir">Loisir</label>
			    			<div class="col-md-8 form-group">
			    				<select id="loisirNew" class="form-control" required>
									<option value="0" selected disabled></option>
									<option value="2">voyage</option>
									<option value="3">sport</option>
									<option value="5">cuisine</option>
									<option value="19">jeux vidéos</option>
									<option value="9">lecture</option>
									<option value="35">autres</option>
							    </select>
							</div>
			    		</div>
			    		<!-- //Loisirs-->
			    		
			    		<!-- Description -->
			    		<div class="row">
			    			<div class="col-md-12">
			    				<label>Description</label>
			    			</div>
			    			<div class="col-md-12 top-margin-5">
			    				<input id = "descriptionNew" type="text" class="form-control input-sm " placeholder="Bonjour, je suis..."  required></input>
			    			</div>
			    		</div>
			    		<!-- //Description -->
			    		
			    		<!-- <div class="row top-margin-10">
			    				nationnalite
			    				<label class="col-md-2">Loisir</label>
			    				<div class="col-md-6">
				    				<select  class="form-control input-sm" id="loisirNew">
				    					<option value="1">musique</option>
										<option value="2">voyage</option>
										<option value="3">sport</option>
										<option value="4">balades</option>
										<option value="5">cuisine</option>
										<option value="6">nature</option>
										<option value="7">shopping</option>
										<option value="8">bricolage</option>
										<option value="9">lecture</option>
										<option value="10">danse</option>
										<option value="11">jardinage</option>
										<option value="12">expositions/musées</option>
										<option value="13">écriture</option>
										<option value="14">animaux</option>
										<option value="15">télévision</option>
										<option value="16">automobiles</option>
										<option value="17">informatique/internet</option>
										<option value="18">photo</option>
										<option value="19">jeux vidéos</option>
										<option value="20">chant/instrument musical</option>
										<option value="21">décoration</option>
										<option value="22">l'art</option>
										<option value="23">cinéma</option>
										<option value="24">jeux de cartes</option>
										<option value="25">nologie</option>
										<option value="26">peinture/dessin</option>
										<option value="27">jeux de sociétés</option>
										<option value="28">théâtre</option>
										<option value="29">restaurant</option>
										<option value="30">les sorties</option>
										<option value="31">voir des amis</option>
										<option value="32">activités caritative</option>
										<option value="33">pche/chasse</option>
										<option value="34">loisirs créatifs</option>
									</select>
								</div>
			    		</div> -->
			    		<!-- <div class="row top-margin-10">
			    				nationnalite
			    				<label class="col-md-2">Nationnalite</label>
			    		</div>
			    		<div class="row top-margin-10">
			    			<label class="col-md-4">Langues parlees</label>
			    		</div> -->
                	</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                    <button type="button" class="btn btn-primary" onClick="updateAnnonce()" data-dismiss="modal">Appliquer</button>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
    </div>
    
    <br />
    <br />
    <br />
	
	
	<div id="footer"></div>
	
	<script type="text/javascript"> 
	function goToProfil(){
		var user = getCookie("idUser");
		alert("ready to go?");
		document.location.href="http://localhost:8080/Yomate/espacePersonnel/"+idUser;
	}
	</script>
	
	<script type="text/javascript"> 
	function go(){
		alert("ready to go?");
		document.location.href="http://localhost:8080/Yomate/annonce/2";
	}
	</script>
	<script src=<c:url value="${path}/ressources/js/easyResponsiveTabs.js" />> </script>	
	<script type="text/javascript">		
		$(document).ready(function () {		
			$('#horizontalTabProfilPhoto').easyResponsiveTabs({		
				type: 'default', //Types: default, vertical, accordion           		
				width: 'auto', //auto or any width like 600px		
				fit: true   // 100% fit in a container		
			});		
		});		
		$(document).ready(function () {		
			$('#horizontalTabAnnonce').easyResponsiveTabs({		
				type: 'default', //Types: default, vertical, accordion           		
				width: 'auto', //auto or any width like 600px		
				fit: true   // 100% fit in a container		
			});		
		});		
		$(document).ready(function () {		
			$('#horizontalTabFiltre').easyResponsiveTabs({		
				type: 'default', //Types: default, vertical, accordion           		
				width: 'auto', //auto or any width like 600px		
				fit: true   // 100% fit in a container		
			});		
		});	
		$(document).ready(function () {		
			$('#horizontalTabFiltreModifiable').easyResponsiveTabs({		
				type: 'default', //Types: default, vertical, accordion           		
				width: 'auto', //auto or any width like 600px		
				fit: true   // 100% fit in a container		
			});		
		});		
	</script>
	
	<script type="text/javascript"> 
		alert("hello"); 
		var user = getCookie("idUser");
		
		//get user profil info
		var json0 = '${userProfile}';
		var profil = JSON.parse(json0);
		var idUser = profil[0]['idUser'];
		//header
		document.getElementById("nom").innerHTML = profil[0]['nom'];
		document.getElementById("prenom").innerHTML = profil[0]['prenom'];
		document.getElementById("sexe").innerHTML = checkSex(profil[0]['sex']);
		document.getElementById("age").innerHTML = jsGetAge(profil[0]['birthday']);
		//document.getElementById("description").innerHTML = profil[0]['description'];
		//profil info
		var nationnaliteValue = profil[0]['nationnalite'];
		document.getElementById("nationnalite").innerHTML = checkNationnalite(nationnaliteValue);
		//alert("nationnalite user");
		
		var langueValue = profil[0]['language'];
		document.getElementById("langue").innerHTML = checkLangue(langueValue);
		//alert("langue user");
		
		var professionValue = profil[0]['profession'];
		document.getElementById("profession").innerHTML = checkProfession(professionValue);
		//alert("profession user");
		
		var loisirValue =  profil[0]['loisir'];
		document.getElementById("loisir").innerHTML = checkLoisir(loisirValue);
		//alert("loisir user");
		
		document.getElementById("situationF").innerHTML = profil[0]['situationFam'];
		//alert("situation fam user");
		
		document.getElementById("animal").innerHTML = checkPet(profil[0]['haspet']);
		//alert("animal user");
		
		//get annonce info
		var json = '${annonceInfo}';
		//alert(json);
		var annonce = JSON.parse(json);

		document.getElementById("description").innerHTML = annonce[0]['description'];
		
		document.getElementById("lieuA").innerHTML = annonce[0]['lieu'];
		document.getElementById("sexeA").innerHTML = checkSex(annonce[0]['sex']);
		document.getElementById("budget").innerHTML = annonce[0]['budget'];
		document.getElementById("dateD").innerHTML = annonce[0]['date_debut'];
		document.getElementById("dateF").innerHTML = annonce[0]['date_fin'];
		document.getElementById("ageMin").innerHTML = annonce[0]['age_min'];
		document.getElementById("ageMax").innerHTML = annonce[0]['age_max'];
		document.getElementById("animalA").innerHTML = checkPet(annonce[0]['haspet']);
		document.getElementById("logementA").innerHTML = annonce[0]['description_logement'];
		var professionValue = annonce[0]['professionName'];
		var profession = checkProfession(professionValue);
		//alert(profession);
		document.getElementById("situationP").innerHTML = profession;
		document.getElementById("situationFA").innerHTML = annonce[0]['situationFam'];
		var nationnaliteValue = annonce[0]['nationnaliteName'];
		var nationnalite = checkNationnalite(nationnaliteValue);
		document.getElementById("nationnaliteA").innerHTML = nationnalite;

		var langueValue = annonce[0]['languages'];
		var langue = checkLangue(langueValue);
		document.getElementById("langueA").innerHTML = langue;
	
		document.getElementById("loisirA").innerHTML = annonce[0]['loisirs'];


		//priorite de matching
		var obligatoirecritere = annonce[0]['obligatoirecritere'];
		var obligatoire = obligatoirecritere.split(",");
		for(var i=0; i<obligatoire.length; i++){
			//alert(obligatoire[i]);
			var o1 = document.getElementById('o1');
			var tag = '<p style="margin:2px; color: #8a6d3b; background-color: #fcf8e3; border-style:dotted; border-color: white; display: inline-block">'+obligatoire[i]+'</p>';
			o1.insertAdjacentHTML('beforeend', tag);
		}

		var importantcritere = annonce[0]['importantcritere'];
		var important = importantcritere.split(",");
		for(var i=0; i<important.length; i++){
			//alert(important[i]);
			var i1 = document.getElementById('i1');
			var tag = '<p style="margin:2px; color: #8a6d3b; background-color: #fcf8e3; border-style:dotted; border-color: white; display: inline-block">'+important[i]+'</p>';
			i1.insertAdjacentHTML('beforeend', tag);
		}

		var peutetrecritere = annonce[0]['peutetrecritere'];
		var peutetre = peutetrecritere.split(",");
		for(var i=0; i<peutetre.length; i++){
			//alert(peutetre[i]);
			var p1 = document.getElementById('p1');
			var tag = '<p style="margin:2px; color: #8a6d3b; background-color: #fcf8e3; border-style:dotted; border-color: white; display: inline-block">'+peutetre[i]+'</p>';
			p1.insertAdjacentHTML('beforeend', tag);
		}
		
		//check le droit 
		if(user === idUser){
			alert("You are watching your annonce!");
			var contact = document.getElementById("contactButton");
			contact.style.display="none";
			alert("hide contact!");
			var interest = document.getElementById("interest");
			interest.style.display="none";
			document.getElementById("correspondance").style.display="none";
			document.getElementById("line").style.display="none";
			//document.getElementById("filtre").style.display="none";
			document.getElementById("filtreModifiable").style.display="none";

			//priorite de matching
			/* var obligatoirecritere = annonce[0]['obligatoirecritere'];
			var obligatoire = obligatoirecritere.split(",");
			for(var i=0; i<obligatoire.length; i++){
				//alert(obligatoire[i]);
				var o2 = document.getElementById('o2');
				var tag = '<p style="margin:2px; color: #8a6d3b; background-color: #fcf8e3; border-style:dotted; border-color: white; display: inline-block">'+obligatoire[i]+'</p>';
				o2.insertAdjacentHTML('beforeend', tag);
			}

			var importantcritere = annonce[0]['importantcritere'];
			var important = importantcritere.split(",");
			for(var i=0; i<important.length; i++){
				//alert(important[i]);
				var i2 = document.getElementById('i2');
				var tag = '<p draggable="true" ondragstart="drag(event)" style="margin:2px; color: #8a6d3b; background-color: #fcf8e3; border-style:dotted; border-color: white; display: inline-block">'+important[i]+'</p>';
				i2.insertAdjacentHTML('beforeend', tag);
			}

			var peutetrecritere = annonce[0]['peutetrecritere'];
			var peutetre = peutetrecritere.split(",");
			for(var i=0; i<peutetre.length; i++){
				//alert(peutetre[i]);
				var p2 = document.getElementById('p2');
				var tag = '<p draggable="true" ondragstart="drag(event)" style="margin:2px; color: #8a6d3b; background-color: #fcf8e3; border-style:dotted; border-color: white; display: inline-block">'+peutetre[i]+'</p>';
				p2.insertAdjacentHTML('beforeend', tag);
			} */
		}
		else{
			alert("You are watching others' annonce!");
			/* var status = document.getElementById("status");
			status.style.display="none"; */
			document.getElementById("status").style.display="none";
			alert("status hidden!");
			document.getElementById("editerProfil").style.display="none";
			document.getElementById("editerAnnonce").style.display="none";
			document.getElementById("editerFiltre").style.display="none";
			document.getElementById("filtreModifiable").style.display="none";

			/* //priorite de matching
			var obligatoirecritere = annonce[0]['obligatoirecritere'];
			var obligatoire = obligatoirecritere.split(",");
			for(var i=0; i<obligatoire.length; i++){
				//alert(obligatoire[i]);
				var o1 = document.getElementById('o1');
				var tag = '<p style="margin:2px; color: #8a6d3b; background-color: #fcf8e3; border-style:dotted; border-color: white; display: inline-block">'+obligatoire[i]+'</p>';
				o1.insertAdjacentHTML('beforeend', tag);
			}

			var importantcritere = annonce[0]['importantcritere'];
			var important = importantcritere.split(",");
			for(var i=0; i<important.length; i++){
				//alert(important[i]);
				var i1 = document.getElementById('i1');
				var tag = '<p style="margin:2px; color: #8a6d3b; background-color: #fcf8e3; border-style:dotted; border-color: white; display: inline-block">'+important[i]+'</p>';
				i1.insertAdjacentHTML('beforeend', tag);
			}

			var peutetrecritere = annonce[0]['peutetrecritere'];
			var peutetre = peutetrecritere.split(",");
			for(var i=0; i<peutetre.length; i++){
				//alert(peutetre[i]);
				var p1 = document.getElementById('p1');
				var tag = '<p style="margin:2px; color: #8a6d3b; background-color: #fcf8e3; border-style:dotted; border-color: white; display: inline-block">'+peutetre[i]+'</p>';
				p1.insertAdjacentHTML('beforeend', tag);
			} */
			
		}
			
	</script>
	
	
	
</body>
<script>
function updateAnnonce(){

	var json = '${annonceInfo}';
	var annonce = JSON.parse(json);
	var idAnnonce = annonce[0]['idAnnonce'];
	alert(idAnnonce);
	var description = annonce[0]['description'];
	var nbPersonneBesoin = annonce[0]['nbPersonneBesoin'];
	//var situationF = annonce[0]['situationFam'];
	var ecole = annonce[0]['ecole'];
	var peutetre = "sex, haspet";
	var important = "nationnalite";
	var obligatoire = "age, language";
	//var descriptionLogement = "grand";
	
	var lieu = document.getElementById("lieuNew").value;
	alert(lieu); 
	var budget = document.getElementById("budgetNew").value; 
	alert(budget);
	var sex = document.querySelector('input[name="sexeNew"]:checked').value;
	alert(sex);
	var dateD = document.getElementById("dateDNew").value;
	alert(dateD);  
	var dateF = document.getElementById("dateFNew").value;
	alert(dateF);
	var ageMin = document.getElementById("ageMinNew").value;
	alert(ageMin); 
	var ageMax = document.getElementById("ageMaxNew").value;
	alert(ageMax);
	var pet = document.querySelector('input[name="animalNew"]:checked').value;
	alert(pet); 
	var listLogement = document.getElementById("logementNew");
	var logement = listLogement.options[listLogement.selectedIndex].value;
	alert(logement);
	alert("what profession?");
	var listProfession = document.getElementById("professionNew");
	var profession = listProfession.options[listProfession.selectedIndex].value;
	alert(profession);
	var listSituationF = document.getElementById("situationFNew");
	var situationF = listSituationF.options[listSituationF.selectedIndex].value;
	alert(situationF);
	var listNationnalite = document.getElementById("nationnaliteNew");
	var nationnalite = listNationnalite.options[listNationnalite.selectedIndex].value;
	alert(nationnalite);
	var listLangue = document.getElementById("langueNew");
	var language = listLangue.options[listLangue.selectedIndex].value;
	alert(language);
	var listLoisir = document.getElementById("loisirNew");
	var loisirValue = listLoisir.options[listLoisir.selectedIndex].value;
	alert(loisirValue);
	var descriptionLogement = document.getElementById("descriptionNew").value;
	alert(descriptionLogement);
	
	var url = "/Yomate/annonce/modifier/"+idAnnonce+"/"+dateD+"/"+dateF+"/"+description+"/"+budget+"/"+nbPersonneBesoin
	+"/"+lieu+"/"+descriptionLogement+"/"+sex+"/"+ageMin+"/"+ageMax+"/"+pet+"/"+situationF+"/"+ecole+"/"+profession+"/"+nationnalite+"/"+loisirValue+"/"+language+"/"+peutetre
	+"/"+obligatoire+"/"+important; 
	//var url = "http://localhost:8080/Yomate/annonce/modifierTest/"+idAnnonce+"/"+dateD;
	document.location.href = url; 

	}
	
	</script>
	
	<!-- envoyer filtre -->
	<script type="text/javascript">
	function envoyerFiltre(){
		var json = '${annonceInfo}';
		
		var obligatoire = document.getElementById("obligatoire2").childNodes;
		//alert(obligatoire.length);
		var obl="";
		for(var i=1; i<obligatoire.length; i++){
			//alert(obligatoire[i]);
			//alert(obligatoire[i].innerText);
			obl = obl+","+obligatoire[i].innerText;
			//alert("after: "+obl);
			//alert(obligatoire[i].textContent);//
			//alert(obligatoire[i].innerHTML);
			////alert(obligatoire[i].text);
			//alert(obligatoire[i].value);
		}
		obl = obl.substring(1, obl.length);
		//alert("obligatoire: "+obl);

		//important
		var important = document.getElementById("important2").childNodes;
		//alert(obligatoire.length);
		var imp="";
		for(var i=1; i<important.length; i++){
			//alert(obligatoire[i]);
			//alert(obligatoire[i].innerText);
			imp = imp+","+important[i].innerText;
			//alert("after: "+obl);
			//alert(obligatoire[i].textContent);//
			//alert(obligatoire[i].innerHTML);
			////alert(obligatoire[i].text);
			//alert(obligatoire[i].value);
		}
		imp = imp.substring(1, imp.length);
		//alert("important: "+ imp);

		//peutetre
		var peutetre = document.getElementById("peutetre2").childNodes;
		//alert(obligatoire.length);
		var ptt="";
		for(var i=1; i<peutetre.length; i++){
			//alert(obligatoire[i]);
			//alert(obligatoire[i].innerText);
			ptt = ptt+","+peutetre[i].innerText;
			//alert("after: "+obl);
			//alert(obligatoire[i].textContent);//
			//alert(obligatoire[i].innerHTML);
			////alert(obligatoire[i].text);
			//alert(obligatoire[i].value);
		}
		ptt = ptt.substring(1, ptt.length);
		//alert("peutetre: "+ ptt);

		var annonce = JSON.parse(json);
		var idAnnonce = annonce[0]['idAnnonce'];
		alert(idAnnonce);
		var description = annonce[0]['description'];
		var nbPersonneBesoin = annonce[0]['nbPersonneBesoin'];
		var ecole = annonce[0]['ecole'];
		//var peutetre = "sex, haspet";
		//var important = "nationnalite";
		//var obligatoire = "age, language";

		var lieu = annonce[0]['lieu'];
		alert(lieu); 
		var budget = annonce[0]['budget']; 
		alert(budget);
		var sex = annonce[0]['sex'];
		alert(sex);
		var dateD = annonce[0]['date_debut'];
		alert(dateD);  
		var dateF = annonce[0]['date_fin'];
		alert(dateF);
		var ageMin = annonce[0]['age_min'];
		alert(ageMin); 
		var ageMax = annonce[0]['age_max'];
		alert(ageMax);
		var pet = annonce[0]['haspet'];
		alert(pet); 
		/* var logement = annonce[0]['sex']; 
		alert(logement); */
		var profession = annonce[0]['professionName'];
		alert(profession);
		
		var situationF = annonce[0]['situationFam'];
		alert(situationF);
		
		var nationnalite = annonce[0]['nationnaliteName'];
		alert(nationnalite);
		
		var language = annonce[0]['languages'];
		alert(language);

		var loisirValue;
		var loisir = annonce[0]['loisirs'];
		switch(loisir){
		case "lecture":
			loisirValue = "9";
			break;
		case "voyage":
			loisirValue = "2";
			break;
		case "sport":
			loisirValue = "3";
			break;
		case "cuisine":
			loisirValue = "5";
			break;
		case "jeux vidéos":
			loisirValue = "19";
			break;
		case "autres":
			loisirValue = "35";
			break;
		default:
			loisirValue = "35";
		}
		alert("loisir: "+loisirValue);
		var descriptionLogement = annonce[0]['description_logement'];
		alert(descriptionLogement); 

		peutetre = ptt;
		alert(peutetre);
		obligatoire = obl;
		alert(obligatoire);
		important = imp;
		alert(important);
		var url = "/Yomate/annonce/modifier/"+idAnnonce+"/"+dateD+"/"+dateF+"/"+description+"/"+budget+"/"+nbPersonneBesoin
		+"/"+lieu+"/"+descriptionLogement+"/"+sex+"/"+ageMin+"/"+ageMax+"/"+pet+"/"+situationF+"/"+ecole+"/"+profession+"/"+nationnalite+"/"+loisirValue+"/"+language+"/"+peutetre
		+"/"+obligatoire+"/"+important; 
		//var url = "http://localhost:8080/Yomate/annonce/modifierTest/"+idAnnonce+"/"+dateD;
		document.location.href = url; 
		
	}
	</script>
<!-- //envoyer filtre-->
	
</html>