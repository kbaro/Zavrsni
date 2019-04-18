<?php

class FixturesController extends ProtectedController{



    function index($page = 1)
    {

        if ($page <= 0) {
            $page = 1;
        }
        if ($page === 1) {
            $previous = 1;
        }
        if ($page > 100){
            $page = 1;
        } else {
            $previous = $page - 1;
        }
        $next = $page + 1;

        $view = new View();
        $view->render(
            'fixtures/index',
            [
                "fixtures"=>Fixtures::read($page),
                "previous" => $previous,
                "next" => $next
            ]
        );
    }
	


}