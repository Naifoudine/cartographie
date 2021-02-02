var map;
var geocoder;

//let marker: google.maps.Marker;

function loadMap() {
	var pune = {lat: -21.114533, lng: 55.532062};
    map = new google.maps.Map(document.getElementById('map'), {
      zoom: 12,
      center: pune
    });

    var cdata = JSON.parse(document.getElementById('data').innerHTML);
    geocoder = new google.maps.Geocoder();
    codeAdresse(cdata);

    var allData = JSON.parse(document.getElementById('allData').innerHTML);
    showAllColleges(allData)
}

function showAllColleges(allData) {
	var infoWind = new google.maps.InfoWindow;
	Array.prototype.forEach.call(allData, function(data){
		var content = document.createElement('div');
		content.style.display= "flex";


		//Ici vous avez le scripte pour l'image dans le contenraire du marker.
		var img = document.createElement('img');
		img.src = data.img;
		img.style.width = '100px';
		content.appendChild(img);
		var lycee = document.createElement('lycee');
		//Ici vous aurez les données à entrer.
		lycee.innerHTML += '<strong>' + data.nomEtablissement_Etablissement + '</strong>' + '<br />';
		lycee.innerHTML += data.adresse_Etablissement + '<br />';
		lycee.innerHTML +=  data.tel_Etablissement;
		content.appendChild(lycee);

		//Ici c'est le code pour placer les marker

 // marker = new google.maps.Marker({
 //   map,
 //   draggable: true,
 //   animation: google.maps.Animation.DROP,
 //   position: new google.maps.LatLng(data.lat, data.lng)
 // });
 // marker.addListener("click", toggleBounce);
//    infoWind.setContent(content);
//	infoWind.open(map, marker);
//}

//function toggleBounce() {
//  if (marker.getAnimation() !== null) {
//    marker.setAnimation(null);
//  } else {
 //   marker.setAnimation(google.maps.Animation.BOUNCE);
//}



		var marker = new google.maps.Marker({
	      position: new google.maps.LatLng(data.lat, data.lng),
	      map: map,
	      icon: "https://zupimages.net/up/21/04/8x3o.png"
	    });

	    marker.addListener('mouseover', function(){
	    	infoWind.setContent(content);
	    	infoWind.open(map, marker);
	    })
	})
}



function codeAdresse(cdata) {
   Array.prototype.forEach.call(cdata, function(data){
    	var adresse = data.nomEtablissement_Etablissement + '' + data.adresse_Etablissement;
	    geocoder.geocode( { 'adresse_Etablissement': adresse}, function(results, status) {
	      if (status == 'OK') {
	        map.setCenter(results[0].geometry.location);
	        var points = {};
	        points.idEtablissement_Etablissement = data.idEtablissement_Etablissement;
	        points.lat = map.getCenter().lat();
	        points.lng = map.getCenter().lng();
	        updateCollegeWithLatLng(points);
	      } else {
	        alert('Geocode was not successful for the following reason: ' + status);
	      }
	    });
	});
}

function updateCollegeWithLatLng(points) {
	$.ajax({
		url:"action.php",
		method:"post",
		data: points,
		success: function(res) {
			console.log(res)
		}
	})

}
