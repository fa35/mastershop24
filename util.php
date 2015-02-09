<?php

class util {
    function util(){
    }

    public function getUrlParams($url){
        $url = explode('?',$url);
        $paramlist = explode('&',$url[1]);
        foreach ($paramlist as $valuepair) {
            $tmp = explode('=',$valuepair);
            $param[$tmp[0]] = $tmp[1];
        }
        return $param;
    }
}
