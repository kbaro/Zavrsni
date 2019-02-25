<?php

class AboutController{
    function index(){
        $view = new View();
        $view->render('about');
    }
}