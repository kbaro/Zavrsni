<?php

class TrophyController{
    function index(){
        $view = new View();
        $view->render('trophy');
    }
}