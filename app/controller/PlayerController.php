<?php

class PlayerController{
    function index(){
        $view = new View();
        $view->render('player');
    }
}