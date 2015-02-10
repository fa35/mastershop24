<?php

class navigation {
    public function navigation(){
    }
    public function createnav() {
       global $doc;
       $doc .= '<div id="navigation">'."\n";
       $doc .= "<ul><li>foo</li><li>bar</li></ul>"."\n"; 
       $doc .= "</div>"."\n";
    }
}
