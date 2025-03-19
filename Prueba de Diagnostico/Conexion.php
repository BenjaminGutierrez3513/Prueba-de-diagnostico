<?php
// Configuración de conexión
$serverName = "DESKTOP-JOSJTGN\SQLEXPRESS"; // Cambia por el nombre de tu servidor
$database = "InventarioProductos"; // Nombre de la base de datos
$username = "Benja"; // Usuario de SQL Server
$password = "..."; // Contraseña del usuario

// Conectar usando SQLSRV
$connectionOptions = array(
    "InventarioProductos" => $database,
    "Benja" => $username,
    "PWD" => $password,
    "CharacterSet" => "UTF-8"
);

// Intentar la conexión
$conn = sqlsrv_connect($serverName, $connectionOptions);

if ($conn === false) {
    die(print_r(sqlsrv_errors(), true)); // Muestra errores si falla
} else {
    echo "Conexión exitosa a SQL Server.";
}
?>
