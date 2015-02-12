<?php
	require 'pdo.php';
     if ($_SERVER['REQUEST_METHOD'] == 'POST') {
		$db = new dbconnect();
		$conn = $db->getConnection();
      session_start();

      $user = $_POST['username'];
      $pass = $_POST['passwort'];

      $hostname = $_SERVER['HTTP_HOST'];
      $path = dirname($_SERVER['PHP_SELF']);

      // Benutzername und Passwort werden überprüft
      $sqlQuery = "SELECT Passwort FROM Nutzer WHERE Email='$user'";
      $refPass = $db->getQueryResults($sqlQuery)[0]['Passwort'];
      if ($pass == $refPass) {
       $_SESSION['angemeldet'] = true;

       // Weiterleitung zur geschützten Startseite
       if ($_SERVER['SERVER_PROTOCOL'] == 'HTTP/1.1') {
        if (php_sapi_name() == 'cgi') {
         header('Status: 303 See Other');
         }
        else {
         header('HTTP/1.1 303 See Other');
         }
        }

       header('Location: http://'.$hostname.($path == '/' ? '' : $path).'/index.php?login=success');
       exit;
       }
      } else { 
		  if ($_SERVER['SERVER_PROTOCOL'] == 'HTTP/1.1') {
        if (php_sapi_name() == 'cgi') {
         header('Status: 303 See Other');
         }
        else {
         header('HTTP/1.1 303 See Other');
         }
        }
		  header('Location: http://'.$hostname.($path == '/' ? '' : $path).'/index.php?login=failed');
		  exit;
	  }
