<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>

<html>
<head>
<title>Espace Personnel</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset=utf-8" />
<meta name="keywords" content="Yomate"/>

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

<!-- variable -->


<!-- header & footer -->
<script type="text/javascript"> 
	$(function(){
		$("#header").load("/Yomate/header.jsp");
		$("#footer").load("/Yomate/footer.jsp");
	});
</script>
<!-- //header & footer -->

<!-- birthday picker -->
<script type="text/javascript">
$(function () {
    $('#birthdaypicker').datetimepicker({format: 'DD/MM/YYYY'});
});
</script>
<!-- //birthday picker -->

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
/*根据出生日期算出年龄*/
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
				returnAge = 0;//同年 则为0岁  
			} else {
				var ageDiff = nowYear - birthYear; //年之差  
				if (ageDiff > 0) {
					if (nowMonth == birthMonth) {
						var dayDiff = nowDay - birthDay;//日之差  
						if (dayDiff < 0) {
							returnAge = ageDiff - 1;
						} else {
							returnAge = ageDiff;
						}
					} else {
						var monthDiff = nowMonth - birthMonth;//月之差  
						if (monthDiff < 0) {
							returnAge = ageDiff - 1;
						} else {
							returnAge = ageDiff;
						}
					}
				} else {
					returnAge = -1;//返回-1 表示出生日期输入错误 晚于今天  
				}
			}
			return returnAge;//返回周岁年龄  
		}
</script>
<!-- //calculate age -->

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
</head>
	
<body>

<!-- header -->
	<div id="header"></div>
<!-- //header -->

<!-- Info perso -->
	<div class="perso-info">
		<div class="container">
			<div class = "row top-margin-20 bottom-margin-20">
				<div class="col-md-2" style = "text-align:center">
					<img src="/Yomate/ressources/images/4.png" class="img-thumbnail" style = "width:100px;height:100px">
				</div>
				<div class="col-md-10">
					<p style = "font-weight:bolder;font-size:25px"><span id="nom"></span> <span id="prenom"></span></p>
					<p><span id="sexe"></span>, <span id="age"></span> ans</p>
				</div>
			</div>
			<div class="col-md-12">
				<div class="col-md-8">
					<div class="sap_tabs perso-profile">	
						<div id="horizontalTabProfilPhoto">
							<ul class="resp-tabs-list">
							  <li class="resp-tab-item perso-profile-tab" aria-controls="tab_item-0" role="tab" style = "padding:10px 10px 10px 10px"><span>Mon profile</span></li>
							  <li class="resp-tab-item perso-profile-tab" aria-controls="tab_item-1" role="tab" style = "padding:10px 10px 10px 10px"><span>Mes photos</span></li>
							</ul>				  	 
							<div class="resp-tabs-container perso-profile-info">
								<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Situation:</span>
											<span id = "situation">Etudiant</span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Animal de compagnie:</span>
											<span id = "haspet">Non</span>
										</div>
									</div>
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Nationnalité:</span>
											<span id = "nationnalite">Française</span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Langue:</span>
											<span id = "langue">Français, Chinois</span>
										</div>
									</div>
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Situation familiale:</span>
											<span>Célibataire</span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Loisir:</span>
											<span id = "loisir">Basketball</span>
										</div>
									</div>
									
									<!-- Trigger the personal info modal with a button -->
									<div class = "row">
										<div class = "col-md-12">
											<button class = "btn btn-success search-btn perso-edit-btn" data-toggle="modal" data-target="#editInfo">Editer  <span class="glyphicon glyphicon-edit"></span></button>
										</div>
									</div>
								</div>
								<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
									<img src="/Yomate/ressources/images/6.jpg" class="img-thumbnail perso-profile-photo">
									<img src="/Yomate/ressources/images/8.jpg" class="img-thumbnail perso-profile-photo">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="row" style = "text-align:center">
		                <a class = "btn btn-warning search-btn href="/Yomate/PageAnnonce.jsp">Créer une annonce</a>					
		            </div>
				</div>
			</div>
			
			<div class="col-md-12" style = "margin-top:10px;">
				<div class="col-md-8">
					<div class="sap_tabs perso-posts">	
						<div id="horizontalTabAnnonce">
							<ul class="resp-tabs-list">
							  <li class="resp-tab-item perso-profile-tab" aria-controls="tab_item-0" role="tab"><span>Annonces favoris</span></li>
							  <li class="resp-tab-item perso-profile-tab" aria-controls="tab_item-1" role="tab"><span>Mes annonces</span></li>
							</ul>				  	 
							<div class="resp-tabs-container">
								<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<ul class="list-group">
										<a class="list-group-item">
									    	<h4 class="list-group-item-heading" style = "font-size:18px">Annonce 1113</h4>
										    <div style = "height:100px">
										    	<div style="float: left;">
										    		<img src="/Yomate/ressources/images/1.png" class="img-thumbnail" style = "height:100px;height:100px;">
												</div>
												<div style="float: left;margin-left:10px">
													<p class="list-group-item-text"  style = "font-weight: bolder; font-size:25px">Jean Gregory </p>
													<p class="list-group-item-text"  style = "font-weight: bolder">26 ans, Paris, france</p>
													<p class="list-group-item-text">Je cherche une colocataire...</p>  					  
												</div>
												<button class = "button button-caution button-circle button-small perso-rm-btn"><i class="glyphicon glyphicon-trash"></i></button> 
											</div>
										</a>
										<a class="list-group-item">
									    	<h4 class="list-group-item-heading" style = "font-size:18px">Annonce 1543</h4>
										    <div style = "height:100px">
										    	<div style="float: left;">
										    		<img src="/Yomate/ressources/images/1.png" class="img-thumbnail" style = "height:100px;height:100px;">
												</div>
												<div style="float: left;margin-left:10px">
													<p class="list-group-item-text"  style = "font-weight: bolder; font-size:25px">Jean Gregory </p>
													<p class="list-group-item-text"  style = "font-weight: bolder">26 ans, Paris, france</p>
													<p class="list-group-item-text">Je cherche une colocataire...</p>  					  
												</div>
												<button class = "button button-caution button-circle button-small perso-rm-btn"><i class="glyphicon glyphicon-trash"></i></button> 
											</div>
										</a>
										<a class="list-group-item">
									    	<h4 class="list-group-item-heading" style = "font-size:18px">Annonce 1543</h4>
										    <div style = "height:100px">
										    	<div style="float: left;">
										    		<img src="/Yomate/ressources/images/1.png" class="img-thumbnail" style = "height:100px;height:100px;">
												</div>
												<div style="float: left;margin-left:10px">
													<p class = "list-group-item-text"  style = "font-weight: bolder; font-size:25px">Jean Gregory </p>
													<p class = "list-group-item-text"  style = "font-weight: bolder">26 ans, Paris, france</p>
													<p class = "list-group-item-text">Je cherche une colocataire...</p>					  
												</div>
												<button class = "button button-caution button-circle button-small perso-rm-btn"><i class="glyphicon glyphicon-trash"></i></button> 
											</div>
										</a>
									</ul>
								</div>
								<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
									<ul class="list-group">
										<a class="list-group-item">Annonce1</a>
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


<!-- Personal info Modal -->
<div class="modal fade" id="editInfo" role="dialog">
	<div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	    	<div class="modal-header">
	    		<button type="button" class="close" data-dismiss="modal">&times;</button>
	    		<h4 class="modal-title">Editer votre profil</h4>
	    	</div>
	    	<div class="modal-body">
	    		<!--  & prénom -->
	    		<div class="row">
	    			<div class="col-md-6">
						<input type="text" class="form-control input-sm" placeholder="Nom" required></input>
					</div>
					<div class="col-md-6">
						<input type="text" class="form-control input-sm" placeholder="Prénom" required></input>
					</div>
	    		</div>
	    		<!-- //Nom & prénom -->
	    		
	    		<!-- Sexe -->
	    		<div class="row perso-edit-sex top-margin-5">
	    			<div class="col-md-6">
		    			<label class="radio-inline"><input type="radio" name="optradio">Homme</label>
		    		</div>
		    		<div class="col-md-6">
						<label class="radio-inline"><input type="radio" name="optradio">Femme</label>
					</div>
	    		</div>
	    		<!-- //Sexe -->
	    		
	    		<!-- Date de naissance -->
	    		<div class="row top-margin-5">
	    			<div class="col-md-12">
		    			<div class="input-group" id="birthdaypicker">
		                    <input type="text" class="form-control input-sm" placeholder="Date de naissance"/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
					</div>
	    		</div>
	    		<!-- //Date de naissance -->
	    		
	    		<!-- Situation -->
	    		<div class="row top-margin-10">
	    			<label class="col-md-4" for="situation">Situation/Profession</label>
	    			<div class="form-group col-md-8">
						<select id="selectSituation" name="selectSituation" class="form-control">
							<option value="0" selected disabled></option>
							<option value="1">Etudiant</option>
							<option value="2">Salarié</option>
							<option value="3">Retraité(e)</option>
							<option value="4">APL</option>
							<option value="5">Autre</option>
					    </select>
					</div>
	    		</div>
	    		<!-- //Situation -->
	    		
	    		<!-- Situation Familiale-->
	    		<div class="row">
	    			<label class="col-md-4" for="situ-fam">Situation Familiale</label>
	    			<div class="form-group col-md-8">
						<select id="selectSituation" name="selectSituationFamiliale" class="form-control" required>
							<option value="0" selected disabled></option>
							<option value="1">Célibataire</option>
							<option value="2">En couple</option>
							<option value="3">Marié(e)</option>
					    </select>
					</div>
	    		</div>
	    		<!-- //Situation Familiale-->
	    		
	    		<!-- Nationalité-->
	    		<div class="row">
	    			<label class="col-md-4" for="nationalite">Nationalité</label>
	    			<div class="col-md-8">
	    				
					</div>
	    		</div>
	    		<!-- //Nationalité-->
	    		
	    		<!-- Langue parlée & Loisirs-->
	    		<div class="row">
	    			<!-- Langue parlée-->
	    			<div class="col-md-6">
	    			
	    			</div>
	    			<!-- Langue parlée-->
	    			
	    			<!-- Loisirs-->
	    			<div class="col-md-6">
	    			</div>
	    			<!-- //Loisirs-->
	    		</div>
	    		<!-- //Langue parlée & Loisirs-->

	    	</div>
	    	<div class="modal-footer">
	    		<div class = "row">
	    			<div class="perso-edit-footer">
	    				<button type="button" class="btn button-caution button-pill" data-dismiss="modal">Annuler</button>
	    				<button type="button" class="btn button-action button-pill" data-dismiss="modal">Valider</button>
	    			</div>
	    		</div>
	    	</div>
	    </div>
	    <!-- //Modal content-->
  	</div>
</div>
<!-- //Personal info Modal -->


<!-- footer -->
	<div id="footer"></div>
<!-- //footer -->

<!-- tab switching-->
<script src=<c:url value="${path}/ressources/js/easyResponsiveTabs.js" /> ></script>	
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
</script>
<!-- variable -->
	<script type="text/javascript"> 
		//alert('${userProfile}');
		//var str = '${userProfile}';
		//var user = eval('(' + str + ')');
		var json = '${userProfile}';
		//alert(json);
		var user = JSON.parse(json);
		document.getElementById("nom").innerHTML = user[0]['nom'];
		document.getElementById("prenom").innerHTML = user[0]['prenom'];
		document.getElementById("age").innerHTML = jsGetAge(user[0]['birthday']);
		document.getElementById("sexe").innerHTML = checkSex(user[0]['sex']);
		
		
		
		
		
	</script>
<!-- //variable -->
<!-- //tab switching -->

</body>


</html>