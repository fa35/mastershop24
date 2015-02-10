<?php

require 'navigation.php';
require 'menu.php';
require 'util.php';
require 'body.php';

$hlp = new util();
$params=$hlp->getUrlParams($_SERVER['REQUEST_URI']);

$URL=$_SERVER['REQUEST_URI'];

$doc;
$doc = "<!DOCTYPE html>\n";
$doc .= "<html>\n";
$doc .= "<head>\n";
$doc .= '<title>Mastershop24</title>' . "\n";
$doc .= '<link rel="stylesheet" type="text/css" href="./css/style.css">'."\n";
$doc .= "</head>\n";
$doc .= "<body>\n";
$menu = new menu();
$menu->createmenu();
$nav = new navigation();
$nav->createnav($URL);
$body = new body();
$body->createbody();
$doc .= "<p>foo</p>";
$doc .= $URL;
$doc .= "<br />";
foreach ($params as $key => $value){
    $doc .= $key . "=>" . $value . "<br />";
}
$doc .= "</body>";
$doc .= "</html>";




echo $doc;
