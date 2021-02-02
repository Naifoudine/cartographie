<?php

	class cartographie	{

		private $idEtablissement_Etablissement;
		private $nomEtablissement_Etablissement;
		private $ville_Etablissement;
		private $adresse_Etablissement;
		private $tel_Etablissement;
		private $lat;
		private $lng;
		private $conn;
		private $tableName = "etablissement";
	  //private $tableName = "marqueur";

		function setIdEtablissement_Etablissement($idEtablissement_Etablissement) { $this->idEtablissement_Etablissement = $idEtablissement_Etablissement; }
		function setNomEtablissement_Etablissement($nomEtablissement_Etablissement) { $this->nomEtablissement_Etablissement = $nomEtablissement_Etablissement; }
		function getNomEtablissement_Etablissement() { return $this->nomEtablissement_Etablissement; }
		function setVille_Etablissement($ville_Etablissement) { $this->ville_Etablissement = $ville_Etablissement; }
		function getVille_Etablissement() { return $this->ville_Etablissement; }
		function setAdresse_Etablissement($adresse_Etablissement) { $this->adresse_Etablissement = $adresse_Etablissement; }
		function getAdresse_Etablissement() { return $this->adresse_Etablissement; }
		function setTel_Etablissement($tel_Etablissement) { $this->tel_Etablissement = $tel_Etablissement; }
		function getTel_Etablissement() { return $this->tel_Etablissement; }
		function setLat($lat) { $this->lat = $lat; }
		function getLat() { return $this->lat; }
		function setLng($lng) { $this->lng = $lng; }
		function getLng() { return $this->lng; }
		function setConn($conn) { $this->conn = $conn; }
		function getConn() { return $this->conn; }


		public function __construct() {
			require_once('db/DbConnect.php');
			$conn = new DbConnect;
			$this->conn = $conn->connect();
		}

		public function getCollegesBlankLatLng() {
			$sql = "SELECT * FROM $this->tableName WHERE lat IS NULL AND lng IS NULL";
			$stmt = $this->conn->prepare($sql);
			//$stmt->execute();
			return $stmt->fetchAll(PDO::FETCH_ASSOC);
		}

		public function getAllColleges() {
			$sql = "SELECT * FROM $this->tableName INNER JOIN marqueur ON etablissement.idEtablissement_Etablissement = marqueur.idEtablissement_Etablissement";
			$stmt = $this->conn->prepare($sql);
			$stmt->execute();
			return $stmt->fetchAll(PDO::FETCH_ASSOC);
		}

		public function updateCollegesWithLatLng() {
			$sql = "UPDATE $this->tableName SET lat = :lat, lng = :lng WHERE id = :id";
			$stmt = $this->conn->prepare($sql);
			$stmt->bindParam(':lat', $this->lat);
			$stmt->bindParam(':lng', $this->lng);
			$stmt->bindParam(':id', $this->id);

			if($stmt->execute()) {
				return true;
			} else {
				return false;
			}
		}
	}

?>
