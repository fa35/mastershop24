<?php
$servername = "localhost";
$username = "root";
$password = "2h1fxL,Jtx";
$dbname = "mydb";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully\n";
    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }

$sql = "SELECT * FROM Artikel";

foreach ($conn->query($sql) as $row) {
        print $row['Titel'] . "\n";
    }


$conn->close();
