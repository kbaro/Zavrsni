<?php

class TableController extends ProtectedController
{

    public function index()
    {
        $view = new View;
        $view->render("table/index", ["table" => Table::read()]);
    }


}