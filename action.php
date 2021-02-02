<?php
	require 'education.php';
	$edu = new cartographie;
	$edu->setId($_REQUEST['idEtablissement_Etablissement']);
	$edu->setLat($_REQUEST['lat']);
	$edu->setLng($_REQUEST['lng']);
	$status = $edu->updateCollegesWithLatLng();
	if($status == true) {
		echo "Updated...";
	} else {
		echo "Failed...";
	}
 ?>
