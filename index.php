<!DOCTYPE html>
<html>
<head>

	<title>Access Google Maps API in PHP</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/googlemap.js"></script>
	<style type="text/css">

			#map {
			width: 50%;
			height: 100%;
			border: 0px solid blue;
			margin-left: 50%;
			top: 50px;
			z-index: 12;
		}
		#data, #allData {
			display: none;
		}

h1,h2,h3,h4,h5,h6 {
    color: #000;
}

/*.list {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    grid-column-gap: 30px;
    padding: 0 30px;
}*/

.item {
  font-size: 14px;
  color: #333;
  cursor: pointer;
	margin-bottom: 2rem;
  transition: all 0.3s ease-out;
	border: 1px solid #eee;
}
.item:hover {
	box-shadow: 0 0 10px rgba( 0, 0, 0, .1);
	background-color: #eee;
}

.item h4 {
    margin: 1rem 0 0.5rem 0;
}

.item p {
    margin: 0 0 1rem 0;
}

.item img {
    width: calc(100% + 2px);
    margin-left: -2px;
    display: block;
}


@media only screen and (min-width: 1100px){
  .container {
    display: grid;
    grid-template-columns: 7fr 4fr;
    }

    .list {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-column-gap: 30px;
        padding: 0 20px;
        top: 0px;
    }

    #map {
        position: sticky !important;
        background-color: #cccccc;
        top: 0;
        right: 0;
        left: 0;
        height: 100vh;
    }

}

	</style>
</head>
<body>

	<!-- <div id="popup1" class="overlay">
		<div class="popup">
			<h2>Here i am</h2>
			<a class="close" href="#">&times;</a>
			<div class="content">
				Thank to pop me out of that button, but now i'm done so you can close this window.
			</div>
		</div>
	</div> -->


	<div class="container">
		<?php
			require_once('db/DbConnect.php');
			require 'education.php';
			$edu = new cartographie;
			$coll = $edu->getCollegesBlankLatLng();
			$coll = json_encode($coll, true);
			echo '<div id="data">' . $coll . '</div>';

			$allData = $edu->getAllColleges();
			$allData = json_encode($allData, true);
			echo '<div id="allData">' . $allData . '</div>';
		 ?>

</div>
		<div  id="layout 1" style="position: absolute; width: 50%;">
        <div class="list">
            <?php
            try{
    $pdo=new PDO("mysql:host=localhost;dbname=cartographie","root","");
}
catch(PDOException $e){
    echo $e->getMessage();
}
            $reponse = $pdo->query("SELECT * FROM etablissement");
            while ($donnees = $reponse->fetch()){
                 for($i = 0; $i< 30; $i++); ?>
                <div class="item js-marker" data-lat="latitude(43, 44)" data-lng="" data-price="">
                    <img src="https://via.placeholder.com/400x260" alt="">
                    <h4><?php echo $donnees['nomEtablissement_Etablissement']; ?></h4>
                    <p>
                    <?php echo $donnees['adresse_Etablissement'] .'<br/>'; ?>
                    </p>
                </div>
            <?php } // endfor; ?>
			</div>
		</div>
 </div>
		<div id="map"></div>

</div>
</body>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAa4-L3Yzluy5uJVUTqlrA5OKG6N8_EUtQ&libraries=places&callback=loadMap"></script>
<script src="https://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerwithlabel/src/markerwithlabel.js"></script>
</html>
