<?php
class ProtectedController
{

public function __construct(){
        if(!Session::getInstance()->isLogiran()){
            $view = new View();
            $view->render('index',["message"=>"You have no authority!"]);
            exit;
        }
    }

}