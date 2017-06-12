<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>

<html>
<head>
<title>Espace Personnel</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8" />
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
    $('#birthdaypicker').datetimepicker({format: 'YYYY/MM/DD'});
    $('#dateDebutPicker').datetimepicker({format: 'YYYY/MM/DD'});
    $('#dateFinPicker').datetimepicker({format: 'YYYY/MM/DD'});
});
</script>
<!-- //birthday picker -->

<!-- check user id  -->
<script type="text/javascript">
function checkUserId(info){
	var userLog = getCookie("idUser");
	if (userLog == info){
		$('#buttonEditer').show();
		$('#buttonEditerAnnonce').show();
		
	}
	else{
		$('#buttonEditer').hide();
		$('#buttonEditerAnnonce').hide();
	}
	
}
</script>
<!-- //check user id  -->

<!-- check value vide -->
<script type="text/javascript">
function checkVide(input,value) {
	if (value === "null" || value == undefined){
	}
	else{
		document.getElementById(input).innerHTML = value;
	}
}
</script>
<!-- //check value vide -->

<!-- check sex -->
<script type="text/javascript">
function checkSex(strSex) {
	var sexe;
	if (strSex === "0")
	{
		sexe = "Homme";
	}
	else if (strSex === "1")
	{
		sexe = "Femme";
	}
	return sexe;
}
</script>
<!-- //check sex -->
<!-- check haspet -->
<script type="text/javascript">
function checkHasPet(strPet) {
	if (strPet === "null" || strPet == undefined ){
		return "";
	}
	else{
		var haspet = "non";
		if (strPet === "0")
		{
			haspet = "non";
		}
		else if (strPet === "1")
		{
			haspet = "oui";
		}
		return haspet;
	}
}
</script>
<!-- //check haspet -->

<!-- radiobutton sex -->
<script type="text/javascript">
	function GetRadioValue(RadioName){
    var obj;    
    obj=document.getElementsByName(RadioName);
    if(obj!=null){
        var i;
        for(i=0;i<obj.length;i++){
            if(obj[i].checked){
                return obj[i].value;            
            }
        }
    }
    return null;
}
</script>
<!-- radiobutton sex -->
<!-- calculate age -->
<script type="text/javascript">
function jsGetAge(strBirthday) {
	if (strBirthday === null){
		return -1;
	}
	var returnAge;
	var strBirthdayArr = strBirthday.split("-");
	var birthYear = strBirthdayArr[0];
	var birthMonth = strBirthdayArr[1];
	var birthDay = strBirthdayArr[2];

	d = new Date();
	var nowYear = d.getFullYear();
	var nowMonth = d.getMonth() + 1;
	var nowDay = d.getDate();

	if (nowYear == birthYear) {
		returnAge = 0;
	} else {
		var ageDiff = nowYear - birthYear;
		if (ageDiff > 0) {
			if (nowMonth == birthMonth) {
				var dayDiff = nowDay - birthDay;
				if (dayDiff < 0) {
					returnAge = ageDiff - 1;
				} else {
					returnAge = ageDiff;
				}
			} else {
				var monthDiff = nowMonth - birthMonth;
				if (monthDiff < 0) {
					returnAge = ageDiff - 1;
				} else {
					returnAge = ageDiff;
				}
			}
		} else {
			returnAge = -1;
		}
	}
	return returnAge;
}
</script>
<!-- //calculate age -->
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
    	//alert("profession Ã©tudiant");
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
    	nationnalite = "Française";
        break;
    case "41":
    	nationnalite = "Chinoise";
        break;
    case "83":
    	nationnalite = "Italienne";
        break;
    case "148":
    	nationnalite = "Russee";
        break;
    case "14":
    	nationnalite = "Bahamienne";
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
<!-- captical letter -->
<script type="text/javascript">
function setUCfirst(string) 
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}
</script>
<script type="text/javascript">
function checkAnnonceStatus(status){
	if (status === "0"){
		return "fermé";
	}
	else{
		return "ouvert";
	}
}
</script>
<!-- //captical letter -->
<script type="text/javascript">
function setResultList(jsonResults) {
		var results = JSON.parse(jsonResults);
		if (results[i]['image'] === null) {
			results[i]['image'] = "photo/photo.png";
		}
		for (var i = 0; i < results.length; i++) {
			var listitem = 
				"<a href=/Yomate/annonce/"+results[i]['idAnnonce']+" class='list-group-item'>" +
					"<div>" +
			    	"<h4 class='list-group-item-heading' style = 'font-size:18px'>Annonce 00" + results[i]['idAnnonce'] + "</h4>" +
				    "<div style = 'height:100px'>" +
				    	"<div style='float: left;'>" +
				    		"<img src='/Yomate/ressources/" + results[i]['image'] + "' class='img-thumbnail' style = 'height:100px;height:100px;'>" +
						"</div>" +
						"<div style='float: left;margin-left:10px'>" +
							"<p class='list-group-item-text'  style = 'font-weight: bolder; font-size:25px'>" + setUCfirst(results[i]['proposer_prenom']) + " "+ results[i]['proposer_nom'].toUpperCase() + "</p>" +
							"<p class='list-group-item-text'  style = 'font-weight: bolder'>"+ checkSex(results[i]['proposer_sex']) +", "+ jsGetAge(results[i]['proposer_birthday']) + " ans, "+ setUCfirst(results[i]['lieu']) + ", France</p>" +
							"<p class='list-group-item-text'>" +results[i]['description'] + "</p>" +
						"</div>" +
					"</div>" +
			    "</div>" +
				"</a>";
			$('#favorite-list-group').append(listitem);
		}
	
}
</script>
<script type="text/javascript">
function setResultHistoryList(jsonResults) {
		var results = JSON.parse(jsonResults);
		for (var i = 0; i < results.length; i++) {
			var listitem = 
				"<a href=/Yomate/annonce/"+results[i]['idAnnonce']+" class='list-group-item'>" +
					"<div>" +
			    	"<h4 class='list-group-item-heading' style = 'font-size:18px'>Annonce 00" + results[i]['idAnnonce'] + "</h4>" +
				    "<div style = 'height:100px'>" +
			
						"<div style='float: left;margin-left:10px'>" +
							"<p class='list-group-item-text'>" + "Lieu : " + results[i]['lieu']  + "</p>" +
							"<p class='list-group-item-text'>" + "Période : " + results[i]['date_debut'].split('-').join('/') + " - " + results[i]['date_fin'].split('-').join('/') + "</p>" +
							"<p class='list-group-item-text'>"+ "Status : "+ checkAnnonceStatus(results[i]['status']) + "</p>" +
							"<p class='list-group-item-text'>"+ "Description :" + results[i]['description'] + "</p>" +
						"</div>" +
					"</div>" +
			    "</div>" +
				"</a>";
			$('#history-list-group').append(listitem);
		}
}
</script>
<!-- select -->
<script type="text/javascript">
function setSelector(select,val) {
	var tag = "0";
	for(var i=0;i<document.getElementById(select).options.length;i++)
    {
        if(document.getElementById(select).options[i].text == val)
        {
            document.getElementById(select).options[i].selected = true;
            tag = "1";
            break;
        }
        if (tag === "0"){
        	document.getElementById(select).options[i].selected = true;
        }
    }
	
}
</script>
<!-- //selector -->

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
					<img id = "userImage" class="img-thumbnail" style = "width:100px;height:100px">
				</div>
				<div class="col-md-10">
					<p style = "font-weight:bolder;font-size:25px"><span id="nom"></span> <span id="prenom"></span></p>
					<p><span id="sexe"></span><span id="age"></span></p>
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
											<span style = "font-weight: bold">Lieu:</span>
											<span id = "lieu"></span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Ecole: </span>
											<span id = "ecole"></span>
										</div>
									</div>
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Situation:</span>
											<span id = "profession"></span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Animal de compagnie:</span>
											<span id = "haspet"></span>
										</div>
									</div>
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Nationnalité:</span>
											<span id = "nationnalite"></span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Langue:</span>
											<span id = "langue"></span>
										</div>
									</div>
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Situation familiale:</span>
											<span id ="situationFam"></span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Loisir:</span>
											<span id = "loisir"></span>
										</div>
									</div>
									
									<!-- Trigger the personal info modal with a button -->
									<div class = "row">
										<div class = "col-md-12">
											<button id = "buttonEditer" class = "btn btn-success search-btn perso-edit-btn" data-toggle="modal" data-target="#editInfo" onclick="editer()">Editer  <span class="glyphicon glyphicon-edit"></span></button>
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
		                <button id = "buttonEditerAnnonce" class = "btn btn-warning search-btn href="/Yomate/PageAnnonce.jsp" data-toggle="modal" data-target="#annonce">Créer une annonce></button>					
		            </div>
				</div>
			</div>
			
			<div class="col-md-12" style = "margin-top:10px;">
				<div class="col-md-8">
					<div class="sap_tabs perso-posts">	
						<div id="horizontalTabAnnonce">
							<ul class="resp-tabs-list">
							  <li class="resp-tab-item perso-profile-tab" aria-controls="tab_item-0" role="tab"><span>Mes Annonces</span></li>
							  <li class="resp-tab-item perso-profile-tab" aria-controls="tab_item-0" role="tab"><span>Annonces favoris</span></li>
							  	<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
									<ul class="list-group top-margin-3" id="history-list-group">
									<div class="col-md-12" style="text-align: center; color: #000000;" id="no-history">
										Vous n'avais pas d'annonce historique, veuillez créer les annonces.</div>
									</div>
									</ul>
									
								</div>
								 <div class="resp-tabs-container">
									<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
										<ul class="list-group top-margin-3" id="favorite-list-group">
										<div class="col-md-12" style="text-align:center;color:#000000;" id="no-favorite">
											Vous n'avais pas d'annonce favoris, veuillez trouver les annonces.
										</div>
										</ul>
										
									</div>
								
								
							</ul>
						
							 
											  	 
							
						</div>
					</div>
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
	    		<h4 class="modal-title">Editez votre profil</h4>
	    	</div>
	    	<div class="modal-body">
	    		<!-- Nom & prénom -->
	    		<div class="row">
	    			<div class="col-md-6">
						<input id = "reNom" type="text" class="form-control input-sm" placeholder="Nom"  required></input>
					</div>
					<div class="col-md-6">
						<input id = "rePrenom" type="text" class="form-control input-sm" placeholder="Prénom" required></input>
					</div>
	    		</div>
	    		<!-- //Nom & prÃ©nom -->
	    		
	    		<!-- Sexe -->
	    		<div class="row perso-edit-sex top-margin-5">
	    			<form id="sex" name="sex" method="post" action="">
	    				<div class="col-md-6">
		    				<label>
		    					<input id = "sex-homme" class="radio-inline" type="radio" name="groupsex" value="homme">Homme
		    				</label>
		    			</div>
		    			<div class="col-md-6">
		    				<label>
								<input id = "sex-femme" class="radio-inline" type="radio" name="groupsex" value="femme">Femme
							</label>
							
						</div>
					</form>
	    		</div>
	    		<!-- //Sexe -->
	    		
	    		<!-- Date de naissance -->
	    		<div class="row top-margin-5">
	    			<div class="col-md-12">
		    			<div class="input-group" id="birthdaypicker">
		                    <input type="text" class="form-control input-sm" id = "birthdaytext" placeholder="Date de naissance"/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
					</div>
	    		</div>
	    		<!-- //Date de naissance -->
	    		
	    		<!-- pet -->
	    		<div class="row perso-edit-sex top-margin-5">
	    			<div class = "col-md-6"> Animal de compagnie:</div>
	    			<form id="sex" name="hasPet" method="post" action="">
	    				<div class="col-md-3">
		    				<label>
		    					<input id = "haspet-yes" class="radio-inline" type="radio" name="grouphaspet" value="yes">oui
		    				</label>
		    			</div>
		    			<div class="col-md-3">
		    				<label>
								<input id = "haspet-no" class="radio-inline" type="radio" name="grouphaspet" value="no">non
							</label>
							
						</div>
					</form>
	    		</div>
	    		<!-- //pet -->
	    		
	    		<!-- lieu & ecole -->
	    		<div class="row">
	    			<div class="col-md-6">
	    				<label class="col-md-4 top-margin-3" for="reLieu">Lieu</label>
						<input id = "reLieu" type="text" class="form-control input-sm" placeholder="Lieu"  required></input>
					</div>
					<div class="col-md-6 top-margin-3">
					<label class="col-md-4" for="reEcole">Ecole</label>
						<input id = "reEcole" type="text" class="form-control input-sm" placeholder="Ecole" required></input>
					</div>
	    		</div>
	    		<!-- //lieu & ecole -->
	    		
	    		<!-- Situation -->
	    		<div class="row top-margin-10">
	    			<label class="col-md-4" for="situation">Situation/Profession</label>
	    			<div class="form-group col-md-8">
						<select id="selectProfession" name="selectProfession" class="form-control">
							<option value="0" selected disabled></option>
							<option value="39">étudiant</option>
							<option value="69">salarié</option>
							<option value="68">retraité</option>
							<option value="13">autre cadres</option>
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
	    				<select id="selectNationnalite" name="selectNationnalite" class="form-control" required>
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
	    		
	    		<!-- Langue parlé & Loisirs-->
	    		<div class="row">
	    			<!-- Langue parlé-->
	    			<label class="col-md-4" for="selectLangue">Langue</label>
	    			<div class="col-md-8 form-group">
	    				<select id="selectLangue" name="selectLangue" class="form-control" required>
							<option value="0" selected disabled></option>
							<option value="27">français</option>
							<option value="20">chinois mandarin</option>
							<option value="3">anglais</option>
							<option value="1">allemand</option>
							<option value="36">italien</option>
							<option value="73">autre</option>
					    </select>
					</div>
				</div>
	    		<!-- Langue parlé-->
	    		<div class="row">
	    			<!-- Loisirs-->
	    				<label class="col-md-4" for="selectLoisir">Loisir</label>
	    				<div class="col-md-8 form-group">
	    				<select id="selectLoisir" name="selectLoisir" class="form-control" required>
							<option value="0" selected disabled></option>
							<option value="2">voyage</option>
							<option value="3">sport</option>
							<option value="5">cuisine</option>
							<option value="19">jeux vidéo</option>
							<option value="9">lecture</option>
							<option value="35">autre</option>
					    </select>
					</div>
	    		</div>
	    		<!-- //Loisirs-->
	    		
	    	</div>
	    		<!-- //Langue parlé & Loisirs-->

	    	
	    	<div class="modal-footer">
	    		<div class = "row">
	    			<div class="perso-edit-footer">
	    				<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
	    				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="SendModifyRequest()" data-dismiss="modal">Valider</button>
	    			</div>
	    		</div>
	    	</div>
	    </div>
	    <!-- //Modal content-->
  </div>
 </div>
<!-- //Personal info Modal -->
<!-- Editer l'annonce	 --> 
	<div class="modal fade" id="annonce">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="purchaseLabel">Créez votre annonce</h4>
                </div>
                <div class="modal-body">
                	<div class="container-fluid">
                		
                		<!-- Lieu & budget -->
	                	<div class="row">
		                	<label class="col-md-2">Lieu</label>
		                	<div class="col-md-4">
								<input type="text" class="form-control input-sm" placeholder="annonceLieu" id="annonceLieu"></input>
			    			</div>
			    			<label class="col-md-2">Budget</label>
			    			<div class="col-md-2">
								<input type="text" class="col-md-3 form-control input-sm" placeholder="Budget" id="annonceBudget"></input>
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
						    			<label class="radio-inline"><input id = "annonceSex-homme" type="radio" value="0" name="sexeNew">Homme</label>
						    		</div>
						    		<div class="col-md-6">
										<label class="radio-inline"><input id = "annonceSex-femme" type="radio" value="1" name="sexeNew">Femme</label>
									</div>
		    					</div>
							</div>
			    		</div>
                	
	                	
			    		
			    		<!-- Durée -->
			    		<div class="row top-margin-10">
			    			<label class="col-md-2">Période</label>
				    			<div class="col-md-4">
					    			<div class="input-group" id="dateDebutPicker">
					                    <input type="text" class="form-control input-sm" id="dateStart" placeholder="Date de debut"/>
					                    <span class="input-group-addon">
					                        <span class="glyphicon glyphicon-calendar"></span>
					                    </span>
					                </div>
								</div>
								<div class="col-md-4">
					    			<div class="input-group" id="dateFinPicker">
					                    <input type="text" class="form-control input-sm" id="dateEnd" placeholder="Date de fin"/>
					                    <span class="input-group-addon">
					                        <span class="glyphicon glyphicon-calendar"></span>
					                    </span>
					                </div>
					             </div>
			    		</div>
			   			<!-- //Durée -->
			    		
			    		<div class="row top-margin-10">
			    			<label class="col-md-2">Age</label>
			    			
				    		<div class="col-md-3">
			    				<input type="text" class="form-control input-sm" placeholder="Min" id="ageMin"></input>
			    			</div>
			    			<div class="col-md-1">
			    				<p>-</p>
			    			</div>
			    			<div class="col-md-3">
			    				<input type="text" class="form-control input-sm" placeholder="Max" id="ageMax"></input>
			    			</div>
			    			<div class="col-md-1">
			    				<p>ans</p>
			    			</div>
		    		
			    		</div>
			    		
			    		<div class="row top-margin-10 bottom-margin-10">
			    			<label class="col-md-6">Animaux d'accompagnie</label>
					    	<div class="col-md-2">
						    	<label class="radio-inline"><input id = "annoncePet-yes" type="radio" value="1" name="animalNew">oui</label>
						    </div>
						    <div class="col-md-2">
								<label class="radio-inline"><input id = "annoncePet-non" type="radio" value="0" name="animalNew">non</label>
							</div>
		    			</div>

						<div class="row top-margin-3">
							<div class="col-md-3 search-filter-item-name">Logement</div>
							<div class="col-md-9">
								<select class="form-control input-sm" id="logement">
									<option value="" selected disabled></option>
									<option value="0">J'ai besoin de logement</option>
									<option value="1">J'ai un logement</option>
								</select>
							</div>
						</div>

				<!-- Situation -->
	    		<div class="row top-margin-10">
	    			<label class="col-md-4" for="situation">Situation/Profession</label>
	    			<div class="form-group col-md-8">
						<select id="annonceProfession" name="annonceProfession" class="form-control">
							<option value="0" selected disabled></option>
							<option value="39">étudiant</option>
							<option value="69">salarié</option>
							<option value="68">retraité</option>
							<option value="13">autre cadres</option>
					    </select>
					</div>
	    		</div>
	    		<!-- //Situation -->
	    		
		    	<!-- Situation Familiale-->
	    		<div class="row">
	    			<label class="col-md-4" for="situ-fam">Situation Familiale</label>
	    			<div class="form-group col-md-8">
						<select id="annonceSituation" name="annonceSituationFamiliale" class="form-control" required>
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
	    				<select id="annonceNationnalite" name="annonceNationnalite" class="form-control" required>
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
	    			<label class="col-md-4" for="annonceLangue">Language</label>
	    			<div class="col-md-8 form-group">
	    				<select id="annonceLangue" name="annonceLangue" class="form-control" required>
							<option value="0" selected disabled></option>
							<option value="27">français</option>
							<option value="20">chinois mandarin</option>
							<option value="3">anglais</option>
							<option value="1">allemand</option>
							<option value="36">italien</option>
							<option value="73">autre</option>
					    </select>
					</div>
				</div>
	    		<!-- Langue parlé-->
	    		
	    		<!-- Loisirs-->
	    		<div>
	    			<label class="col-md-4" for="annonceLoisir">Loisir</label>
	    			<div class="col-md-8 form-group">
	    				<select id="annonceLoisir" name="annonceLoisir" class="form-control" required>
							<option value="0" selected disabled></option>
							<option value="2">voyage</option>
							<option value="3">sport</option>
							<option value="5">cuisine</option>
							<option value="19">jeux vidéo</option>
							<option value="9">lecture</option>
							<option value="35">autre</option>
					    </select>
					</div>
	    		</div>
	    		<!-- //Loisirs-->
	    		
	    		<!-- Description -->
	    		<div class="row">
	    			<div class = "col-mod-6">
	    				<label>Description</label>
	    			</div>
	    			<div class="col-mod-6 top-margin-5"></div>
	    				<input id = "description" type="text" class="form-control input-sm " placeholder="Bonjour, je suis..."  required></input>
	    			</div>
	    		</div>
	    		<!-- //Description -->
	    		
             
               
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                    <button type="button" class="btn btn-primary" onClick="newAnnonce()" data-dismiss="modal">Valider</button>
                </div>
            </div>
          </div>
       </div>
     </div>
    </div>
           


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
<!-- initialize variable -->
<script type="text/javascript"> 
	//alert('${userProfile}');
	var json = '${userProfile}';
	var user = JSON.parse(json);
	if (user[0] == undefined){
		
	}
	else{
		user = user[0];
	}
	checkUserId(user['idUser']);
	checkVide("nom", user['nom']);
	checkVide("prenom", user['prenom']);
	if (user['image'] === null){
		$("#userImage").attr("src", "/Yomate/ressources/photo/photo.png");
	}
	else{
		$("#userImage").attr("src", "/Yomate/ressources/"+user['image']);
	}
	document.getElementById("sexe").innerHTML = checkSex(user["sex"]);
	document.getElementById("haspet").innerHTML=checkHasPet(user["haspet"]);
	if (jsGetAge(user['birthday']) != -1){
		document.getElementById("age").innerHTML = ", " +jsGetAge(user['birthday'])+" ans";
	}
	checkVide("lieu", user['lieu']);
	checkVide("ecole", user['ecole']);
	checkVide("profession", checkProfession(user['profession']));
	checkVide("nationnalite", checkNationnalite(user['nationnalite']));
	checkVide("langue", checkLangue(user['language']));
	checkVide("situationFam", user['situationFam']);
	checkVide("loisir", checkLoisir(user['loisir']));
</script>
<!-- //initialize variable -->
<!-- initialize annonce favorite -->
<script type="text/javascript">
var jsonAnnonce = '${AnnonceFavorite}';
var jsonHistory = '${AnnonceHistorique}';
if (jsonAnnonce === "") {
	$('#no-favorite').show();
} else {
	$('#no-favorite').hide();
	setResultList(jsonAnnonce);
}
if (jsonHistory === "") {
	$('#no-history').show();
} else {
	$('#no-history').hide();
	setResultHistoryList(jsonHistory);
}
</script>
<!-- //initialize annonce favorite -->
<!-- //tab switching -->
<script type="text/javascript"> 
function editer() {
	
	document.getElementById("reNom").value = document.getElementById("nom").innerHTML;
	document.getElementById("rePrenom").value = document.getElementById("prenom").innerHTML;
	document.getElementById("reLieu").value = document.getElementById("lieu").innerHTML;
	document.getElementById("reEcole").value = document.getElementById("ecole").innerHTML;
	//radiobutton for sex
	if (document.getElementById("sexe").innerHTML === "Homme"){
		document.getElementById("sex-homme").checked = true;
	}
	else{
		document.getElementById("sex-femme").checked = true;
	}
	if (document.getElementById("haspet").innerHTML === "oui"){
		document.getElementById("haspet-yes").checked = true;
	}
	else{
		document.getElementById("haspet-no").checked = true;
	}
	if (user['birthday'] != null){
		document.getElementById("birthdaytext").value = user['birthday'].split('-').join('/');
	}
	//choose for profession
	setSelector("selectProfession",document.getElementById("profession").innerHTML);
	setSelector("selectSituation",document.getElementById("situationFam").innerHTML);
	setSelector("selectNationnalite",document.getElementById("nationnalite").innerHTML);
	setSelector("selectLoisir",document.getElementById("loisir").innerHTML);
	setSelector("selectLangue",document.getElementById("langue").innerHTML);
	
}
</script>
<!-- sent modify profile request -->
<script type="text/javascript">
function SendModifyRequest() {
	// Get input value
	var nom = document.getElementById("reNom").value;
	var prenom = document.getElementById("rePrenom").value;
	var sex;
	var haspet;
	if (document.getElementById("sex-homme").checked == true){
		sex = "0";
	}
	else{
		sex = "1";
	}
	if (document.getElementById("haspet-yes").checked == true){
		haspet = "1";
	}
	else{
		haspet = "0";
	}
	var lieu = document.getElementById("reLieu").value;
	var ecole = document.getElementById("reEcole").value;
	var birthday = document.getElementById("birthdaytext").value.split('/').join('-');
	var profession = document.getElementById("selectProfession").value;
	var situationFam = document.getElementById("selectSituation").value;
	var nationnalite = document.getElementById("selectNationnalite").value;
	var loisir = document.getElementById("selectLoisir").value;
	var langue = document.getElementById("selectLangue").value;
	// Verify 
	if (nom == "" || prenom == "" || lieu == "" || ecole == "" || birthday == "" ||
			profession == "" || situationFam == "" || nationnalite == "" || loisir == "" ||
			langue == "") {
		alert("Saisissez tous les informations de votre profile, svp");
	} else {
		var ProfileInfo = new Object();
		ProfileInfo.nom = nom;
		ProfileInfo.prenom = prenom;
		ProfileInfo.haspet = haspet;
		ProfileInfo.sex = sex;
		ProfileInfo.lieu = lieu;
		ProfileInfo.ecole = ecole;
		ProfileInfo.birthday = birthday;
		ProfileInfo.profession = profession;
		ProfileInfo.situationFam = situationFam;
		ProfileInfo.nationnalite = nationnalite;
		ProfileInfo.loisir = loisir;
		ProfileInfo.langue =  langue;
		ProfileInfo.annonce = '${AnnonceFavorite}';
		ProfileInfo.history = '${AnnonceHistorique}';
		post('/Yomate/espacePersonnel/modify/'+user['idUser'], ProfileInfo);
	}
}
</script>
<!-- send new annonce request -->
<script type="text/javascript">
function newAnnonce() {
	// Get input value
	var sex;
	var haspet;
	if (document.getElementById("annonceSex-homme").checked == true){
		sex = "0";
	}
	else{
		sex = "1";
	}
	if (document.getElementById("annoncePet-yes").checked == true){
		haspet = "1";
	}
	else{
		haspet = "0";
	}
	var lieu = document.getElementById("annonceLieu").value;
	var budget = document.getElementById("annonceBudget").value;
	var date_debut = document.getElementById("dateStart").value.split('/').join('-');
	var date_fin = document.getElementById("dateEnd").value.split('/').join('-');
	var dateProposer = "2017-06-12";
	var ageMin = document.getElementById("ageMin").value;
	var ageMax = document.getElementById("ageMax").value;
	var logement = document.getElementById("logement").value;
	var profession = document.getElementById("annonceProfession").value;
	var situationFam = document.getElementById("annonceSituation").value;
	var nationnalite = document.getElementById("annonceNationnalite").value;
	var loisir = document.getElementById("annonceLoisir").value;
	var langue = document.getElementById("annonceLangue").value;
	var description = document.getElementById("description").value;
	// Verify 
	if (date_debut == "" || date_fin == "" || lieu == "" || budget == "" || ageMin == "" || ageMax == "" ||
			profession == "" || situationFam == "" || nationnalite == "" || loisir == "" ||
			langue == ""|| description == "" || logement =="") {
		alert("Saisissez tous les informations de votre profile, svp");
	} else {
		var annonceInfo = new Object();
		annonceInfo.ageMin = ageMin;
		annonceInfo.ageMax = ageMax;
		annonceInfo.logement = logement;
		annonceInfo.haspet = haspet;
		annonceInfo.sex = sex;
		annonceInfo.dateProposer = dateProposer;
		annonceInfo.budget = budget;
		annonceInfo.lieu = lieu;
		annonceInfo.date_debut = date_debut;
		annonceInfo.date_fin = date_fin;
		annonceInfo.profession = profession;
		annonceInfo.situationFam = situationFam;
		annonceInfo.nationnalite = nationnalite;
		annonceInfo.loisir = loisir;
		annonceInfo.langue =  langue;
		annonceInfo.description = description;
		annonceInfo.annonce = '${AnnonceFavorite}';
		annonceInfo.profile = '${userProfile}';
		post('/Yomate/espacePersonnel/newAnnonce/'+user['idUser'], annonceInfo);
	}
}
</script>
<!-- //send new annonce request -->
</body>

</html>