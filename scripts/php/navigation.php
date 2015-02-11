<?php

class navigation {
    public function navigation(){
    }
    public function createnav() {
       global $doc;
       $doc .= '<div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Elektro</a></li>
            <li><a href="#">Kleidung</a></li>
            <li><a href="#">Sport</a></li>
            <li><a href="#">Motorsport</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nahrung</a></li>
            <li><a href="">Print</a></li>
            <li><a href="">Spielzeug</a></li>
            <li><a href="">Kleintiere</a></li>
            <li><a href="">Haushalt</a></li>
          </ul>
        </div>';
    }
}
