<?php

class OperatorController extends ProtectedController{

    function index(){
        $view = new View();
        $view->render(
            'operators/index',
            [
            "operator"=>Operator::read()
            ]
        );
    }
}