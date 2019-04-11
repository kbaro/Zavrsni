<?php

class GoalscorerController extends ProtectedController{

    function index(){
        $view = new View();
        $view->render(
            'goalscorer/index',
            [
                "goalscorer"=>Goalscorer::read()
            ]
        );
    }
}