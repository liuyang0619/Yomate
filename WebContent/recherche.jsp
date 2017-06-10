<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<title>Yomate - Page de Recherche</title>

<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8" />
<meta name="keywords" content="Yomate"/>
<!-- //for-mobile-apps -->

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

<!-- initAutocomplete -->
<script>
      function initAutocomplete() {
        autocomplete = new google.maps.places.Autocomplete(
        (document.getElementById('search-city')),
            {types: ['(cities)'], componentRestrictions: {country: "fr"}});
      }
</script>
<!-- //initAutocomplete -->

<!-- header & footer -->
<script type="text/javascript"> 
	$(function(){
		$("#header").load("/Yomate/header.jsp");
		$("#footer").load("/Yomate/footer.jsp");
	});
</script>
<!-- //header & footer -->

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>

<!-- datepicker1 -->
<script type="text/javascript">
$(function () {
    $('#datetimepicker1').datetimepicker({format: 'DD/MM/YYYY'});
});
</script>
<!-- //datepicker1 -->

<!-- datepicker2 -->
<script type="text/javascript">
$(function () {
    $('#datetimepicker2').datetimepicker({format: 'DD/MM/YYYY'});
});
</script>
<!-- //datepicker2 -->

<!-- go espace personnel -->
<script type="text/javascript">
function goToEP() {
	var user = getCookie("idUser");
	window.location.href = "/Yomate/espacePersonnel/" + user;
}
</script>
<!-- //go espace personnel -->

<!-- set search field -->
<script type="text/javascript">
function setSearchField(city) {
	var hasSearchValue = false;
	if (city !== "") {
		document.getElementById("search-city").value=city;
		hasSearchValue = true;
	}

	if (hasSearchValue === false) {
		$('#no-result').hide();
	}
}
</script>
<!-- //set search field -->

<!-- set result list -->
<script type="text/javascript">
function setResultList(jsonResults) {
	if (jsonResults === "") {
		$('#result-nb').hide();
		$('#no-result').show();
	} else {
		$('#no-result').hide();
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
							"<p class='list-group-item-text'  style = 'font-weight: bolder'>"+ getSex(results[i]['proposer_sex']) +", "+ jsGetAge(results[i]['proposer_birthday']) + " ans, "+ setUCfirst(results[i]['lieu']) + ", France</p>" +
							"<p class='list-group-item-text'>"+ results[i]['description'] + "</p>" +
						"</div>" +
					"</div>" +
			    "</div>" +
				"</a>";
			$('#result-list-group').append(listitem);
		}
	}
}
</script>
<!-- //set result list -->
</head>

<body>
<!-- header -->
	<div id="header"></div>
<!-- //header -->

<!-- page content -->
	<div class = "container">
		<div class = "row">
			 <!-- LEFT COLUMN -->
			<div class = "col-md-4">
			
				<!-- filtre d'annonce -->
				<div class = "search-notices-filter">
					<h3>Filtre d'announce</h3>
					<div class = "row top-margin-3">
						<div class = "col-md-3 search-filter-item-name">Ville</div>
						<div class = "col-md-9">
							<input type="text" class="form-control input-sm" id="search-city" placeholder="Nom de ville" autocomplete="on"></input>
  						</div>
					</div>
					
					<div class="row top-margin-3">
						<div class="col-md-3 search-filter-item-name">Budget</div>
						<div class="col-md-9">
							<div class="col-md-6 padding-0">
								<input type="text" class="form-control input-sm" placeholder="min"></input>
							</div>
							<div class="col-md-6 padding-0">
								<input type="text" class="form-control input-sm" placeholder="max"></input>
							</div>
						</div>
					</div>

					<!-- begin datepicker -->
					<div class = "row top-margin-3">
						<div class = "col-md-3 search-filter-item-name">Période</div>
						<div class = "col-md-9">
							<div class="col-md-2 padding-0" style="font-weight:bold;vertical-align:middle;">Du</div>
							<div class="col-md-10 padding-0">
								<div class="input-group" id="datetimepicker1">
				                    <input type="text" class="form-control input-sm" />
				                    <span class="input-group-addon">
				                        <span class="glyphicon glyphicon-calendar"></span>
				                    </span>
				                </div>
				             </div>
						</div>
			  		</div>
			  		<!-- //begin datepicker -->
			  		
			  		<!-- //end datepicker -->
			  		<div class = "row margin-0">
						<div class = "col-md-3 margin-0"></div>
						<div class = "col-md-9 margin-0">
							<div class="col-md-2 padding-0 margin-0" style="font-weight:bold;vertical-align:middle;">Au</div>
							<div class="col-md-10 padding-0 margin-0">
								<div class="input-group" id="datetimepicker2">
				                    <input type="text" class="form-control input-sm" />
				                    <span class="input-group-addon">
				                        <span class="glyphicon glyphicon-calendar"></span>
				                    </span>
				                </div>
				             </div>
						</div>
			  		</div>
			  		<!-- //end datepicker -->
			  		
					<div class = "row">
						<div class = "col-md-3 search-filter-item-name">Logement</div>
						<div class = "col-md-9">
							<select id="selectLogement" class="form-control">
								<option value="0" selected disabled></option>
								<option value="1">J'ai besoin de logement</option>
								<option value="2">J'ai un logement</option>
								<option value="3">Pas de logement, mais peu n'importe</option>
					    	</select>
			  			</div>
					</div>
				</div>
				<!-- //filtre d'annonce -->
				
				
				<!-- filtre de profil -->
				<div class = "search-profile-filter">
					<h3>Filtre de profil
						<button type="submit" class="icon-button">
							<span class="glyphicon glyphicon-edit"></span>
				  		</button>
					</h3>
					<hr class="margin-0"/>
					<div class="search-profile-priority">Obligatoire : </div>
					<hr class="margin-0"/>
					<div class="search-profile-priority">Important : </div>
					<hr class="margin-0"/>
					<div class="search-profile-priority">Vaut mieux être : </div>
				</div>
				<!-- //filtre de profil -->
				
				<!-- buttons -->
				<div class="search-buttons">
					<!-- search button -->
					<div class = "row">
						<a class="btn btn-success search-btn" href="#"><i class="icon-search icon-white"></i>Rechercher</a>
					</div>
					<!-- //search button -->
					
					<!-- create annonce button -->
					<div class = "row top-margin-5">
						<a class="btn btn-warning search-btn" href="PageAnnonce.jsp"><i class="icon-edit icon-white"></i>Créer votre Annonce</a>
					</div>
					<!-- create annonce button -->
					</div>				
				<!-- //buttons -->
			</div>
			 <!-- //LEFT COLUMN -->
			 
			 
			 <!-- RIGHT COLUMN -->
			 <div class = "col-md-8">
			 
				<!-- amelioration de profil -->
				<div class="search-improve-profile" style="cursor: pointer;" onclick="goToEP()">
						<h3>3 étapes pour un meilleur matching de profile</h3>
					<div class="row top-margin-5">
						<div class="col-md-4">
							<div class="glyphicon-ring">
								<span class="glyphicon glyphicon-user search-improve-icon"></span>
							</div>
							<p>Ajouter un photo</p>
						</div>
						<div class="col-md-4">
							<div class="glyphicon-ring">
								<span class="glyphicon glyphicon-question-sign search-improve-icon"></span>
							</div>
							<p>Répondre aux 5 questions</p>
						</div>
						<div class="col-md-4">
							<div class="glyphicon-ring">
								<span class="glyphicon glyphicon-th-list search-improve-icon"></span>
							</div>
							<p>Compléter votre profile</p>
						</div>
					</div>
				</div>
				<!-- //am??lioration de profil -->
	
				<!-- resultats de recherche -->
				<div class="search-result">
					<div id="result-nb" style="font-size:">Résultats :</div>
					<ul class="list-group top-margin-3" id="result-list-group">
					</ul>
					<div class="col-md-12" style="text-align:center;color:#000000;" id="no-result">
						Désolé, aucun résultat ne correspond à vos critères de sélection.
					</div>
				</div>
				<!-- //resultats de recherche -->
			</div>
			 <!-- //RIGHT COLUMN -->
	 	</div>
	</div>
<!-- //page content -->

<!-- footer -->
	<div id="footer"></div>
<!-- //footer -->

<!-- set value -->
<script type="text/javascript">
	setResultList('${results}');
	setSearchField('${city}');
</script>
<!-- //set value -->

<!-- for autoComplete working -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDBYWCDw3df4KmbFKZ-9e51hPizIipPnlM&libraries=places&callback=initAutocomplete"
        async defer></script>
<!-- //for autoComplete working -->
</body>
</html>