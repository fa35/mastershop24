<?php

class navigation {
    public function navigation(){
    }
    public function createnav() {
       global $doc;
       $doc .= '<div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="?category=1">Literatur</a></li>
            <li><a href="?category=2">Haushaltsgeräte</a></li>
          </ul>
        </div>';
    }
}
