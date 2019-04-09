<?php

class TrophyController extends ProtectedController
{

    public function index()
    {
        $view = new View;
        $view->render("trophys/index", ["trophys" => Trophy::read()]);
    }




}