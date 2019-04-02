<?php

class ResultsController extends ProtectedController{


    function index($page){


        $handle = curl_init();
        curl_setopt($handle, CURLOPT_URL, "https://fantasy.premierleague.com/drf/bootstrap-static?fbclid=IwAR2eVJXbk_mXBcgEbCcQnRbCiKoT5Jy0toJ3TeI8nwcswPfwFi167Tk7S7k/" . $page);
        curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
        $data = curl_exec($handle);
        curl_close($handle);

        $data = json_decode($data,true);
//echo "<pre>";
//print_r($data);
//echo "</pre>";
        if($data["r"]["i"]["v"]=="Data not available"){
            header("location: http://localhost/zavrsni//results/index/" . --$page);

            exit;
        }


        $p = $data["r"]["bd"];
        $results=[];
        foreach( $p as $k => $z){
            //echo $k . "<br />";
            $info=[];
            $info["results"] = "https://fantasy.premierleague.com/drf/bootstrap-static?fbclid=IwAR2eVJXbk_mXBcgEbCcQnRbCiKoT5Jy0toJ3TeI8nwcswPfwFi167Tk7S7k/" . substr($data["r"]["br"]["r" . substr($k,1)],1);
            $info["details"] = App::config("url") . "results" . $data["r"]["bs"]["m" . substr($k,1)]["i"] ;
            //echo "<img src=\"" . "http://athena.muo.hr/" . substr($data["r"]["br"]["r" . substr($k,1)],1) . "\" />";
            //echo "<a href=\"" . App::config("url") . "curl/detalji/" . $data["r"]["bs"]["m" . substr($k,1)]["i"] . "\">detalji</a><br />";
            $metainfo=[];
            foreach( $z as $k1 => $z1){
                //echo $k1 . "<br />";
                $metainf=[];
                foreach( $z1 as $k2 => $z2){


                    switch ($k2) {
                        case 'l':
                            $metainf["labela"] = $data["r"]["bl"][$z2];
                            break;

                        case 'v':
                            $metainf["vrijednost"] =  $data["r"]["bm"][$z2];
                            break;
                    }

                }
                $metainfo[]=$metainf;
            }

            foreach($metainfo as $mi){
                if($mi["result"]==="Inventarna oznaka"){
                    $info["naslov"]=$mi["vrijednost"];
                }
                if($mi["labela"]==="Književni naziv"){
                    $info["knjizevniNaziv"]=$mi["vrijednost"];
                }
            }

            $info["metainfo"]=$metainfo;
            $results[]=$info;
            //echo  "<hr />";
        }







        //echo gettype($data);

        $previous=$page-1;
        if($previous==0){
            $previous=1;
        }

        $next=$page+1;

        $view = new View();
        $view->render('curl',[
            "data" => $results,
            "next" => $next,
            "$previous" => $previous
        ]);
    }


    function details($id){


        $handle = curl_init();
        curl_setopt($handle, CURLOPT_URL, "https://fantasy.premierleague.com/drf/bootstrap-static?fbclid=IwAR2eVJXbk_mXBcgEbCcQnRbCiKoT5Jy0toJ3TeI8nwcswPfwFi167Tk7S7k/" . $id);
        curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
        $data = curl_exec($handle);
        curl_close($handle);

        $data = json_decode($data,true);
        //echo gettype($data);


        $view = new View();
        $view->render('resultdetails',[
            "results" => $data
        ]);
    }
}