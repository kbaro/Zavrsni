<?php

class FixturesController extends ProtectedController{

    function index(){
        $view = new View();
        $view->render(
            'fixtures/index',
            [
                "fixtures"=>Fixtures::read()
            ]
        );
    }

}