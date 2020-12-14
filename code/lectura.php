<?php

    $servername = "localhost";
    $username = "root";
    $password = "miPassword";
    $dbname = "nombreBase";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Database Connection failed: " . $conn->connect_error);
    }
//Check tables estancias and logs
$compruebaTabla = "SELECT * FROM logs";
$result = mysqli_query($conn, $compruebaTabla);

if(empty($result)) {
$query="CREATE TABLE IF NOT EXISTS logs (
              station VARCHAR(255),
	      status VARCHAR(255),
	      Date VARCHAR(255),
	      Time VARCHAR(255))";
    if ($conn->query($query) === TRUE) {
                    echo "Tabla logs creada<br>";
                } else {
                    echo "Error creando tabla logs: " . $sql . "<br>" . $conn->error;
                }
}
$compruebaTabla = "SELECT * FROM estancias";
$result = mysqli_query($conn, $compruebaTabla);

if(empty($result)) {
$query="CREATE TABLE IF NOT EXISTS estancias (
		id int(11) AUTO_INCREMENT,
                estancia VARCHAR(255),
                PRIMARY KEY  (ID)
		)";
    if ($conn->query($query) === TRUE) {
                    echo "Tabla estancias creada<br>";
                } else {
                    echo "Error creando tabla estancias: " . $sql . "<br>" . $conn->error;
                }
}

    //Get current date and time
  
    $d = date("Y-m-d");
    //echo " Date:".$d."<BR>";
    $t = date("H:i:s");

    if(!empty($_POST['valor']) && !empty($_POST['estacion']))
    {
    $valor=$_POST['valor'];
$estacion=$_POST['estacion'];
$buscaEstancia="SELECT * FROM estancias WHERE estancia='".$estacion."'";
$result=$conn->query($buscaEstancia);
if ($result->num_rows== 0) {

echo "La estancia no está registrada\n";
$insertaEstacion="INSERT INTO estancias (estancia) VALUES ('".$estacion."')";
$result=$conn->query($insertaEstacion);
}
	    $sql = "INSERT INTO logs (station, status, Date, Time)
		
		VALUES ('".$estacion."', '".$valor."', '".$d."', '".$t."')";

		if ($conn->query($sql) === TRUE) {
		    echo "OK";
		} else {
		    echo "Error: " . $sql . "<br>" . $conn->error;
		}
}

?>
