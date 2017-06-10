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
    $('#dateDebutPicker').datetimepicker({format: 'DD-MM-YYYY'});
});
</script>

<!-- date fin picker -->
<script type="text/javascript">
$(function () {
    $('#dateFinPicker').datetimepicker({format: 'DD-MM-YYYY'});
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
		<div class="col-md-8" >
			<div class="row" style="vertical-align:middle">
				<div class="col-md-4">
					<div id="id_avatar">
				   		<img src="/Yomate/ressources/images/1.png">
					</div>
				</div>		
				<div class="col-md-6">
					<label style="font-size:30px"><strong><span id="nom"></span><span id="prenom"></span></strong></label>
					<div><span id="sexe"></span></div>
					<div><span id="age"></span></div>
					<div><span id="description"></span></div>
				</div>
			</div>
			<div class="row">
				<br />
			</div>
			<div class="row"  style ="border-radius:5px 5px 5px 5px; border:3px solid #408080;" >
				<div style="font-size:30px">Profil personnel</div>
				<div class="row">
					<div class="col-md-6">
						<!-- <div class="top-margin-5">Lieu:<span id="lieu"></span></div> -->
						<div class="top-margin-5">Profession:<span id="profession"></span></div>
						<div class="top-margin-5">Nationnalité:<span id="nationnalite"></span></div>
						<div class="top-margin-5">Situation familiale:<span id="situationF"></span></div>
					</div>
					<div class="col-md-6"  >
						<div class="top-margin-5">Langue(s):<span id="langue"></span></div>
						<div class="top-margin-5">Loisirs:<span id="loisir"></span></div>
						<!-- <div class="top-margin-5">Habitude horaire:<span id="habitude"></span></div> -->
						<div class="top-margin-5">Animaux d'accompagnie:<span id="animal"></span></div>
					</div>
				</div>
				<div class="row">
					<br />
				</div>
				<!-- <div class="col-md-12">
				 	<button class = "button button-action button-rounded button-small" style="align:right; float:right">Editer</button>
				 	<a data-toggle="modal" data-target="#annonce">Editer</a>
				 </div> -->
			</div>
			<div class="row">
				<br />
				<br />
			</div>
			<div class="row" style="border-radius:5px 5px 5px 5px; border:3px solid #408080">
				<div style="font-size:30px">Informations d'annonce</div>
				<div class="row top-margin-5">
					<div class="col-md-6">
						<div>Lieu:<span id="lieuA"></span></div>
					</div>
					<div class="col-md-6">
						<div>Sexe:<span id="sexeA"></span></div>
					</div>
				</div>
				
				<div class="top-margin-5">Budget:<span id="budget"></span></div>
				<div class="top-margin-5">Durée:<span id="dateD"></span><span> - </span><span id="dateF"></span></div>
				<div class="top-margin-5">Age:<span id="ageMin"></span><span> - </span><span id="ageMax"></span></div>
				<div class="top-margin-5">Loisir:<span id="loisirA"></span></div>
				<div class="top-margin-5">Animal d'accompagnie:<span id="animalA"></span></div>
				<div class="top-margin-5">Nationnalité:<span id="nationnaliteA"></span></div>
				<div class="top-margin-5">Langues parlées:<span id="langueA"></span></div>
				<div class="top-margin-5">Ecole:<span id="ecole"></span></div>
				
				<div class="col-md-12 top-margin-5">
					<br />
				</div>
				<div class="col-md-12 top-margin-5">
				 	<!-- <button class = "button button-action button-rounded button-small" style="align:right; float:right">Editer</button> -->
				 	<button type="button" id="editerAnnonce" class="btn btn-primary btn-large" data-toggle="modal" data-target="#annonce">Editer</button>
				 </div>
			</div>
			<div class="row">
				<br />
				<br />
			</div>
			<div class="row" style="border-radius:5px 5px 5px 5px; border:3px solid #4176c5;">
			<div style="font-size:30px">Filtre de profil</div>
				<div class="col-md-8" style="">
					
					<div class="row top-margin-5">
						<div style="font-size:20px" id="obligatoire" ondrop="drop(event)" ondragover="allowDrop(event)">Obligatoires:</div>
					</div>
					<div class="row top-margin-5">
						<div style="font-size:20px" id="important" ondrop="drop(event)" ondragover="allowDrop(event)">Importants:</div>
					</div>
					<div class="row top-margin-5">
						<div style="font-size:20px" id="vautMieux" ondrop="drop(event)" ondragover="allowDrop(event)">Vaut mieux:</div>
					</div>
				</div>
				<div class="col-md-4" style="border-radius:5px 5px 5px 5px; border:3px solid #408080">
					<div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)" >
						<p draggable="true" ondragstart="drag(event)" id="tag1" style="color: #8a6d3b; background-color: #fcf8e3; display: inline-block" >sexe</p>
						<!-- <p draggable="true" ondragstart="drag(event)" id="tag2" style="color: #3c763d; background-color: #dff0d8; display: inline-block" >age</p> -->
					</div>
					<div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)" style="border:1px dashed red">
						<p draggable="true" ondragstart="drag(event)" id="tag2" style="color: #3c763d; background-color: #dff0d8; display: inline-block" >age</p>
					</div>
				</div>
			</div>
		</div>
		<!-- <hr style="width:2px;height:100px; "></hr> -->
		<div class="col-md-4">
			<!-- <div class="col-md-12"> 
					<br />
					<div style="font-size:20px">Status d'annonce</div> 
					<br />
					<div style="background-color: lightblue; text-align:center;  color: #FFFFFF">Ouverte</div>
					<br />
			</div> -->
			<!-- <div class="row">
				<p style="text-align:center;  color:#408080">---------------------------------------------</p>
			</div> -->
			<div class="row">
				<hr style="width: 80%; color: #408080; height: 2px; background-color:#408080;" />
			</div>
			<div class="row"> 
				
				<div style="font-size:20px; margin-left:40px">Status d'annonce</div> 
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
			<div class="row">
				<hr style="width: 80%; color: #408080; height: 2px; background-color:#408080;" />
			</div>
			<div class="row">
				<div style="font-size:20px; margin-left:40px">Vue par</div>
				<div class="row" style="margin: 30px">
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
				<div style="font-size:20px; margin-left:40px">Colocataires concernés</div>
				<div class="row" style="margin: 30px">
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
			<div class="row" >
				<div style="font-size:20px; margin-left:40px">Correspondance à votre profil:</div>
				<div id="correspondance" style="font-size:30px; background-color: lightblue; text-align:center; margin:30px">78%</div>
			</div>
			<div class="row">
				<hr style="width: 80%; color: #408080; height: 2px; background-color:#408080;" />
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
				<div class="wrapper">
					<button class="interestButton btn btn-primary" id="interet" style="text-align:center; color:rgb(255, 255, 255); margin: 30px" onclick="changeColor(this)">Je suis interesse(e)</button>
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
			    			<label class="col-md-2">Durée</label>
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
			    				<!-- nationnalite -->
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
			    		</div>
			    		<div class="row top-margin-10">
			    				<!-- nationnalite -->
			    				<label class="col-md-2">Nationnalite</label>
			    		</div>
			    		<div class="row top-margin-10">
			    			<label class="col-md-4">Langues parlees</label>
			    		</div>
                	</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                    <button type="button" class="btn btn-primary" onClick="updateAnnonce()" data-dismiss="modal">Appliquer</button>
                </div>
            </div>
        </div>
    </div>
	
	
	<div id="footer"></div>
	
	
	
	
	<script type="text/javascript"> 
	function go(){
		alert("ready to go?");
		document.location.href="http://localhost:8080/Yomate/annonce/2";
	}
	</script>
	
	<script type="text/javascript"> 
		var json0 = '${userProfile}';
		var profil = JSON.parse(json0);
		document.getElementById("nom").innerHTML = profil[0]['nom'];
		document.getElementById("prenom").innerHTML = profil[0]['prenom'];
		document.getElementById("sexe").innerHTML = checkSex(profil[0]['sex']);
		document.getElementById("age").innerHTML = jsGetAge(profil[0]['birthday']);
		document.getElementById("description").innerHTML = profil[0]['description'];

		document.getElementById("profession").innerHTML = profil[0]['profession'];
		document.getElementById("nationnalite").innerHTML = profil[0]['nationnalite'];
		document.getElementById("situationF").innerHTML = profil[0]['situationFam'];
		document.getElementById("langue").innerHTML = profil[0]['language'];
		document.getElementById("loisir").innerHTML = profil[0]['loisir'];
		document.getElementById("animal").innerHTML = checkPet(profil[0]['haspet']);
		
		var json = '${annonceInfo}';
		//alert(json);
		var annonce = JSON.parse(json);
		document.getElementById("budget").innerHTML = annonce[0]['budget'];
		document.getElementById("dateD").innerHTML = annonce[0]['date_debut'];
		document.getElementById("dateF").innerHTML = annonce[0]['date_fin'];
		document.getElementById("description").innerHTML = annonce[0]['description'];
		document.getElementById("lieuA").innerHTML = annonce[0]['lieu'];
		document.getElementById("ageMin").innerHTML = annonce[0]['age_min'];
		document.getElementById("ageMax").innerHTML = annonce[0]['age_max'];
		//document.getElementById("situationF").innerHTML = annonce[0]['situationFam'];
		document.getElementById("langueA").innerHTML = annonce[0]['language'];
		document.getElementById("ecole").innerHTML = annonce[0]['ecole'];
		document.getElementById("nationnaliteA").innerHTML = annonce[0]['nationnaliteName'];
		document.getElementById("animalA").innerHTML = checkPet(annonce[0]['haspet']);
		document.getElementById("sexeA").innerHTML = checkSex(annonce[0]['sex']);
		document.getElementById("loisirA").innerHTML = annonce[0]['loisir'];
		/* if(annonce[0]['haspet']==="0")
			document.getElementById("animalA").innerHTML = "non";
		else
			document.getElementById("animalA").innerHTML = "oui"; */
		/* if(annonce[0]['sex']==="1")
			document.getElementById("sexeA").innerHTML = "Homme";
		else if(annonce[0]['sex']==="0")
			document.getElementById("animal").innerHTML = "Femme";  */
		
		/* document.getElementById("age").innerHTML = jsGetAge(user[0]['birthday']);
		document.getElementById("sexe").innerHTML = checkSex(user[0]['sex']);  */
		
	</script>
	
	<script>
	/* function ModifierAnnonce(){
		var json = '${annonceInfo}';
		var annonce = JSON.parse(json);
		var id = annonce[0]['idAnnonce'];
		var dateD = document.getElementById("dateD").value;
		var dateF = document.getElementById("dateF").value;
		var description = annonce[0]['description'];
		var budget = document.getElementById("budget").value;
		var nbPersonneBesoin = annonce[0]['nbPersonneBesoin'];
		var lieu = document.getElementById("lieuA").value;
		var descriptionLogement = annonce[0]['descriptionLogement'];
		var sex;
		var sexe = document.getElementById("sexeA").value;
		if(sexe === "homme")
			sex = "0";
		else
			sex = "1";
		var ageMin = document.getElementById("ageMin").value;
		var ageMax = document.getElementById("ageMax").value;
		var pet;
		var haspet = document.getElementById("animalA").value;
		if(haspet === "non")
			pet = "0";
		else
			pet = "1";
		var situationF = annonce[0]['situationFam'];
		var ecole = annonce[0]['ecole'];
		var profession = annonce[0]['profession'];
		var nationnalite = annonce[0]['nationnalite'];
		var loisir = annonce[0]['loisir'];
		var language = annonce[0]['language'];
		var peutetre = annonce[0]['peutetre'];
		var obligatoire = annonce[0]['obligatoire'];
		var important = annonce[0]['important'];

		document.location.href="http://localhost:8080/Yomate/annonce/modifier/"+idAnnonce+"/"+dateD+"/"+dateF+"/"+description+"/"+budget+"/"+nbPersonneBesoin
		+"/"+lieu+"/"+descriptionLogement+"/"+sex+"/"+ageMin+"/"+ageMax+"/"+pet+"/"+situationF+"/"+ecole+"/"+profession+"/"+nationnalite+"/"+loisir+"/"+language+"/"+peutetre
		+"/"+obligatoire+"/"+important;  
	}*/
	</script>
	
	
	<script>
	function ModifierAnnonce(){
		var json = '${annonceInfo}';
		var annonce = JSON.parse(json);
		var id = annonce[0]['idAnnonce'];
		var dateD = document.getElementById("dateD").value;
		var dateF = document.getElementById("dateF").value;
		var description = annonce[0]['description'];
		var budget = document.getElementById("budget").value;
		var nbPersonneBesoin = annonce[0]['nbPersonneBesoin'];
		var lieu = document.getElementById("lieuA").value;
		var descriptionLogement = annonce[0]['descriptionLogement'];
		var sex;
		var sexe = document.getElementById("sexeA").value;
		if(sexe === "homme")
			sex = "0";
		else
			sex = "1";
		var ageMin = document.getElementById("ageMin").value;
		var ageMax = document.getElementById("ageMax").value;
		var pet;
		var haspet = document.getElementById("animalA").value;
		if(haspet === "non")
			pet = "0";
		else
			pet = "1";
		var situationF = annonce[0]['situationFam'];
		var ecole = annonce[0]['ecole'];
		var profession = annonce[0]['profession'];
		var nationnalite = annonce[0]['nationnalite'];
		var loisir = annonce[0]['loisir'];
		var language = annonce[0]['language'];
		var peutetre = annonce[0]['peutetre'];
		var obligatoire = annonce[0]['obligatoire'];
		var important = annonce[0]['important'];

		document.location.href="http://localhost:8080/Yomate/annonce/modifier/"+idAnnonce+"/"+dateD+"/"+dateF+"/"+description+"/"+budget+"/"+nbPersonneBesoin
		+"/"+lieu+"/"+descriptionLogement+"/"+sex+"/"+ageMin+"/"+ageMax+"/"+pet+"/"+situationF+"/"+ecole+"/"+profession+"/"+nationnalite+"/"+loisir+"/"+language+"/"+peutetre
		+"/"+obligatoire+"/"+important; 
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
	var situationF = annonce[0]['situationFam'];
	var ecole = annonce[0]['ecole'];
	var profession = annonce[0]['profession'];
	var nationnalite = annonce[0]['nationnalite'];
	//var loisir = annonce[0]['loisir'];
	var language = annonce[0]['language'];
	alert(language);
	//var peutetre = annonce[0]['peutetre'];
	//var obligatoire = annonce[0]['obligatoire'];
	//var important = annonce[0]['important'];
	//alert(important);

	var listLoisir = document.getElementById("loisirNew");
	var loisirValue = listLoisir.options[listLoisir.selectedIndex].value;
	alert(loisirValue);
	var dateD = document.getElementById("dateDNew").value;
	alert(dateD);  
	var dateF = document.getElementById("dateFNew").value;
	alert(dateF);
	var budget = document.getElementById("budgetNew").value; 
	alert(budget);
	var lieu = document.getElementById("lieuNew").value;
	alert(lieu);  
	var sex = document.querySelector('input[name="sexeNew"]:checked').value;
	alert(sex);
	var ageMin = document.getElementById("ageMinNew").value;
	alert(ageMin); 
	var ageMax = document.getElementById("ageMaxNew").value;
	alert(ageMax); 
	var pet = document.querySelector('input[name="animalNew"]:checked').value;
	alert(pet); 
	var peutetre = "sex, haspet";
	var important = "nationnalite";
	var obligatoire = "age, language";
	var descriptionLogement = "grand";
	
	/* var url = "http://localhost:8080/Yomate/annonce/modifier/"+idAnnonce+"/"+dateD+"/"+dateF+"/"+description+"/"+budget+"/"+nbPersonneBesoin
	+"/"+lieu+"/"+descriptionLogement+"/"+sex+"/"+ageMin+"/"+ageMax+"/"+pet+"/"+situationF+"/"+ecole+"/"+profession+"/"+nationnalite+"/"+loisirValue+"/"+language+"/"+peutetre
	+"/"+obligatoire+"/"+important; */
	var url = "http://localhost:8080/Yomate/annonce/modifierTest/"+idAnnonce+"/"+dateD;
	document.location.href = url; 

	}
	
	</script>
</html>