<?php

require 'navigation.php';
require 'menu.php';
require 'util.php';
require 'body.php';
require 'pdo.php';

$hlp = new util();
$params=$hlp->getUrlParams($_SERVER['REQUEST_URI']);
$db = new dbconnect();
$conn = $db->getConnection();

$URL=$_SERVER['REQUEST_URI'];

$doc;
$doc = "<!DOCTYPE html>\n";
$doc .= "<html>\n";
$doc .= "	<head>\n";
$doc .= '	<title>Mastershop24</title>' . "\n";
$doc .= '	<meta charset="UTF-8" />' . "\n";
$doc .= '	<link rel="stylesheet" type="text/css" href="../../styles/css/bootstrap.css">' . "\n";
$doc .= '	<link rel="stylesheet" type="text/css" href="../../styles/css/style.css">' . "\n";
$doc .= '	<link rel="stylesheet" type="text/css" href="../../styles/css/layout.css">' . "\n";
$doc .= "</head>\n";
$doc .= "<body>\n";
$menu = new menu();
$menu->createmenu();
$doc .= '<div id="bodyAndNav">' . "\n";
$nav = new navigation();
$nav->createnav($URL);
$body = new body();
$body->createbody();
$doc .= '</div>' . "\n";
$doc .= '	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>' . "\n";
$doc .= '	<script type="text/javascript" src="../js/bootstrap.js"></script>' . "\n";
$doc .= '	<script type="text/javascript" src="../js/npm.js"></script>' . "\n";
$doc .= "</body>";
$doc .= "</html>";




echo $doc;
