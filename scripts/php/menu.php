<?php

class menu {
    public function menu(){
    }
    public function createmenu() {
       global $doc;
       $doc .= '<nav class="navbar navbar-inverse navbar-fixed-top">

	<div class="container-fluid">
        <div class="navbar-header">
			<div class="navbar-collapse collapse">
	            <ul class="nav navbar-nav">
	              <li class="active"><a href="#">MasterShop24</a></li>
	              <li><a href="#about">Über</a></li>

	              <li>
					<form class="navbar-form">
            			<input type="text" class="form-control" placeholder="Suche...">
          			</form>
          		  </li>

	              <li class="dropdown">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Mein MasterShop24<span class="caret"></span></a>
	                <ul class="dropdown-menu" role="menu">
	                  <li><a href="#">Login</a></li>
	                  <li><a href="#">Meine Daten</a></li>
	                  <li><a href="#">Meine Nachrichten</a></li>
	                  <li><a href="#">Logout</a></li>
	                </ul>
	              </li>

	            </ul>
	        </div>
        </div>
      </div>
    </nav>';
    }
}
