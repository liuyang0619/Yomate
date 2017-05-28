<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<spring:url value="ressources/css/animate.css" var="animateCss" /> 
	<spring:url value="ressources/css/bootstrap.css" var="bootstrapCss" /> 
	<spring:url value="ressources/css/style.css" var="styleCss" /> 
	<spring:url value="ressources/js/jquery-1.11.1.min.js" var="jqueryJs" /> 
	<spring:url value="ressources/css/flexslider.css" var="flexsliderCss" /> 
	<spring:url value="ressources/js/jquery.flexslider.js" var="jqueryFlexsliderJs" /> 

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

<!-- <link href="ressources/bootstrap-switch-master/dist/css/bootstrap2/bootstrap-switch.css" rel="stylesheet" type="text/css" media="all" /> --> 
<%-- <link href="<c:url value="ressources/css/style.css" />" rel="stylesheet" type="text/css" media="all" />  --%>
<link href="${styleCss}"  rel="stylesheet" type="text/css" media="all" /> 
<!-- js -->
<%-- <script src="<c:url value="ressources/js/jquery-1.11.1.min.js" />" ></script> --%>
<script src="${jqueryJs}"></script>
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
	<div class="col-md-12"> 
		<div class="col-md-8" >
			<div class="raw" style="vertical-align:middle">
			<div class="col-md-12">
				<div class="col-md-6">
					<div id="id_avatar">
			   			<img src="ressources/images/1.png">
					</div>
				</div>
							
				<div class="col-md-6">
					<div style="font-size:30px"><strong>LIU Yang</strong></div>
					<div>Sexe</div>
					<div>Age</div>
					<div>Description</div>
				</div>
			</div>
			</div>
			<div class="col-md-12">
				<br />
				<br />
			</div>
			<div class="col-md-12" style="border:1px dashed red">
				 <div class="col-md-12">
				 	<div style="font-size:30px">Profil personnel</div>
				 </div>
				
				<div class="raw">
					<div class="col-md-6">
						<div>Région:</div>
						<div>Profession:</div>
						<div>Nationnalité:</div>
						<div>Situation familiale:</div>
					</div>
				</div>
				<div class="raw">
					<div class="col-md-6"  >
						<div>Langue(s):<!-- <div id="langue">test</div> --></div>
						<div>Loisirs:<div id="loisir"></div></div>
						<div>Habitude horaire:</div>
						<div>Animaux d'accompagnie:</div>
					</div>
				</div>
				<div class="col-md-12">
					<br />
				</div>
				<div class="col-md-12">
				 	<button class = "button button-action button-rounded button-small" style="align:right; float:right">Editer</button>
				 </div>
			</div>
			<div class="col-md-12">
				<br />
				<br />
			</div>
			<div class="col-md-12" style="border:1px dashed red"> 
				<div style="font-size:30px">Informations d'annonce</div>
				<div class="col-md-8">
					<div>Lieu:</div>
					<div>Budget:</div>
					<div>Durée:</div>
					<div>Logement:</div>
				</div>
				<div class="col-md-12">
					<br />
				</div>
				<div class="col-md-12">
				 	<button class = "button button-action button-rounded button-small" style="align:right; float:right">Editer</button>
				 </div>
			</div>
			<div class="col-md-12">
				<br />
				<br />
			</div>
			<div class="col-md-12" style="border:1px dashed red">
				<div class="col-md-8" style="border:1px dashed red">
					<div style="font-size:30px">Filtre de profil</div>
					<div class="col-md-12">
						<div style="font-size:20px" id="obligatoire" ondrop="drop(event)" ondragover="allowDrop(event)">Obligatoires:</div>
					</div>
					<div class="col-md-12">
						<div style="font-size:20px" id="important" ondrop="drop(event)" ondragover="allowDrop(event)">Importants:</div>
					</div>
					<div class="col-md-12">
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
			<div class="col-md-12">
				<p style="text-align:center;  color:red">---------------------------------------------</p>
			</div>
			<div class="col-md-12"> 
					<br />
					<div style="font-size:20px">Status d'annonce</div> 
					<br />
					<div class="col-md-12">
					<!-- <div class="switch">
						<input type="checkbox"  class="switch" name="mybox" checked>
						<script>
							$(document).ready(function() {
						        $("[name='mybox']").bootstrapSwitch();
						    });
						</script>
					</div> -->
						<center>
							<label class="switch" style="float:center" > 
							  	<input type="checkbox" checked>
							  	<div class="slider">
							  	<span class="on">Ouvert</span><span class="off">Fermé</span>
							  </div>
							</label>
						</center>
						
					
					</div>
					<br />
			</div>
			
			<div class="col-md-12">
				<p style="text-align:center;  color:red">---------------------------------------------</p>
			</div>
			<div class="col-md-12">
				<div style="font-size:20px">Vue par</div>
				<div class="col-md-12" style="margin: 30px">
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
			<div class="col-md-12">
				<p style="text-align:center;  color:red">---------------------------------------------</p>
			</div>
			<div class="col-md-12">
				<div style="font-size:20px">Colocataires concernés</div>
				<div class="col-md-12" style="margin: 30px">
					<div id="id_avatar4" style="display: inline">
				   		<img style="height: 50px; width: 50px" src="ressources/images/1.png">
					</div>
					<div id="id_avatar5" style="display: inline">
				   		<img style="height: 50px; width: 50px" src="ressources/images/1.png">
					</div>
					<div id="id_avatar6" style="display: inline">
				   		<img style="height: 50px; width: 50px" src="ressources/images/1.png">
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<p style="text-align:center;  color:red">---------------------------------------------</p>
			</div>
			<div class="col-md-12" >
					<div style="font-size:20px">Correspondance à votre profil:</div>
					<div id="correspondance" style="font-size:30px; background-color: lightblue; text-align:center; margin:30px">78%</div>
			</div>
			<div class="col-md-12">
				<p style="text-align:center;  color:red">---------------------------------------------</p>
			</div>
			<div class="col-md-12">
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
				<button id="interet" type="button" class="btn btn-primary" style="text-align:center; color:rgb(255, 255, 255); margin: 30px" onclick="changeColor(this)">Je suis intéressé(e)</button>
			</div>
			<!-- <div class=""col-md-12">
				<div class="resp-tabs-container">
								<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<ul class="list-group">
										<a class="list-group-item">
											<div>
										    	<h4 class="list-group-item-heading" style = "font-size:18px">Annonce 1113</h4>
											    <div style = "height:100px">
											    	<div style="float: left;">
											    		<img src="ressources/images/1.png" class="img-thumbnail" style = "height:100px;height:100px;">
													</div>
													<div style="float: left;margin-left:10px">
														<p class="list-group-item-text"  style = "font-weight: bolder; font-size:25px">Jean Gregory </p>
														<p class="list-group-item-text"  style = "font-weight: bolder">26 ans, Paris, france</p>
														<p class="list-group-item-text">Je cherche une colocataire...</p>  					  
													</div>
													<div style="float: left;margin-left:200px">
														<button class = "button button-caution button-circle button-small" style = "font-weight : bolder; font-size:20px">X</button> 
													</div>
												</div>
										    </div>
										</a>
										<a class="list-group-item">
											<div>
										    	<h4 class="list-group-item-heading" style = "font-size:18px">Annonce 1543</h4>
											    <div style = "height:100px">
											    	<div style="float: left;">
											    		<img src="ressources/images/1.png" class="img-thumbnail" style = "height:100px;height:100px;">
													</div>
													<div style="float: left;margin-left:10px">
														<p class="list-group-item-text"  style = "font-weight: bolder; font-size:25px">Jean Gregory </p>
														<p class="list-group-item-text"  style = "font-weight: bolder">26 ans, Paris, france</p>
														<p class="list-group-item-text">Je cherche une colocataire...</p>  					  
													</div>
													<div style="float: left;margin-left:200px">
														<button class = "button button-caution button-circle button-small" style = "font-weight : bolder; font-size:20px">X</button> 
													</div>
												</div>
										    </div>
										</a>
									</ul>
			</div> -->
								<!-- <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
									<ul class="list-group">
										<a class="list-group-item">AnnonceH1</a>
										<a class="list-group-item">Annonce2</a>
										<a class="list-group-item">Annonce3</a>
										<a class="list-group-item">Annonce4</a>
										<a class="list-group-item">Annonce5</a>
									</ul>
								</div> -->
							<!-- </div>
			 </div> -->
		</div>
	</div>
	</div>
	</div>
	
	
	
	
	
	<div id="footer">footer</div> 
</body>
</html>