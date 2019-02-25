<?php

class ContactController{
    function index(){
        $view = new View();
        $view->render('contact');
    }
}