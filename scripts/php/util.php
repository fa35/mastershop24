<?php

class util {
    function util(){
    }

    public function getUrlParams($url){
        $url = explode('?',$url);
        if (count($url) > 1) {
	        $paramlist = explode('&',$url[1]);
	        foreach ($paramlist as $valuepair) {
	            $tmp = explode('=',$valuepair);
	            $param[$tmp[0]] = $tmp[1];
	        }
		} else {
			$param = '';
		}
        return $param;
    }
}
