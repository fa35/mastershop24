<?php

class dbconnect {
    var $servername = "localhost";
    var $username = "root";
    var $password = "2h1fxL,Jtx";
    var $dbname = "mydb";

    function dbconnect(){}

    function getConnection(){
        try {
            $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
            // set the PDO error mode to exception
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            echo "Connected successfully\n";
        }
        catch(PDOException $e){
            echo "Connection failed: " . $e->getMessage();
        }
        return $conn;
    }

    function getQueryResults($sqlQuery){

        $sqlQuery = "SELECT * FROM Artikel";

        $result = Array();
        foreach ($conn->query($sqlQuery) as $row) {
            $result[] = $row;
        }
        return $result;
    }

    function closeConnection(){
        $conn->close();
    }
}
