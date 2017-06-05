<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<spring:url value="ressources/css/animate.css" var="animateCss" /> 
	<spring:url value="ressources/css/bootstrap.css" var="bootstrapCss" />  
	<spring:url value="ressources/css/yomate-style.css" var="yomateCss" />
	<spring:url value="ressources/js/jquery-1.11.1.min.js" var="jqueryJs" /> 
	<spring:url value="ressources/css/flexslider.css" var="flexsliderCss" /> 
	<spring:url value="ressources/js/jquery.flexslider.js" var="jqueryFlexsliderJs" /> 
	<spring:url value="ressources/js/bootstrap.js" var="boostrapJs" />
	
	
<title>Page d'annonce</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Deliccio Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->

<%-- <link href="<c:url value="ressources/css/animate.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="ressources/css/bootstrap.css" />" rel="stylesheet" type="text/css" media="all" />  --%>

<link href="${animateCss}" rel="stylesheet" type="text/css" media="all" />
<link href="${bootstrapCss}" rel="stylesheet" type="text/css" media="all" /> 
<link href="${yomateCss}" rel="stylesheet" type="text/css" media="all" /> 

<!-- <link href="ressources/bootstrap-switch-master/dist/css/bootstrap2/bootstrap-switch.css" rel="stylesheet" type="text/css" media="all" /> --> 
<%-- <link href="<c:url value="ressources/css/style.css" />" rel="stylesheet" type="text/css" media="all" />  --%>

<!-- js -->
<%-- <script src="<c:url value="ressources/js/jquery-1.11.1.min.js" />" ></script> --%>
<script src="${jqueryJs}"></script>
<script src="${boostrapJs}"></script>
<!-- <script src="ressources/bootstrap-switch-master/src/js/bootstrap-switch.js"></script> -->
<!-- //js -->
<link href='https://fonts.googleapis.com/css?family=UnifrakturMaguntia' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:600,600italic,700,400' rel='stylesheet' type='text/css'>
<!-- FlexSlider -->
<%-- <link rel="stylesheet" href="<c:url value="ressources/css/flexslider.css" />" type="text/css" media="screen" /> --%>
<link rel="stylesheet" href="${flexsliderCss}" type="text/css" media="screen" />
<%-- <script defer src="<c:url value="ressources/js/jquery.flexslider.js" />" ></script> --%>
<script defer src="${jqueryFlexsliderJs}" ></script>
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
<script type="text/javascript"> 
	$(function(){
		$("#header").load("header.jsp");
		$("#footer").load("footer.jsp");
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


<script type="text/javascript">
var l = "Paris";

window.onload = function{
	  document.getElementById('lieu') = l;
	};

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
	<div class="container" style="border:1px dashed red">
	<div class="row top-margin-20 bottom-margin-20"> 
		<div class="col-md-8" >
			<div class="row" style="vertical-align:middle">
				<div class="col-md-4">
					<div id="id_avatar">
				   		<img src="ressources/images/1.png">
					</div>
				</div>		
				<div class="col-md-6">
					<label style="font-size:30px"><strong><span id="nomEtPrenom"></strong></label>
					<div><span id="sexe"></div>
					<div><span id="age"></div>
					<div><span id="description"></div>
				</div>
			</div>
			<div class="row">
				<br />
			</div>
			<div class="row" style="border:1px dashed red">
				<div style="font-size:30px">Profil personnel</div>
				<div class="row">
					<div class="col-md-6">
						<div class="top-margin-5">Lieu:<span id="lieu"></span></div>
						<div class="top-margin-5">Profession:<span id="profession"></span></div>
						<div class="top-margin-5">Nationnalite:<span id="nationnalite"></div>
						<div class="top-margin-5">Situation familiale:</div>
					</div>
					<div class="col-md-6"  >
						<div class="top-margin-5">Langue(s):<span id="langues"></span><!-- <div id="langue">test</div> --></div>
						<div class="top-margin-5">Loisirs:<span id="loisir"></span></div>
						<div class="top-margin-5">Habitude horaire:<span id="habitude"></span></div>
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
			<div class="row" style="border:1px dashed red">
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
				<div class="top-margin-5">Duree:<span id="dateD"></span><span> - </span><span id="dateF"></span></div>
				<div class="top-margin-5">Age:<span id="ageMin"></span><span> - </span><span id="ageMax"></span></div>
				<div class="top-margin-5">Animal d'accompagnie:<span id="animalA"></span></div>
				<div class="top-margin-5">Nationnalite:<span id="nationnaliteA"></span></div>
				<div class="top-margin-5">Langues parlees:<span id="langueA"></span></div>
				<div class="top-margin-5">Ecole:<span id="ecole"></span></div>
				
				<div class="col-md-12 top-margin-5">
					<br />
				</div>
				<div class="col-md-12 top-margin-5">
				 	<!-- <button class = "button button-action button-rounded button-small" style="align:right; float:right">Editer</button> -->
				 	<button type="button" id="editerAnnonce" class="btn btn-primary btn-large" data-toggle="modal" data-target="#annonce">Editer</button>
				 </div>
			</div>
			<div class="col-md-12">
				<br />
				<br />
			</div>
			<div class="row" style="border:1px dashed red">
				<div class="col-md-8" style="border:1px dashed red">
					<div style="font-size:30px">Filtre de profil</div>
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
				<div class="col-md-4" id="div1" ondrop="drop(event)" ondragover="allowDrop(event)" style="border:1px dashed red">
					<p draggable="true" ondragstart="drag(event)" id="tag1" style="color: #8a6d3b; background-color: #fcf8e3; display: inline-block" >sexe</p>
					<!-- <p draggable="true" ondragstart="drag(event)" id="tag2" style="color: #3c763d; background-color: #dff0d8; display: inline-block" >age</p> -->
				</div>
				<div class="col-md-4" id="div1" ondrop="drop(event)" ondragover="allowDrop(event)" style="border:1px dashed red">
					<p draggable="true" ondragstart="drag(event)" id="tag2" style="color: #3c763d; background-color: #dff0d8; display: inline-block" >age</p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<!-- <div class="col-md-12"> 
					<br />
					<div style="font-size:20px">Status d'annonce</div> 
					<br />
					<div style="background-color: lightblue; text-align:center;  color: #FFFFFF">Ouverte</div>
					<br />
			</div> -->
			<div class="row">
				<p style="text-align:center;  color:red">---------------------------------------------</p>
			</div>
			<div class="row"> 
				<br />
				<div style="font-size:20px">Status d'annonce</div> 
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
				<p style="text-align:center;  color:red">---------------------------------------------</p>
			</div>
			<div class="row">
				<div style="font-size:20px">Vue par</div>
				<div class="row" style="margin: 30px">
					<div id="id_avatar1" style="display: inline">
				   		<img style="height: 50px; width: 50px" src="ressources/images/1.png">
					</div>
					<div id="id_avatar2" style="display: inline">
				   		<img style="height: 50px; width: 50px" src="ressources/images/1.png">
					</div>
					<div id="id_avatar3" style="display: inline">
				   		<img style="height: 50px; width: 50px" src="ressources/images/1.png">
					</div>
				</div>
			</div>
			<div class="row">
				<p style="text-align:center;  color:red">---------------------------------------------</p>
			</div>
			<div class="row">
				<div style="font-size:20px">Colocataires concernes</div>
				<div class="row" style="margin: 30px">
					<div id="id_avatar4" style="display: inline">
				   		<img style="height: 50px; width: 50px" src="ressources/images/1.png">
					</div>
					<div id="id_avatar5" style="display: inline">
				   		<img style="height: 50px; width: 50px" src="ressources/images/1.png">
					</div>
				</div>
			</div>
			<div class="row">
				<p style="text-align:center;  color:red">---------------------------------------------</p>
			</div>
			<div class="row" >
				<div style="font-size:20px">Correspondance à votre profil:</div>
				<div id="correspondance" style="font-size:30px; background-color: lightblue; text-align:center; margin:30px">78%</div>
			</div>
			<div class="row">
				<p style="text-align:center;  color:red">---------------------------------------------</p>
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
				<button id="interet" type="button" class="btn btn-primary" style="text-align:center; color:rgb(255, 255, 255); margin: 30px" onclick="changeColor(this)">Je suis interesse(e)</button>
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
                		
                		<!-- Lieu & sexe -->
	                	<div class="row">
			    			<div class="col-md-6">
								<input type="text" class="form-control input-sm" placeholder="Lieu" required></input>
							</div>
							<div class="col-md-6">
								<div class="row perso-edit-sex top-margin-5">
					    			<div class="col-md-6">
						    			<label class="radio-inline"><input type="radio" name="optradio">Homme</label>
						    		</div>
						    		<div class="col-md-6">
										<label class="radio-inline"><input type="radio" name="optradio">Femme</label>
									</div>
		    					</div>
							</div>
			    		</div>
                	
	                	<div class="row top-margin-10">
			    			<label class="col-md-2">Budget</label>
	
			    			<div class="col-md-3">
			    				<input type="text" class="form-control input-sm" placeholder="Min"></input>
			    			</div>
			    			<div class="col-md-1">
			    				<p>-</p>
			    			</div>
			    			<div class="col-md-3">
			    				<input type="text" class="form-control input-sm" placeholder="Max"></input>
			    			</div>
			    			<div class="col-md-1">
			    				<p>euros</p>
			    			</div>
			    		</div>
			    		
			    		<!-- Date de naissance -->
			    		<div class="row top-margin-10">
			    			<label class="col-md-2">Duree</label>
			    			
				    		
				    			<div class="col-md-4">
					    			<div class="input-group" id="birthdaypicker">
					                    <input type="text" class="form-control input-sm" placeholder="Date de debut"/>
					                    <span class="input-group-addon">
					                        <span class="glyphicon glyphicon-calendar"></span>
					                    </span>
					                </div>
								</div>
								<div class="col-md-4">
					    			<div class="input-group" id="birthdaypicker">
					                    <input type="text" class="form-control input-sm" placeholder="Date de fin"/>
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
			    				<input type="text" class="form-control input-sm" placeholder="Min"></input>
			    			</div>
			    			<div class="col-md-1">
			    				<p>-</p>
			    			</div>
			    			<div class="col-md-3">
			    				<input type="text" class="form-control input-sm" placeholder="Max"></input>
			    			</div>
			    			<div class="col-md-1">
			    				<p>ans</p>
			    			</div>
		    		
			    		</div>
			    		
			    		<div class="row top-margin-10">
			    			<label class="col-md-6">Animaux d'accompagnie</label>
					    	<div class="col-md-2">
						    	<label class="radio-inline"><input type="radio" name="optradio">oui</label>
						    </div>
						    <div class="col-md-2">
								<label class="radio-inline"><input type="radio" name="optradio">non</label>
							</div>
		    			</div>
			    		<div class="row top-margin-10">
			    				<!-- nationnalite -->
			    				<label class="col-md-2">Nationnalite</label>
			    		</div>
			    		
			    		<div class="row top-margin-10">
			    			<label class="col-md-4">Langues parlees</label>
			    		</div>
			    		
			    		<div class="row top-margin-10">
			    			<label class="col-md-4">Ecole</label>
			    		</div>
                	</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                    <button type="button" class="btn btn-primary">Appliquer</button>
                </div>
            </div>
        </div>
    </div>
	
	
	<div id="footer">footer</div>
	
	<script type="text/javascript"> 
		//alert('${userProfile}');
		//var str = '${userProfile}';
		//var user = eval('(' + str + ')');
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
		if(annonce[0]['haspet']==="0")
			document.getElementById("animalA").innerHTML = "non";
		else
			document.getElementById("animalA").innerHTML = "oui";
		if(annonce[0]['sex']==="1")
			document.getElementById("sexeA").innerHTML = "Homme";
		else if(annonce[0]['sex']==="0")
			document.getElementById("animal").innerHTML = "Femme"; 
		
		/* document.getElementById("age").innerHTML = jsGetAge(user[0]['birthday']);
		document.getElementById("sexe").innerHTML = checkSex(user[0]['sex']);  */
		
	</script>

</body>
</html>