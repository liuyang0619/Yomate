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
});
</script>
<!-- //birthday picker -->

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
	var haspet;
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
<!-- captical letter -->
<script type="text/javascript">
function setUCfirst(string) 
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}
</script>
<!-- //captical letter -->
<script type="text/javascript">
function setResultList(jsonResults) {
	if (jsonResults === "") {
		$('#no-favorite').show();
	} else {
		$('#no-favorite').hide();
		var results = JSON.parse(jsonResults);
		for (var i = 0; i < results.length; i++) {
			var listitem = 
				"<a href=/Yomate/annonce/afficher/"+results[i]['idAnnonce']+" class='list-group-item'>" +
					"<div>" +
			    	"<h4 class='list-group-item-heading' style = 'font-size:18px'>Annonce 00" + results[i]['idAnnonce'] + "</h4>" +
				    "<div style = 'height:100px'>" +
				    	"<div style='float: left;'>" +
				    		"<img src='/Yomate/ressources/" + results[i]['image'] + "' class='img-thumbnail' style = 'height:100px;height:100px;'>" +
						"</div>" +
						"<div style='float: left;margin-left:10px'>" +
							"<p class='list-group-item-text'  style = 'font-weight: bolder; font-size:25px'>" + setUCfirst(results[i]['proposer_prenom']) + " "+ results[i]['proposer_nom'].toUpperCase() + "</p>" +
							"<p class='list-group-item-text'  style = 'font-weight: bolder'>"+ checkSex(results[i]['proposer_sex']) +", "+ jsGetAge(results[i]['proposer_birthday']) + " ans, "+ setUCfirst(results[i]['lieu']) + ", France</p>" +
							"<p class='list-group-item-text'>"+ results[i]['description'] + "</p>" +
						"</div>" +
					"</div>" +
			    "</div>" +
				"</a>";
			$('#favorite-list-group').append(listitem);
		}
	}
}
</script>
<!-- select -->
<script type="text/javascript">
function setSelector(select,val) {
	var tag = "0";
	for(var i=0;i<document.getElementById(select).options.length;i++)
    {
        if(document.getElementById(select).options[i].value == val)
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
											<button class = "btn btn-success search-btn perso-edit-btn" data-toggle="modal" data-target="#editInfo" onclick="editer()">Editer  <span class="glyphicon glyphicon-edit"></span></button>
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
							 
							</ul>				  	 
							<div class="resp-tabs-container">
								<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<ul class="list-group top-margin-3" id="favorite-list-group">
									</ul>
									<div class="col-md-12" style="text-align:center;color:#000000;" id="no-favorite">
										Vous n'avais pas d'annonce favoris, veuillez trouver les annonces.
									</div>
								</div>
							</div>
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
	    		<h4 class="modal-title">Editer votre profil</h4>
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
	    		
	    		<!-- Situation -->
	    		<div class="row top-margin-10">
	    			<label class="col-md-4" for="situation">Situation/Profession</label>
	    			<div class="form-group col-md-8">
						<select id="selectProfession" name="selectProfession" class="form-control">
							<option value="0" selected disabled></option>
							<option value="étudiant">étudiant</option>
							<option value="salarié">salarié</option>
							<option value="retraité">retraité</option>
							<option value="autre cadres">autre cadres</option>
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
							<option value="Française">Française</option>
							<option value="Chinoise">Chinoise</option>
							<option value="Italienne">Italienne</option>
							<option value="Russee">Russee</option>
							<option value="Bahamienne">Bahamienne</option>
							<option value="Autre">Autre</option>
					    </select>
					</div>
	    		</div>
	    		<!-- //Nationalité-->
	    		
	    		<!-- Langue parlé & Loisirs-->
	    		<div class="row">
	    			<!-- Langue parlé-->
	    			<label class="col-md-4" for="selectLangue">Language</label>
	    			<div class="col-md-8 form-group">
	    				<select id="selectLangue" name="selectLangue" class="form-control" required>
							<option value="0" selected disabled></option>
							<option value="Française">Française</option>
							<option value="Chinoise">Chinoise</option>
							<option value="Italienne">Italienne</option>
							<option value="Russee">Russee</option>
							<option value="Bahamienne">Bahamienne</option>
							<option value="Autre">Autre</option>
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
							<option value="voyage">voyage</option>
							<option value="sport">sport</option>
							<option value="cuisine">cuisine</option>
							<option value="jeux vidéo">jeux vidéo</option>
							<option value="lecture">lecture</option>
							<option value="Autre">Autre</option>
					    </select>
					</div>
	    		</div>
	    			<!-- //Loisirs-->
	    		
	    	</div>
	    		<!-- //Langue parlé & Loisirs-->

	    	
	    	<div class="modal-footer">
	    		<div class = "row">
	    			<div class="perso-edit-footer">
	    				<button type="button" class="btn button-caution button-pill" data-dismiss="modal">Annuler</button>
	    				<button type="button" class="btn button-action button-pill" data-dismiss="modal" onclick="editer()">Valider</button>
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
<!-- initialize variable -->
<script type="text/javascript"> 
	//alert('${userProfile}');
	var json = '${userProfile}';
	var user = JSON.parse(json);
	document.getElementById("nom").innerHTML = user[0]['nom'];
	document.getElementById("prenom").innerHTML = user[0]['prenom'];
	document.getElementById("age").innerHTML = jsGetAge(user[0]['birthday']);
	document.getElementById("sexe").innerHTML = checkSex(user[0]['sex']);
	document.getElementById("profession").innerHTML = user[0]['profession'];
	document.getElementById("haspet").innerHTML = checkHasPet(user[0]['haspet']);
	document.getElementById("nationnalite").innerHTML = user[0]['nationnalite'];
	document.getElementById("langue").innerHTML = user[0]['language'];
	document.getElementById("situationFam").innerHTML = user[0]['situationFam'];
	document.getElementById("loisir").innerHTML = user[0]['loisir'];
</script>
<!-- //initialize variable -->
<!-- initialize annonce favorite -->
<script type="text/javascript">
var jsonAnnonce = '${AnnonceFavorite}'
setResultList('${AnnonceFavorite}');
</script>
<!-- //initialize annonce favorite -->
<!-- //tab switching -->
<script type="text/javascript"> 
function editer() {
	document.getElementById("reNom").value = document.getElementById("nom").innerHTML;
	document.getElementById("rePrenom").value = document.getElementById("prenom").innerHTML;
	//radiobutton for sex
	if (document.getElementById("sexe").innerHTML === "Homme"){
		document.getElementById("sex-homme").checked = true;
	}
	else{
		document.getElementById("sex-femme").checked = true;
	}
	document.getElementById("birthdaytext").value = user[0]['birthday'].split('-').join('/');
	//choose for profession
	setSelector("selectProfession",document.getElementById("profession").innerHTML);
	setSelector("selectSituation",document.getElementById("situationFam").innerHTML);
	setSelector("selectNationnalite",document.getElementById("nationnalite").innerHTML);
	setSelector("selectLoisir",document.getElementById("loisir").innerHTML);
	setSelector("selectLangue",document.getElementById("langue").innerHTML);
	
}

</script>

</body>


</html>