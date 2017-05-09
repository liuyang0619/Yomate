<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Espace Personnel</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Yomate"/>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="ressources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="ressources/css/yomate-style.css" rel="stylesheet" type="text/css" media="all" />
<link href="ressources/css/buttons.css" rel="stylesheet" type="text/css" media="all" />

<!-- js -->
<script src="ressources/js/jquery-1.11.1.min.js"></script>
<!-- //js -->

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

<!-- Info perso -->
	<div class="contact">
		<div class="container">
			<div class = "row">
				<div class="col-md-4">
					<h1 style= "color:#FF66FF; margin-left:10px">Espace Personnel</h1>
				</div>
			</div>
			<div class = "row">
				<br>
			</div>
			<div class = "row">
				<div class="col-md-2" style = "text-align:center">
					<img src="ressources/images/4.png" class="img-thumbnail" style = "width:100px;height:100px">
				</div>
				<div class="col-md-4">
					<p style = "font-weight:bolder;font-size:25px">Paul Babiste</p>
					<p>Homme, 23 ans</p>
				</div>
			</div class = "row">
			<div class = "row">
				<br>
			</div>
			<div class="col-md-12">
				<div class="col-md-8">
					<div class="sap_tabs"  style = "border-radius:5px 5px 5px 5px; border:3px solid #FF66FF;">	
						<div id="horizontalTabProfilPhoto" style="display: block; width: 100%; margin: 0px;">
							<ul class="resp-tabs-list">
							  <li class="resp-tab-item grid1" aria-controls="tab_item-0" role="tab" style = "padding:10px 10px 10px 10px"><span>Mon profile</span></li>
							  <li class="resp-tab-item grid2" aria-controls="tab_item-1" role="tab" style = "padding:10px 10px 10px 10px"><span>Mes photos</span></li>
							  <div class="clear"></div>
							</ul>				  	 
							<div class="resp-tabs-container">
								<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Région:</span>
											<span id = "region">Paris, France</span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Animal de compagnie:</span>
											<span id = "haspet">Non</span>
										</div>
									</div>
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Situation:</span>
											<span id = "situation">Etudiant</span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Langue:</span>
											<span id = "langue">Français, Chinois</span>
										</div>
									</div>
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Nationnalité:</span>
											<span id = "nationnalite">Française</span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Loisir:</span>
											<span id = "loisir">Basketball</span>
										</div>
									</div>
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Situation familiale:</span>
											<span>Célibataire</span>
										</div>
										
									</div>
									<div class = "row">
										<div class = "col-md-6"></div>
										<div class = "col-md-2">
											<button class = "button button-action button-rounded button-small">Editer</button>
										</div>
									</div>
								</div>
								<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
									<img src="ressources/images/6.jpg" class="img-thumbnail" style= "height: 100px; width: 100px">
									<img src="ressources/images/8.jpg" class="img-thumbnail" style= "height: 100px; width: 100px">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="row" style = "text-align:center">
		                <button class = "button button-caution button-rounded button-large">Créer une annonce</button>					
		            </div>
				</div>
			</div>
			
			<div class="col-md-12" style = "margin-top:10px;">
				<div class="col-md-8">
					<div class="sap_tabs" style = "border-radius:5px 5px 5px 5px; border:3px solid #FF66FF;">	
						<div id="horizontalTabAnnonce" style="display: block; width: 100%; margin: 0px;">
							<ul class="resp-tabs-list">
							  <li class="resp-tab-item grid1" aria-controls="tab_item-0" role="tab" style = "padding:10px 10px 10px 10px"><span>Annonces favoris</span></li>
							  <li class="resp-tab-item grid2" aria-controls="tab_item-1" role="tab" style = "padding:10px 10px 10px 10px"><span>Mes annonces</span></li>
							  <div class="clear"></div>
							</ul>				  	 
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
										<a class="list-group-item">
											<div>
										    	<h4 class="list-group-item-heading" style = "font-size:18px">Annonce 1543</h4>
											    <div style = "height:100px">
											    	<div style="float: left;">
											    		<img src="ressources/images/1.png" class="img-thumbnail" style = "height:100px;height:100px;">
													</div>
													<div style="float: left;margin-left:10px">
														<p class = "list-group-item-text"  style = "font-weight: bolder; font-size:25px">Jean Gregory </p>
														<p class = "list-group-item-text"  style = "font-weight: bolder">26 ans, Paris, france</p>
														<p class = "list-group-item-text">Je cherche une colocataire...</p>					  
													</div>
													<div style="float: left;margin-left:200px">
														<button class = "button button-caution button-circle button-small" style = "font-weight : bolder; font-size:20px">X</button> 
													</div>
												</div>
										    </div>
										</a>
									</ul>
								</div>
								<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
									<ul class="list-group">
										<a class="list-group-item">AnnonceH1</a>
										<a class="list-group-item">Annonce2</a>
										<a class="list-group-item">Annonce3</a>
										<a class="list-group-item">Annonce4</a>
										<a class="list-group-item">Annonce5</a>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<ul class="list-group" style = "border-radius:5px 5px 5px 5px; border:3px solid #FF66FF;">
						<li class="list-group-item">Avis 1</li>
						<li class="list-group-item">Avis 2</li>
						<li class="list-group-item">Avis 3</li>
						<li class="list-group-item">Avis 1</li>
						<li class="list-group-item">Avis 1</li>
					</ul>		
				</div>
			</div>
			
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //Info perso -->

<!-- footer -->
	<div id="footer"></div>
<!-- //footer -->

<!-- for bootstrap working -->
	<script src="ressources/js/bootstrap.js"> </script>
<!-- //for bootstrap working -->
</body>
</html>