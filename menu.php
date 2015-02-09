<?php

class menu {
    public function menu(){
    }
    public function createmenu() {
       global $doc;
       $doc .= "<div id='menu'>\n<form>";
       $doc .= "<input name='loginuser' placeholder='email' />\n";
       $doc .= "<input name='loginpass' placeholder='password' />\n";
       $doc .= "</form></div>"."\n";
    }
}
