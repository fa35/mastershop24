<?php

class dbconnect {
    var $servername = "localhost";
    var $username = "root";
    var $password = "re@47";
    var $dbname = "mydb";
    var $conn;

    function dbconnect(){
        try {
            $this->conn = new PDO("mysql:host=$this->servername;dbname=$this->dbname", $this->username, $this->password);
            // set the PDO error mode to exception
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            //echo "Connected successfully\n";
        }
        catch(PDOException $e){
            echo "Connection failed: " . $e->getMessage();
        }
    }

    function getConnection(){
        return $this->conn;
    }

    /*
    * @param $sqlQuery: Query as a string
    *
    * @return: Array with matching rows. Each row is an associative array with each select field
    */
    function getQueryResults($sqlQuery){

        //$sqlQuery = "SELECT * FROM Artikel";

        $result = Array();
        foreach ($this->conn->query($sqlQuery) as $row) {
            $result[] = $row;
        }
        return $result;
    }

    function closeConnection(){
        $this->conn->close();
    }
}
